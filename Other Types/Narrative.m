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
@synthesize statusSV = _statusSV; //string value of status
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

- (void)setValueNarrative:(NSDictionary *)statusDictionary
{
    [_statusSV setValueString:statusDictionary];
    
    if ([_statusSV.value isEqualToString:@"generated"]) self.status = NarrativeStatusGenerated;
    else if ([_statusSV.value isEqualToString:@"extensions"]) self.status = NarrativeStatusExtensions;
    else if ([_statusSV.value isEqualToString:@"additional"]) self.status = NarrativeStatusAdditional;
    else if ([_statusSV.value isEqualToString:@"empty"]) self.status = NarrativeStatusEmpty;
    else self.status = 0;
};

- (NSDictionary *)returnStringNarrative
{
    switch (self.status)
    {
        case NarrativeStatusGenerated:
            return [_statusSV generateAndReturnDictionary];
            break;
        case NarrativeStatusExtensions:
            return [_statusSV generateAndReturnDictionary];
            break;
        case NarrativeStatusAdditional:
            return [_statusSV generateAndReturnDictionary];
            break;
        case NarrativeStatusEmpty:
            return [_statusSV generateAndReturnDictionary];
            break;
            
        default:
            return [[NSDictionary alloc] initWithObjectsAndKeys:@"?", @"value", nil];
    }
}

- (NSDictionary *)generateAndReturnDictionary
{
    _narrativeDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                    [self returnStringNarrative], @"status",
                                                    [_div generateAndReturnXhtmlNodeDictionary], @"div",
                                                    [ExistanceChecker generateArray:_image], @"image", //array of images only
                                                    nil];
    _narrativeDictionary.resourceName = @"Narrative";
    [_narrativeDictionary cleanUpDictionaryValues];
    return _narrativeDictionary.dataForResource;
}

- (void)narrativeParser:(NSDictionary *)dictionary
{
    [self setValueNarrative:[dictionary objectForKey:@"status"]];
    [_div xhtmlNodeParser:[dictionary objectForKey:@"div"]];
    
    //_image
    NSArray *imgArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"image"]];
    _image = [[NSMutableArray alloc] init];
    for (int i = 0; i < [imgArray count]; i++)
    {
        Image *tempS1 = [[Image alloc] init];
        [tempS1 imageParser:[imgArray objectAtIndex:i]];
        [_image addObject:tempS1];
        //NSLog(@"%@", _image);
    }
}

@end
