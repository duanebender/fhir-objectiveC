//
//  Image.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Image.h"

@implementation Image

- (Code *)getMimeType
{
    return self.mimeType;
}

- (void)setMimeType:(Code *)value
{
    self.mimeType = value;
}

- (Base64Binary *)getContent
{
    return self.content;
}

- (void)setContent:(Base64Binary *)value
{
    self.content = value;
}

@end
