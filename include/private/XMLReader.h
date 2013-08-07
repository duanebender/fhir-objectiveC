//
//  XMLReader.h
//  FHIR
//
//  Created by Adam Sippel on 2013-03-04.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A custom xml reader for FHIR used to turn XML files into dictionaries
 */

#import <Foundation/Foundation.h>

@interface XMLReader : NSObject <NSXMLParserDelegate>
{
    NSMutableArray *dictionaryStack; //current location in the NSDictionary
    NSMutableString *textInProgress; //current text being grabbed
    NSError *errorPointer; //handle errors
}

+ (NSDictionary *)dictionaryForXMLData:(NSData *)data error:(NSError *)errorPointer; //This method turns xml Data into an NSDictionary
+ (NSDictionary *)dictionaryForXMLString:(NSString *)string error:(NSError *)errorPointer; //This method turns an xml string into an NSDictionary

@end
