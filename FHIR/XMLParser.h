//
//  XMLParser.h
//  PopulationFromXMLTest
//
//  Created by Geoffrey Pamerleau on 4/11/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class person;

@interface XMLParser : NSObject<NSXMLParserDelegate> {
	// an ad hoc string to hold element value
	NSMutableString *currentElementValue;
	// user object
	person *personToParse;
	// array of user objects
	NSMutableArray *people;
}

@property (nonatomic, retain) person *personToParse;
@property (nonatomic, retain) NSMutableArray *people;

-(NSMutableArray*)getPeople;
- (XMLParser *) initXMLParser;
- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict;
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName;
@end
