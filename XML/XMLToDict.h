//
//  XMLToDict.h
//  FHIR
//
//  Created by Adam Sippel on 2013-03-04.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Turns XML files into their correct FHIR Objects (Ex. Patient.xml creates a Patient Object)
 */

#import <Foundation/Foundation.h>
#import "Patient.h"
#import "XMLReader.h"

@interface XMLToDict : NSObject <NSXMLParserDelegate>

- (NSObject *)convertXmlToDictionary:(NSString *)urlString; //takes an xml file and turns it into it's cooresponding FHIR Object

@end
