//
//  HumanId.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRHumanId.h"

@implementation FHIRHumanId

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
        _label = [[FHIRString alloc] init];
        _identifier = [[FHIRIdentifier alloc] init];
        _period = [[FHIRPeriod alloc] init];
        _assigner = [[FHIRResourceReference alloc] init];
        _useSV = [[FHIRString alloc] init];
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

- (NSDictionary *)generateAndReturnDictionary
{
    _humanIdDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                    [self returnStringUse], @"use",
                                                    [_label generateAndReturnDictionary], @"label",
                                                    [_identifier.idNumber generateAndReturnDictionary], @"id",
                                                    [_identifier.system generateAndReturnDictionary], @"system",
                                                    [_period generateAndReturnDictionary], @"period",
                                                    [_assigner generateAndReturnDictionary], @"assigner",
                                                    nil];
    _humanIdDictionary.resourceName = @"HumanId";
    [_humanIdDictionary cleanUpDictionaryValues];
    return _humanIdDictionary.dataForResource;
}

- (void)humanIdParser:(NSDictionary *)dictionary
{
    [_label setValueString:[dictionary objectForKey:@"label"]];
    [_identifier.idNumber setValueString:[dictionary objectForKey:@"id"]];
    [_identifier.system setValueURI:[dictionary objectForKey:@"system"]];
    [_period periodParser:[dictionary objectForKey:@"period"]];
    [_assigner resourceReferenceParser:[dictionary objectForKey:@"assigner"]];
    [self setValueUse:[dictionary objectForKey:@"use"]];
}

@end
