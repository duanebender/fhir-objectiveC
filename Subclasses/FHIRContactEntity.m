//
//  FHIRContactEntity.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-17.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRContactEntity.h"

@implementation FHIRContactEntity

@synthesize contactEntityDictionary = _contactEntityDictionary; //dictionary of all contactEntity resources
@synthesize type = _type; //Indicates a purpose for which the contact can be reached.
@synthesize name = _name; //A name associated with the contact.
@synthesize telecom = _telecom; //CONTAINS "Contact" OBJECTS ONLY. A contact detail (e.g. a telephone number or an email address) by which the party may be contacted.
@synthesize address = _address; //Visiting or postal addresses for the contact.

- (id)init
{
    self = [super init];
    if (self) {
        _contactEntityDictionary = [[FHIRResourceDictionary alloc] init];
        _type = [[FHIRCodeableConcept alloc] init];
        _name = [[FHIRHumanName alloc] init];
        _telecom = [[NSMutableArray alloc] init];
        _address = [[FHIRAddress alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _contactEntityDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                [_type generateAndReturnDictionary], @"type",
                                                [_name generateAndReturnDictionary], @"name",
                                                [FHIRExistanceChecker generateArray:_telecom], @"telecom",
                                                [_address generateAndReturnDictionary], @"address",
                                                nil];
    _contactEntityDictionary.resourceName = @"ContactEntity";
    [_contactEntityDictionary cleanUpDictionaryValues];
    return _contactEntityDictionary.dataForResource;
}

- (void)contactEntityParser:(NSDictionary *)dictionary
{
    [_type codeableConceptParser:[dictionary objectForKey:@"type"]];
    [_name humanNameParser:[dictionary objectForKey:@"name"]];
    
    //_telecom
    NSArray *telecomArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"telecom"]];
    _telecom = [[NSMutableArray alloc] init];
    for (int i = 0; i < [telecomArray count]; i++)
    {
        FHIRContact *tempCT = [[FHIRContact alloc] init];
        [tempCT contactParser:[telecomArray objectAtIndex:i]];
        [_telecom addObject:tempCT];
        //NSLog(@"%@", _telecom);
    }
    
    [_address addressParser:[dictionary objectForKey:@"address"]];
    
}

@end
