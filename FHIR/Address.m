//
//  Address.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-14.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Address.h"

@implementation Address

@synthesize addressDictionary = _addressDictionary; //dictionary of all resources for address

@synthesize use = _use; //Identifies the intended purpose of this address
@synthesize text = _text; //a full text representation of the address
@synthesize part = _part; //Part of an address line. Contains Strings only.
@synthesize line = _line; //A line of an address (typically used for street names & numbers, unit details, delivery hints, etc.). Contains String's only.
@synthesize city = _city; //The name of the city, town, village, or other community or delivery centre.
@synthesize state = _state; //Sub-unit of a country with limited sovereignty in a federally organized country. A code may be used if codes are in common use (i.e. US 2 letter state codes).
@synthesize zip = _zip; //A postal code designating a region defined by the postal service.
@synthesize country = _country; //Country. ISO 3166 3 letter codes can be used in place of a full country name.
@synthesize dpid = _dpid; //A value that uniquely identifies the postal address. (Often used in barcodes).
@synthesize period = _period; //Time period when address was/is in use.

- (id)init
{
    self = [super init];
    if (self) {
        _addressDictionary = [[FHIRResourceDictionary alloc] init];
        _text = [[String alloc] init];
        _part = [[NSMutableArray alloc] init];
        _line = [[NSMutableArray alloc] init];
        _city = [[String alloc] init];
        _state = [[String alloc] init];
        _zip = [[String alloc] init];
        _country = [[String alloc] init];
        _dpid = [[String alloc] init];
        _period = [[Period alloc] init];
    }
    return self;
}

- (void)setValueUse:(NSString *)codeString
{
    if ([codeString caseInsensitiveCompare:@"home"]) self.use = AddressUseHome;
    else if ([codeString caseInsensitiveCompare:@"work"]) self.use = AddressUseWork;
    else if ([codeString caseInsensitiveCompare:@"temp"]) self.use = AddressUseTemp;
    else if ([codeString caseInsensitiveCompare:@"old"]) self.use = AddressUseOld;
    else self.use = 0;
    
};

- (NSString *)returnStringUse
{
    switch (self.use)
    {
        case AddressUseHome:
            return @"home";
            break;
        case AddressUseWork:
            return @"work";
            break;
        case AddressUseTemp:
            return @"temp";
            break;
        case AddressUseOld:
            return @"old";
            break;
            
        default:
            return @"?";
    }
}

- (NSDictionary *)generateAndReturnAddressDictionary
{
    _addressDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [self returnStringUse], @"use",
                                          [_text generateAndReturnDictionary], @"text",
                                          _part, @"part", //strings only
                                          _line, @"line", //strings only
                                          [_city generateAndReturnDictionary], @"city",
                                          [_state generateAndReturnDictionary], @"state",
                                          [_zip generateAndReturnDictionary], @"zip",
                                          [_country generateAndReturnDictionary], @"country",
                                          [_dpid generateAndReturnDictionary], @"dpid",
                                          [_period generateAndReturnDictionary], @"period",
                                         nil];
    _addressDictionary.resourceName = @"Address";
    return _addressDictionary.dataForResource;
}

- (void)addressParser:(NSDictionary *)dictionary
{
    [self setValueUse:[dictionary objectForKey:@"use"]];
    [_text setValueString:[dictionary objectForKey:@"text"]];
    
    //_part
    NSArray *partArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"part"]];
    _part = [[NSMutableArray alloc] init];
    for (int i = 0; i < [partArray count]; i++)
    {
        String *tempS1 = [[String alloc] init];
        [tempS1 setValueString:[partArray objectAtIndex:i]];
        [_part addObject:tempS1];
        //NSLog(@"%@", _part);
    }
    
    //_line
    NSArray *lineArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"line"]];
    _line = [[NSMutableArray alloc] init];
    for (int i = 0; i < [lineArray count]; i++)
    {
        String *tempS2 = [[String alloc] init];
        [tempS2 setValueString:[lineArray objectAtIndex:i]];
        [_line addObject:tempS2];
        //NSLog(@"%@", _line);
    }
    
    [_city setValueString:[dictionary objectForKey:@"city"]];
    [_state setValueString:[dictionary objectForKey:@"state"]];
    [_zip setValueString:[dictionary objectForKey:@"zip"]];
    [_country setValueString:[dictionary objectForKey:@"country"]];
    [_dpid setValueString:[dictionary objectForKey:@"dpid"]];
    [_period periodParser:[dictionary objectForKey:@"period"]];
}

@end
