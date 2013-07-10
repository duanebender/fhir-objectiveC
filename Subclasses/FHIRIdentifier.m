//
//  HumanId.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRIdentifier.h"
#import "FHIRExistanceChecker.h"

@implementation FHIRIdentifier

@synthesize identifierDictionary = _identifierDictionary;

@synthesize use = _use; //Identifies the use for this identifier, if known
@synthesize useSV = _useSV; //use string value of integer
@synthesize label = _label; //A label for the identifier that can be displayed to a human so they can recognise the identifier
@synthesize period = _period; //Time period during which identifier was valid for use
@synthesize system = _system; //Uri for system used
@synthesize iDKey = _iDKey; //key for the identifier

- (id)init
{
    self = [super init];
    if (self) {
        _identifierDictionary = [[FHIRResourceDictionary alloc] init];
        _label = [[FHIRString alloc] init];
        _period = [[FHIRPeriod alloc] init];
        _useSV = [[FHIRString alloc] init];
        _system = [[FHIRUri alloc] init];
        _iDKey = [[FHIRString alloc] init];
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

- (NSObject *)returnStringUse
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
            return [NSNull null];
    }
}

- (NSDictionary *)generateAndReturnDictionary
{
    _identifierDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                    [self returnStringUse], @"use",
                                                    [FHIRExistanceChecker emptyObjectChecker:[_label generateAndReturnDictionary]], @"label",
                                                    [FHIRExistanceChecker emptyObjectChecker:[_system generateAndReturnDictionary]], @"system",
                                                    [FHIRExistanceChecker emptyObjectChecker:[_iDKey generateAndReturnDictionary]], @"key",
                                                    [FHIRExistanceChecker emptyObjectChecker:[_period generateAndReturnDictionary]], @"period",
                                                    nil];
    _identifierDictionary.resourceName = @"Identifier";
    [_identifierDictionary cleanUpDictionaryValues];
    return _identifierDictionary.dataForResource;
}

- (void)identifierParser:(NSDictionary *)dictionary
{
    [_label setValueString:[dictionary objectForKey:@"label"]];
    [_iDKey setValueString:[dictionary objectForKey:@"key"]];
    [_system setValueURI:[dictionary objectForKey:@"system"]];
    [_period periodParser:[dictionary objectForKey:@"period"]];
    [self setValueUse:[dictionary objectForKey:@"use"]];
}

@end
