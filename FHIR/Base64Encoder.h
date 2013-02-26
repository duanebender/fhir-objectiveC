//
//  Base64Encoder.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-26.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base64Encoder

+ (NSString *)base64StringFromData:(NSData *)data length:(int)length;

@end
