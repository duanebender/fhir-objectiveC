//
//  FHIRRange.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRRange.h"

@implementation FHIRRange

@synthesize rangeDictionary = _rangeDictionary; //resources for choice
@synthesize low = _low; //low limit.
@synthesize high = _high; //high limit.

- (id)init
{
    self = [super init];
    if (self) {
        _rangeDictionary = [[FHIRResourceDictionary alloc] init];
        _low = [[FHIRQuantity alloc] init];
        _high = [[FHIRQuantity alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _rangeDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [_low generateAndReturnDictionary], @"low",
                                         [_high generateAndReturnDictionary], @"high",
                                         nil];
    _rangeDictionary.resourceName = @"Range";
    [_rangeDictionary cleanUpDictionaryValues];
    return _rangeDictionary.dataForResource;
}

- (void)rangeParser:(NSDictionary *)dictionary
{
    [_low quantityParser:[dictionary objectForKey:@"low"]];
    [_high quantityParser:[dictionary objectForKey:@"high"]];
}

@end
