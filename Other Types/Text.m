//
//  Text.m
//  FHIR
//
//  Created by Adam Sippel on 2013-03-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Text.h"

@implementation Text

@synthesize div = _div;
@synthesize status = _status;

@synthesize textDictionary = _textDictionary;

- (id)init
{
    self = [super init];
    if (self) {
        _textDictionary = [[FHIRResourceDictionary alloc] init];
        _div = [[NSString alloc] init];
        _status = [[String alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _div = [self divStringClipper:_div];
    _textDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                            _div, @"div",
                                            [_status generateAndReturnDictionary], @"status",
                                            nil];
    _textDictionary.resourceName = @"Text";
    return _textDictionary.dataForResource;
}

- (void)textParser:(NSDictionary *)dictionary
{
    _div = [self divStringClipper:[dictionary objectForKey:@"div"]];
    [_status setValueString:[dictionary objectForKey:@"status"]];
}

- (NSString *)divStringClipper:(NSString *)stringToClip
{
    NSRange r;
    while ((r = [stringToClip rangeOfString:@"^(\\s*)\n(\\s*)$" options:NSRegularExpressionSearch]).location != NSNotFound)
    {
        //if ((r = [stringToClip rangeOfString:@"(.*)\n(.*)" options:NSRegularExpressionSearch]).location != NSNotFound)
        stringToClip = [stringToClip stringByReplacingCharactersInRange:r withString:@""];
    }
    return stringToClip;
}

@end
