//
//  Base64Binary.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Base64Binary.h"

#define LENGTH 0 //encoded string length int

@implementation Base64Binary

@synthesize data = _data;

- (NSString *)getBase64BinaryDataAsEncodedString
{
    NSString *encodedString = [[NSString alloc] init];
    
    encodedString = [Base64Encoder base64StringFromData:_data length:LENGTH];
    
    return encodedString;
}

- (NSData *)decodeBase64String:(NSString *)encodedString
{
    NSData *decodedData = [[NSData alloc] init];
    decodedData = [Base64Decoder base64DataFromString:encodedString];
    
    return decodedData;
}

- (NSString *)encodeDataToBase64String:(NSData *)dataToEncode
{
    NSString *encodedString = [[NSString alloc] init];
    encodedString = [Base64Encoder base64StringFromData:dataToEncode length:LENGTH];
    
    return encodedString;
}

- (NSDictionary *)generateAndReturnDictionary
{
    NSDictionary *base64Dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[self getBase64BinaryDataAsEncodedString], @"value", nil];
    return base64Dictionary;
}

- (void)setValueBase64BinaryData:(NSDictionary *)dictionary
{
    _data = [Base64Decoder base64DataFromString:[dictionary objectForKey:@"value"]];
}

@end
