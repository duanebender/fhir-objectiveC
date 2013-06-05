//
//  Subscriber.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Subscriber.h"

@implementation Subscriber

@synthesize subscriberDictionary = _subscriberDictionary; //a dictionary containing all resources in this subscriber object
@synthesize name = _name; //The name of the PolicyHolder.
@synthesize address = _address; //The mailing address, typically home, of the PolicyHolder.
@synthesize date = _date; //The date of birth of the PolicyHolder.

- (id)init
{
    self = [super init];
    if (self) {
        _subscriberDictionary = [[FHIRResourceDictionary alloc] init];
        _name = [[HumanName alloc] init];
        _address = [[Address alloc] init];
        _date = [[NSDate alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _subscriberDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                             [_name generateAndReturnDictionary], @"name",
                                             [_address generateAndReturnDictionary], @"address",
                                             [NSDateFormatter localizedStringFromDate:_date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"date",
                                             nil];
    _subscriberDictionary.resourceName = @"Subscriber";
    [_subscriberDictionary cleanUpDictionaryValues];
    return _subscriberDictionary.dataForResource;
}

- (void)subscriberParser:(NSDictionary *)dictionary
{
    [_name humanNameParser:[dictionary objectForKey:@"name"]];
    [_address addressParser:[dictionary objectForKey:@"address"]];
    _date = [ExistanceChecker generateDateTimeFromString:[dictionary objectForKey:@"date"]];
}

@end
