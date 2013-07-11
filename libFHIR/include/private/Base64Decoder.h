//
//  Base64Decoder.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-26.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Decodes base64binary encoded objects
 */

#import <Foundation/Foundation.h>

@class NSString;

@interface Base64Decoder : NSObject

+ (NSData *)base64DataFromString:(NSString *)string; //returns the decoded data from the encoded base64string

@end
