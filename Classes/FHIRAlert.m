//
//  Alert.m
//  FHIR
//
//  Created by Adam Sippel on 2013-05-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRAlert.h"

@implementation FHIRAlert

@synthesize alertDictionary = _alertDictionary; //a dictionary containing all resources in this alert object
@synthesize resourceTypeValue = _resourceTypeValue;
@synthesize category = _category; //Allows an alert to be divided int different categories like clinical, administartive etc.
@synthesize status = _status; //Supports basic workflow
@synthesize subject = _subject; //The person who this alert concerns (Patient)
@synthesize author = _author; //The person or device that created the alert (Practitioner/Patient/Device)
@synthesize note = _note; //The textual component of the alert to display to the user

- (id)init
{
    self = [super init];
    if (self) {
        _alertDictionary = [[FHIRResourceDictionary alloc] init];
        _resourceTypeValue = [[FHIRResource alloc] init];
        _category = [[FHIRCodeableConcept alloc] init];
        _status = [[FHIRCode alloc] init];
        _subject = [[FHIRResourceReference alloc] init];
        _author = [[FHIRResourceReference alloc] init];
        _note = [[FHIRString alloc] init];
    }
    return self;
}

//override method
- (NSString *)getResourceType
{
    return [_resourceTypeValue returnResourceType];
}

- (FHIRResourceDictionary *)generateAndReturnResourceDictionary
{
    _alertDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                  [_category generateAndReturnDictionary], @"category",
                                                  [_status generateAndReturnDictionary], @"status",
                                                  [_subject generateAndReturnDictionary], @"subject",
                                                  [_author generateAndReturnDictionary], @"author",
                                                  [_note generateAndReturnDictionary], @"note",
                                                  [_resourceTypeValue.text generateAndReturnDictionary], @"text",
                                                  [FHIRExistanceChecker generateArray:_resourceTypeValue.extensions], @"extension",
                                                  [FHIRExistanceChecker generateArray:_resourceTypeValue.contained], @"contained",
                                                  nil];
    [_alertDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_alertDictionary.dataForResource, @"Alert", nil];
    returnable.resourceName = @"alert";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)alertParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"alert"];
    NSDictionary *alertDict = [dictionary objectForKey:@"Alert"];
    //NSLog(@"%@", alertDict);
    
    [_resourceTypeValue resourceParser:alertDict];
    
    [_category codeableConceptParser:[alertDict objectForKey:@"category"]];
    [_status setValueCode:[alertDict objectForKey:@"status"]];
    [_subject resourceReferenceParser:[alertDict objectForKey:@"subject"]];
    [_author resourceReferenceParser:[alertDict objectForKey:@"author"]];
    [_note setValueString:[alertDict objectForKey:@"note"]];
    
}

@end
