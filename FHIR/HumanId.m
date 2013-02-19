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
    }
    return self;
}

- (void)setValueUse:(NSString *)codeString
{
    if ([codeString caseInsensitiveCompare:@"usual"]) self.use = IdentifierUseUsual;
    else if ([codeString caseInsensitiveCompare:@"official"]) self.use = IdentifierUseOfficial;
    else if ([codeString caseInsensitiveCompare:@"temp"]) self.use = IdentifierUseTemp;
    else self.use = 0;
    
};

- (NSString *)returnStringUse
{
    switch (self.use)
    {
        case IdentifierUseUsual:
            return @"usual";
            break;
        case IdentifierUseOfficial:
            return @"official";
            break;
        case IdentifierUseTemp:
            return @"temp";
            break;
            
        default:
            return @"?";
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

@end
