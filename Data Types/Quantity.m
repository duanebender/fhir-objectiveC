//
//  Quantity.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Quantity.h"

@implementation Quantity

@synthesize quantityDictionary = _quantityDictionary; //resources for quantity
@synthesize value = _value; //The value of the measured amount. The value includes an implicit precision in the presentation of the value.
@synthesize comparator = _comparator; //How the value should be understood and represented - whether the actual value is greater or less than the stated value due to measurement issues. E.g. if the comparator is "<" , then the real value is < stated value.
@synthesize units = _units; //A human readable form of the units.
@synthesize system = _system; //The identification of the system that provides the coded form of the unit.
@synthesize code = _code; //A computer processable form of the units in some unit representation system.

- (id)init
{
    self = [super init];
    if (self) {
        _quantityDictionary = [[FHIRResourceDictionary alloc] init];
        _value = [[NSNumber alloc] init];
        _comparator = [[Code alloc] init];
        _units = [[FHIRString alloc] init];
        _system = [[Uri alloc] init];
        _code = [[Code alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _quantityDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [_value stringValue], @"value",
                                           [_comparator generateAndReturnDictionary], @"comparator",
                                           [_units generateAndReturnDictionary], @"units",
                                           [_system generateAndReturnDictionary], @"system",
                                           [_code generateAndReturnDictionary], @"code",
                                           nil];
    _quantityDictionary.resourceName = @"Quantity";
    [_quantityDictionary cleanUpDictionaryValues];
    return _quantityDictionary.dataForResource;
}

- (void)quantityParser:(NSDictionary *)dictionary
{
    _value = [NSNumber numberWithDouble:[[dictionary objectForKey:@"value"] doubleValue]];
    [_comparator setValueCode:[dictionary objectForKey:@"comparator"]];
    [_units setValueString:[dictionary objectForKey:@"units"]];
    [_system setValueURI:[dictionary objectForKey:@"system"]];
    [_code setValueCode:[dictionary objectForKey:@"code"]];
}


@end
