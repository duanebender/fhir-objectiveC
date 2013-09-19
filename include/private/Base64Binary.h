//
//  Base64Binary.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * handles base64binary resources by encoding and decoding them as needed
 */

#import <Foundation/Foundation.h>
#import "FHIRType.h"
#import "Base64Encoder.h"
#import "Base64Decoder.h"

@interface Base64Binary : FHIRType

//following properties are individual parts of the Base64Binary Object that can be influenced Individually
@property (nonatomic) NSData *data; //data currently in this base64Binary such as an image

//Public Methods
- (NSString *)encodeDataToBase64String:(NSData *)dataToEncode; //returns encoded string for sent data if needed
- (NSData *)decodeBase64String:(NSString *)encodedString; //simply decodes string if needed
- (NSDictionary *)generateAndReturnDictionary; //returns NSdictionary of this base64binary encoded data
- (void)setValueBase64BinaryData:(NSDictionary *)dictionary; //sets data in this base64Binary object from encoded string in an NSdictionary

@end
