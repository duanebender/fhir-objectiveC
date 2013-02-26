//
//  Base64Binary.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"
#import "Base64Encoder.h"
#import "Base64Decoder.h"

@interface Base64Binary : Type

#warning - Should be an array of Bytes? Base 64 is usually an encoder?
@property (nonatomic) NSData *data;

- (NSDictionary *)generateAndReturnDictionary; //returns dictionary of base64 encoded binary for formatting
- (void)setValueBase64BinaryData:(NSDictionary *)dictionary; //sets data in base64Binary from encoded string in a dictionary

@end
