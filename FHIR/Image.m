//
//  Image.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Image.h"

@implementation Image

@synthesize mimeType = _mimeType;
@synthesize content = _content;

- (id)init
{
    self = [super init];
    if (self) {
        _mimeType = [[Code alloc] init];
        _content = [[Base64Binary alloc] init];
    }
    return self;
}

@end
