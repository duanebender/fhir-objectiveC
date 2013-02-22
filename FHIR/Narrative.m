//
//  Narrative.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Narrative.h"

@implementation Narrative

@synthesize status = _status; //The status of the narrative - whether it's entirely generated (from just the defined data or the extensions too), or whether a human authored it and it may contain additional data
@synthesize div = _div; //The actual narrative content, a stripped down version of XHTML
@synthesize image = _image; //array of images referred to directly in the xhtml

- (id)init
{
    self = [super init];
    if (self) {
        _narrativeDictionary = [[FHIRResourceDictionary alloc] init];
        _div = [[XhtmlNode alloc] init];
        _image = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setValueNarrative:(NSString *)codeString
{
    if ([codeString caseInsensitiveCompare:@"generated"]) self.status = NarrativeStatusGenerated;
    else if ([codeString caseInsensitiveCompare:@"extensions"]) self.status = NarrativeStatusExtensions;
    else if ([codeString caseInsensitiveCompare:@"additional"]) self.status = NarrativeStatusAdditional;
    else if ([codeString caseInsensitiveCompare:@"empty"]) self.status = NarrativeStatusEmpty;
    else self.status = 0;
};

- (NSString *)returnStringNarrative
{
    switch (self.status)
    {
        case NarrativeStatusGenerated:
            return @"generated";
            break;
        case NarrativeStatusExtensions:
            return @"generated";
            break;
        case NarrativeStatusAdditional:
            return @"generated";
            break;
        case NarrativeStatusEmpty:
            return @"generated";
            break;
            
        default:
            return @"?";
    }
}

- (NSDictionary *)generateAndReturnResourceReferenceDictionary
{
    _narrativeDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                    [self returnStringNarrative], @"status",
                                                    [_div generateAndReturnXhtmlNodeDictionary], @"div",
                                                    _image, @"image", //array of images only
                                                    nil];
    _narrativeDictionary.resourceName = @"Narrative";
    return _narrativeDictionary.dataForResource;
}

- (void)narrativeParser:(NSDictionary *)dictionary
{
    [self setValueNarrative:[dictionary objectForKey:@"status"]];
    //_div XHTML node
    //_image
}

@end
