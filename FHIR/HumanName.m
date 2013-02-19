//
//  HumanName.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "HumanName.h"

@implementation HumanName

@synthesize humanNameDictionary = _humanNameDictionary;

@synthesize use = _use;
@synthesize text = _text; //a full text representation of the name
@synthesize family = _family; //Family name, this is the name that links to the genealogy. In some cultures (e.g. Eritrea) the family name of a son is the first name of his father.
@synthesize given = _given; //Given name. NOTE: Not to be called "first name" since given names do not always come first.
@synthesize prefix = _prefix; //Part of the name that is acquired as a title due to academic, legal, employment or nobility status, etc. and that comes at the start of the name
@synthesize suffix = _suffix; //Part of the name that is acquired as a title due to academic, legal, employment or nobility status, etc. and that comes at the end of the name
@synthesize period = _period; //Indicates the period of time when this name was valid for the named person.

- (id)init
{
    self = [super init];
    if (self) {
        _humanNameDictionary = [[FHIRResourceDictionary alloc] init];
        _text = [[String alloc] init];
        _family = [[NSMutableArray alloc] init];
        _given = [[NSMutableArray alloc] init];
        _prefix = [[NSMutableArray alloc] init];
        _suffix = [[NSMutableArray alloc] init];
        _period = [[Period alloc] init];
    }
    return self;
}

- (void)setValueUse:(NSString *)codeString
{
    if ([codeString caseInsensitiveCompare:@"usual"]) self.use = usual;
    else if ([codeString caseInsensitiveCompare:@"official"]) self.use = official;
    else if ([codeString caseInsensitiveCompare:@"temp"]) self.use = temp;
    else if ([codeString caseInsensitiveCompare:@"nickname"]) self.use = nickname;
    else if ([codeString caseInsensitiveCompare:@"annonymous"]) self.use = annonymous;
    else if ([codeString caseInsensitiveCompare:@"old"]) self.use = old;
    else if ([codeString caseInsensitiveCompare:@"maiden"]) self.use = maiden;
    else self.use = 0;
};

- (NSString *)returnStringUse
{
    switch (self.use)
    {
        case usual:
            return @"usual";
            break;
        case official:
            return @"official";
            break;
        case temp:
            return @"temp";
            break;
        case nickname:
            return @"nickname";
            break;
        case annonymous:
            return @"annonymous";
            break;
        case old:
            return @"old";
            break;
        case maiden:
            return @"maiden";
            break;
            
        default:
            return @"?";
    }
}

- (NSDictionary *)generateAndReturnHumanNameDictionary
{
    _humanNameDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [_text generateAndReturnDictionary], @"text",
                                          _family, @"family",
                                          _given, @"given",
                                          _prefix, @"prefix",
                                          _suffix, @"suffix",
                                          [_period generateAndReturnDictionary], @"period",
                                          nil];
    _humanNameDictionary.resourceName = @"HumanName";
    return _humanNameDictionary.dataForResource;
}

@end
