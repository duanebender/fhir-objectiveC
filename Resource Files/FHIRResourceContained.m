//
//  FHIRResourceContained.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-20.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRResourceContained.h"

@implementation FHIRResourceContained

@synthesize containedResourceDictionary = _containedResourceDictionary; //
@synthesize content = _content; //content of this content (ex base64binary string)
@synthesize contentId = _contentId; //id for this content (ex pic1)
@synthesize contentType = _contentType; //type of file contained (ex image/gif)
@synthesize contentName = _contentName;

- (id)init
{
    self = [super init];
    if (self) {
        _containedResourceDictionary = [[FHIRResourceDictionary alloc] init];
        _content = [[NSString alloc] init];
        _contentId = [[NSString alloc] init];
        _contentType = [[NSString alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _containedResourceDictionary.dataForResource = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                    _content, @"content",
                                                    _contentId, @"_id",
                                                    _contentType, @"contentType",
                                                    nil];
    
    [_containedResourceDictionary cleanUpDictionaryValues];
    
    NSDictionary *tempMasterDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          _containedResourceDictionary.dataForResource, [NSString stringWithFormat:@"%@",_contentName],
                                          nil];
    
    return tempMasterDictionary;
}

- (void)resourceContainedParser:(NSDictionary *)dictionary
{
    NSDictionary *tempContainer = [[NSDictionary alloc] init];
    for (NSString *key in dictionary)
    {
        _contentName = key;
        tempContainer = [dictionary objectForKey:key];
    }
    
    _content = [tempContainer objectForKey:@"content"];
    _contentId = [tempContainer objectForKey:@"_id"];
    _contentType = [tempContainer objectForKey:@"contentType"];

}

@end
