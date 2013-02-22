//
//  Image.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Image.h"

@implementation Image

@synthesize imageDictionary = _imageDictionary;

@synthesize mimeType = _mimeType;
@synthesize content = _content;

- (id)init
{
    self = [super init];
    if (self) {
        _imageDictionary = [[FHIRResourceDictionary alloc] init];
        _mimeType = [[Code alloc] init];
        _content = [[Base64Binary alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnImageDictionary
{
    _imageDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [_mimeType generateAndReturnDictionary], @"type",
                                            //[_content generateAndReturnDictionary], @"content",
                                            nil];
    _imageDictionary.resourceName = @"Image";
    return _imageDictionary.dataForResource;
}

- (void)imageParser:(NSDictionary *)dictionary
{
    [_mimeType setValueCode:[dictionary objectForKey:@"type"]];
    //_content
}

@end
