//
//  Base64Decoder.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-26.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSString;

@interface Base64Decoder : NSObject

+ (NSData *)base64DataFromString:(NSString *)string;

@end
