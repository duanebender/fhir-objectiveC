//
//  Base64Binary.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Base64Binary.h"

@interface Base64Binary()

#warning - Should be an array of Bytes
@property (nonatomic) Byte *byteArray;

@end

@implementation Base64Binary

- (Byte *)getValue
{
    return self.byteArray;
}

- (void)setValue:(Byte *)value
{
    self.byteArray = value;
}

@end
