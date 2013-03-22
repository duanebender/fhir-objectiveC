//
//  Extension.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-26.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Extension.h"
#import "ExistanceChecker.h"

@implementation Extension

@synthesize uri = _uri; //Source of the definition for the extension code - a logical name or a URL
@synthesize ref = _ref; //Internal reference to context of the extension - a pointer to an xml:id in the same resource
@synthesize mustUnderstand = _mustUnderstand; //If this element is set to true, then the containing resource element and its children are only safe to process if the reader understands this extension.
@synthesize value = _value; //Value of extension - may be a resource or one of a constraint set of the data types (see Extensibility in the spec for list)
@synthesize list = _list; //Nested Extensions - further extensions that are part of the extension

- (id)init
{
    self = [super init];
    if (self) {
        _extensionDictionary = [[FHIRResourceDictionary alloc] init];
        _uri = [[Uri alloc] init];
        _mustUnderstand = [[Bool alloc] init];
        _value = [[Type alloc] init];
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _extensionDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [_uri generateAndReturnDictionary], @"uri",
                                           [_mustUnderstand generateAndReturnDictionary], @"mustUnderstand",
                                           _value.xmlId, @"value",
                                           [ExistanceChecker generateArray:_list], @"list",
                                           nil];
    _extensionDictionary.resourceName = @"Extension";
    [_extensionDictionary cleanUpDictionaryValues];
    return _extensionDictionary.dataForResource;
}

- (void)extensionParser:(NSDictionary *)dictionary
{
    [_uri setValueURI:[dictionary objectForKey:@"uri"]];
    [_mustUnderstand setValueBool:[dictionary objectForKey:@"mustUnderstand"]];
    
    //_value
    _value = [[Type alloc] init];
    _value.xmlId = [dictionary objectForKey:@"value"];
    
    //_list
    NSArray *listArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"extensions"]];
    _list = [[NSMutableArray alloc] init];
    for (int i = 0; i < [listArray count]; i++)
    {
        Extension *tempS1 = [[Extension alloc] init];
        [tempS1 extensionParser:[listArray objectAtIndex:i]];
        [_list addObject:tempS1];
        //NSLog(@"%@", _list);
    }
}

@end
