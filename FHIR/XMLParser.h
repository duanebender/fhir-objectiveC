//
//  XMLParser.h
//  PopulationFromXMLTest
//
//  Created by Geoffrey Pamerleau on 4/11/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

//http://hl7connect.healthintersections.com.au/svc/fhir/patient/@300/history/@1?$format=xml == test link
//http://hl7connect.healthintersections.com.au/svc/fhir/patient/@300/history/@1?$format=json == test link
#warning - Under Development
/*


#import <Foundation/Foundation.h>


@class Patient;

@interface XMLParser : NSObject<NSXMLParserDelegate> {
	// an ad hoc string to hold element value
	NSMutableString *currentElementValue;
	// user object
	Patient *patientToParse;
	// array of user objects
	NSMutableArray *patients;
}

@property (nonatomic, retain) Patient *patientToParse;
@property (nonatomic, retain) NSMutableArray *patients;

-(NSMutableArray*)getPatient; //gets all the patients
- (XMLParser *) initXMLParser; //initializes parser
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
 */
