//
//  XMLParser.m
//  PopulationFromXMLTest
//
//  Created by Geoffrey Pamerleau on 4/11/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#warning - Under Development
/*


#import "XMLParser.h"
#import "Patient.h"



@implementation XMLParser
@synthesize patientToParse = _patientToParse;
@synthesize patients = _patients;

- (XMLParser *) initXMLParser {
	NSLog(@"Attempting Init");
	[super self];
	// init array of user objects 
	//[[Patient alloc] init];
	NSLog(@"Init Done");
	return self;
}

- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict{
	NSLog(@"Attmepting 1st method");
	if ([elementName isEqualToString:@"patiwnt"]) {
		NSLog(@"user element found – create a new instance of User class...");
		patientToParse = [[Patient alloc] init];
		//We do not have any attributes in the user elements, but if
		// you do, you can extract them here: 
		// user.att = [[attributeDict objectForKey:@"<att name>"] ...];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
		NSLog(@"Attmepting 1st method");
	if (!currentElementValue) {
		// init the ad hoc string with the value     
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	} else {
		// append value to the ad hoc string    
		[currentElementValue appendString:string];
	}
	NSLog(@"Processing value for : %@", string);
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
	NSLog(@"Parser error occured %@",parseError);
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
		NSLog(@"Attmepting 1st method");
	if ([elementName isEqualToString:@"PEOPLE"]) {
		// We reached the end of the XML document
		return;
	}
	
	if ([elementName isEqualToString:@"person"]) {
		// We are done with user entry – add the parsed user 
		// object to our user array
		[patients addObject:self.patientToParse];
		// release user object
		//[patientToParse release];
		patientToParse= nil;
	} else {
		// The parser hit one of the element values. 
		// This syntax is possible because User object 
		// property names match the XML user element names  
		[patientToParse setValue:currentElementValue forKey:elementName];
	}
	
	//[currentElementValue release];
	currentElementValue = nil;
}

-(NSMutableArray*)getPeople
{
	return patients;
}
// end of XMLParser.m file
@end
 
 */
