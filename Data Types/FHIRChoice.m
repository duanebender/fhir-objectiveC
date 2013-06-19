//
//  FHIRChoice.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRChoice.h"
#import "FHIRChoiceOption.h"

@implementation FHIRChoice

@synthesize choiceDictionary = _choiceDictionary; //resources for choice
@synthesize code = _code; //Selected code.
@synthesize option = _option; //List of possible code values.
@synthesize isOrdered = _isOrdered; //If order of the values has meaning.

- (id)init
{
    self = [super init];
    if (self) {
        _choiceDictionary = [[FHIRResourceDictionary alloc] init];
        _code = [[FHIRCode alloc] init];
        _option = [[NSMutableArray alloc] init];
        _isOrdered = [[FHIRBool alloc] init];
    }
    return self;
}


- (NSDictionary *)generateAndReturnDictionary
{
    _choiceDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                             [_code generateAndReturnDictionary], @"code",
                                             [FHIRExistanceChecker generateArray:_option], @"option",
                                             [_isOrdered generateAndReturnDictionary], @"isOrdered",
                                             nil];
    _choiceDictionary.resourceName = @"Choice";
    [_choiceDictionary cleanUpDictionaryValues];
    return _choiceDictionary.dataForResource;
}

- (void)choiceParser:(NSDictionary *)dictionary
{
    [_code setValueCode:[dictionary objectForKey:@"code"]];
    
    //_option
    NSArray *optionArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"option"]];
    _option = [[NSMutableArray alloc] init];
    for (int i = 0; i < [optionArray count]; i++)
    {
        FHIRChoiceOption *tempCO = [[FHIRChoiceOption alloc] init];
        [tempCO choiceOptionParser:[optionArray objectAtIndex:i]];
        [_option addObject:tempCO];
        //NSLog(@"%@", _option);
    }
    
    [_isOrdered setValueBool:[dictionary objectForKey:@"isOrdered"]];
}

@end
