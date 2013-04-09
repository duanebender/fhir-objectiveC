//
//  XMLReader.m
//  FHIR
//
//  Created by Adam Sippel on 2013-03-04.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "XMLReader.h"

#define ARRAY_STRINGS [NSSet setWithObjects:@"given",@"family",@"prefix",@"suffix",@"link",@"identifier",@"name",@"telecom",@"address",@"language",@"part",@"line",@"coding",@"extensions",@"list",nil] //strings that need to be in an array even if only one object is present

NSString *const kXMLReaderTextNodeKey = @"value";

@interface XMLReader (Internal)

- (id)initWithError:(NSError *)error;
- (NSDictionary *)objectWithData:(NSData *)data;
- (NSArray *)enforceArray:(id)payload;

@end


@implementation XMLReader

#pragma mark -
#pragma mark Public methods

+ (NSDictionary *)dictionaryForXMLData:(NSData *)data error:(NSError *)error
{
    XMLReader *reader = [[XMLReader alloc] initWithError:error];
    NSDictionary *rootDictionary = [reader objectWithData:data];
    NSLog(@"%@",rootDictionary);
    return rootDictionary;
}

+ (NSDictionary *)dictionaryForXMLString:(NSString *)string error:(NSError *)error
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [XMLReader dictionaryForXMLData:data error:error];
}

- (NSMutableArray *)enforceArray:(id)payload
{
    if ([payload isKindOfClass:[NSMutableArray class]])
    {
        return payload;
    }else
    {
        if ([payload isKindOfClass:[NSNull class]] || (!payload)) return [NSMutableArray array];
        return [NSMutableArray arrayWithObject:payload];
    }
}

#pragma mark -
#pragma mark Parsing

- (id)initWithError:(NSError *)error
{
    if (self = [super init])
    {
        errorPointer = error;
    }
    return self;
}

- (NSDictionary *)objectWithData:(NSData *)data
{
    dictionaryStack = [[NSMutableArray alloc] init];
    textInProgress = [[NSMutableString alloc] init];
    
    // Initialize the stack with a fresh dictionary
    [dictionaryStack addObject:[NSMutableDictionary dictionary]];
    
    // Parse the XML
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    BOOL success = [parser parse];
    
    // Return the stack's root dictionary on success
    if (success)
    {
        NSDictionary *resultDict = [dictionaryStack objectAtIndex:0];
        return resultDict;
    }
    
    return nil;
}

#pragma mark -
#pragma mark NSXMLParserDelegate methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // Get the dictionary for the current level in the stack
    NSMutableDictionary *parentDict = [dictionaryStack lastObject];

    // Create the child dictionary for the new element, and initilaize it with the attributes
    NSMutableDictionary *childDict = [NSMutableDictionary dictionary];
    [childDict addEntriesFromDictionary:attributeDict];
    
    // If there's already an item for this key, it means we need to create an array
    id existingValue = [parentDict objectForKey:elementName];
    if (existingValue)
    {
        NSMutableArray *array = nil;
        if ([existingValue isKindOfClass:[NSMutableArray class]])
        {
            // The array exists, so use it
            array = (NSMutableArray *) existingValue;
        }
        else
        {
            // Create an array if it doesn't exist
            array = [NSMutableArray array];
            [array addObject:existingValue];

            // Replace the child dictionary with an array of children dictionaries
            [parentDict setObject:array forKey:elementName];
        }
        
        // Add the new child dictionary to the array
        [array addObject:childDict];
    }
    else
    {
        //check if needs to be an array even with one item
        if ([ARRAY_STRINGS containsObject:elementName])
        {
            [parentDict setObject:[self enforceArray:childDict] forKey:elementName];
        }
        else
        {
            // No existing value, so update the dictionary
            [parentDict setObject:childDict forKey:elementName];
        }
    }
    // Update the stack
    [dictionaryStack addObject:childDict];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // Update the parent dict with text info
    NSMutableDictionary *dictInProgress = [dictionaryStack lastObject];
    
    // Set the text property
    //check if text exists, if there is more than just spaces, and if it is within a div container.
    //XMLReader does not handle div containers properly, so this fixes that problem
    if ([textInProgress length] > 0 && ([dictInProgress objectForKey:@"div"]))
    {
        //remove all spaces
        NSArray *words = [textInProgress componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceCharacterSet]];
        NSString* nospacestring = [words componentsJoinedByString:@""];
        
        //remove all new line markers
        NSArray *content = [nospacestring componentsSeparatedByString:@"\n"];
        NSString *finalString = [content componentsJoinedByString:@""];
        
        //add to dictionary final edited string
        [dictInProgress setObject:finalString forKey:@"div"];//kXMLReaderTextNodeKey];
        //NSLog(@"%@", textInProgress);
        
        // Reset the text
        textInProgress = [[NSMutableString alloc] init];
    }
    
    // Pop the current dict
    [dictionaryStack removeLastObject];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    // Build the text value
    [textInProgress appendString:string];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    // Set the error pointer to the parser's error object
    errorPointer = parseError;
}

@end
