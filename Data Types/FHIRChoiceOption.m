//
//  FHIRChoiceOption.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRChoiceOption.h"

@implementation FHIRChoiceOption

@synthesize optionDictionary = _optionDictionary; //resources for option
@synthesize code = _code; //Possible code.
@synthesize display = _display; //Display for the code.

- (id)init
{
    self = [super init];
    if (self) {
        _optionDictionary = [[FHIRResourceDictionary alloc] init];
        _code = [[FHIRCode alloc] init];
        _display = [[FHIRString alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _optionDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [_code generateAndReturnDictionary], @"code",
                                         [_display generateAndReturnDictionary], @"display",
                                         nil];
    [_optionDictionary cleanUpDictionaryValues];
    return _optionDictionary.dataForResource;
}

- (void)choiceOptionParser:(NSDictionary *)dictionary
{
    [_code setValueCode:[dictionary objectForKey:@"code"]];
    [_display setValueString:[dictionary objectForKey:@"display"]];
}

@end
