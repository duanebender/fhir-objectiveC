//
//  HumanId.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "HumanId.h"

@implementation HumanId

@synthesize humanIdDictionary = _humanIdDictionary;

@synthesize use = _use; //Identifies the use for this identifier, if known
@synthesize useSV = _useSV; //use string value of integer
@synthesize label = _label; //A label for the identifier that can be displayed to a human so they can recognise the identifier
@synthesize identifier = _identifier; //The identifier itself
@synthesize period = _period; //Time period during which identifier was valid for use
@synthesize assigner = _assigner; //Organisation that issued/manages the identifier

- (id)init
{
    self = [super init];
    if (self) {
        _humanIdDictionary = [[FHIRResourceDictionary alloc] init];
        _label = [[String alloc] init];
        _identifier = [[Identifier alloc] init];
        _period = [[Period alloc] init];
        _assigner = [[ResourceReference alloc] init];
        _useSV = [[String alloc] init];
    }
    return self;
}

- (void)setValueUse:(NSDictionary *)useDictionary
{
    [_useSV setValueString:useDictionary];
    
    if ([_useSV.value caseInsensitiveCompare:@"usual"]) self.use = IdentifierUseUsual;
    else if ([_useSV.value caseInsensitiveCompare:@"official"]) self.use = IdentifierUseOfficial;
    else if ([_useSV.value caseInsensitiveCompare:@"temp"]) self.use = IdentifierUseTemp;
    else self.use = 0;
    
};

- (NSDictionary *)returnStringUse
{
    switch (self.use)
    {
        case IdentifierUseUsual:
            return [_useSV generateAndReturnDictionary];
            break;
        case IdentifierUseOfficial:
            return [_useSV generateAndReturnDictionary];
            break;
        case IdentifierUseTemp:
            return [_useSV generateAndReturnDictionary];
            break;
            
        default:
            return [[NSDictionary alloc] initWithObjectsAndKeys:@"?", @"value", nil];
    }
}

- (NSDictionary *)generateAndReturnHumanIdDictionary
{
    _humanIdDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                    [_label generateAndReturnDictionary], @"label",
                                                    [_identifier generateAndReturnDictionary], @"id",
                                                    [_period generateAndReturnDictionary], @"period",
                                                    [_assigner generateAndReturnResourceReferenceDictionary], @"assigner",
                                                    [self returnStringUse], @"use",
                                                    nil];
    _humanIdDictionary.resourceName = @"HumanId";
    return _humanIdDictionary.dataForResource;
}

- (void)humanIdParser:(NSDictionary *)dictionary
{
    [_label setValueString:[dictionary objectForKey:@"label"]];
    [_identifier identifierParser:[dictionary objectForKey:@"id"]];
    [_period periodParser:[dictionary objectForKey:@"period"]];
    [_assigner resourceReferenceParser:[dictionary objectForKey:@"assigner"]];
    [self setValueUse:[dictionary objectForKey:@"use"]];

}

@end
