//
//  Base64Encoder.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-26.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Encodes objects into base64binary
 */

#import <Foundation/Foundation.h>

@interface Base64Encoder : NSObject

+ (NSString *)base64StringFromData:(NSData *)data length:(int)length; //returns encodedstring from data

@end
