//
//  SaveAndPushToServer.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-08-14.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "SaveAndPushToServer.h"
#import "FHIRCommunication.h"

@implementation SaveAndPushToServer

+ (void)pushUpdatedPatientToServer:(FHIRPatient *)patientToPush dictionaryOfUpdates:(NSDictionary *)updatedPatientInfo
{
    
}

+ (void)pushNewPatientToServer:(NSDictionary *)patientInfoToConvertAndPush
{
    FHIRPatient *newPatient = [[FHIRPatient alloc] init];
    newPatient = [self returnPatientForDictionaryData:patientInfoToConvertAndPush];
}

+ (FHIRPatient *)returnPatientForDictionaryData:(NSDictionary *)dictionaryToConvertToPatient
{
    FHIRPatient *patientFromDictionary = [[FHIRPatient alloc] init];
    
    for (NSString *key in dictionaryToConvertToPatient)
    {
        if ([key isEqualToString:@"Name:"]) //personal info name
        {
            NSString *nameString = [[NSString alloc] initWithString:[dictionaryToConvertToPatient objectForKey:key]];
            NSArray *nameParts = [nameString componentsSeparatedByString:@" "];
            FHIRHumanName *humanNameObject = [[FHIRHumanName alloc] init];
    
            for (int i = 0; i < [nameParts count]; i++)
            {
                if ([nameParts objectAtIndex:i] == [nameParts lastObject])
                {
                    [humanNameObject.family addObject:[nameParts lastObject]];
                }
                else
                {
                    [humanNameObject.given addObject:[nameParts objectAtIndex:i]];
                }
            }
            [patientFromDictionary.name addObject:humanNameObject];
        }
        else if ([key isEqualToString:@"Gender:"]) //personal info gender
        {
            [patientFromDictionary.gender.coding addObject:[self returnGenderCode:dictionaryToConvertToPatient]];
        }
        else if ([key isEqualToString:@"Date Of Birth:"]) //personal info DOB
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd/MM/yyyy"];
            
            NSDate *date = [dateFormatter dateFromString:[dictionaryToConvertToPatient objectForKey:key]];
            patientFromDictionary.birthDate.value = date;
        }
        else if ([key isEqualToString:@"Marital Status:"]) //personal info marital Status
        {
            [patientFromDictionary.maritalStatus.coding addObject:[self returnMaritalStatus:dictionaryToConvertToPatient]];
        }
        else if ([key isEqualToString:@"Deceased:"]) //personal info deceased
        {
            patientFromDictionary.deceasedX = [[NSArray alloc] initWithArray:[NSArray arrayWithObject:[self returnDeceased:dictionaryToConvertToPatient]]];
        }
        else if ([key isEqualToString:@"Language:"]) //personal info language
        {
            NSString *communicationString = [[NSString alloc] initWithString:[dictionaryToConvertToPatient objectForKey:key]];
            
            FHIRCoding *codingObject = [[FHIRCoding alloc] init];
            codingObject.display.value = communicationString;
            
            FHIRCommunication *communicationObject = [[FHIRCommunication alloc] init];
            [communicationObject.language.coding addObject:codingObject];
            
            [patientFromDictionary.communication addObject:communicationObject];
        }
        else if ([key isEqualToString:@"Address:"]) //contact info address
        {
            NSString *addressString = [[NSString alloc] initWithString:[dictionaryToConvertToPatient objectForKey:key]];
            
            NSArray *tempArray = [addressString componentsSeparatedByString:@"\n"];
            FHIRAddress *addressObject = [[FHIRAddress alloc] init];
            
            for (int i = 0; i < [tempArray count]; i++)
            {
                [addressObject.line addObject:[tempArray objectAtIndex:i]];
            }
            
            [patientFromDictionary.address addObject:addressObject];
        }
        else if ([key isEqualToString:@"Home Phone:"]) //contact info home phone
        {
            FHIRContact *contactInfoObject = [[FHIRContact alloc] init];
            
            contactInfoObject.system = ContactSystemPhone;
            contactInfoObject.use = ContactUseHome;
            contactInfoObject.value.value = [dictionaryToConvertToPatient objectForKey:@"Home Phone:"];
            
            [patientFromDictionary.telecom addObject:contactInfoObject];
        }
        else if ([key isEqualToString:@"Work Phone:"]) //contact info work phone
        {
            FHIRContact *contactInfoObject = [[FHIRContact alloc] init];
            
            contactInfoObject.system = ContactSystemPhone;
            contactInfoObject.use = ContactUseWork;
            contactInfoObject.value.value = [dictionaryToConvertToPatient objectForKey:@"Work Phone:"];
            
            [patientFromDictionary.telecom addObject:contactInfoObject];
        }
        else if ([key isEqualToString:@"Cell Phone:"]) //contact info cell phone
        {
            FHIRContact *contactInfoObject = [[FHIRContact alloc] init];
            
            contactInfoObject.system = ContactSystemPhone;
            contactInfoObject.use = ContactUseMobile;
            contactInfoObject.value.value = [dictionaryToConvertToPatient objectForKey:@"Cell Phone:"];
            
            [patientFromDictionary.telecom addObject:contactInfoObject];
        }
        else if ([key isEqualToString:@"Fax:"]) //contact info fax
        {
            FHIRContact *contactInfoObject = [[FHIRContact alloc] init];
            
            contactInfoObject.system = ContactSystemFax;
            contactInfoObject.value.value = [dictionaryToConvertToPatient objectForKey:@"Fax:"];
            
            [patientFromDictionary.telecom addObject:contactInfoObject];
        }
        else if ([key isEqualToString:@"Email:"]) //contact info email
        {
            FHIRContact *contactInfoObject = [[FHIRContact alloc] init];
            
            contactInfoObject.system = ContactSystemEmail;
            contactInfoObject.value.value = [dictionaryToConvertToPatient objectForKey:@"Email:"];
            
            [patientFromDictionary.telecom addObject:contactInfoObject];
        }
        else if ([key isEqualToString:@"Siblings:"]) //additional info siblings
        {
            patientFromDictionary.multipleBirthX = [[NSArray alloc] initWithArray:[NSArray arrayWithObject:[self returnSiblings:dictionaryToConvertToPatient]]];
        }
        else if ([key isEqualToString:@"Active Status:"]) //additional info active status
        {
            NSString *status = [[NSString alloc] initWithString:[dictionaryToConvertToPatient objectForKey:key]];
            if ([status caseInsensitiveCompare:@"yes"] == NSOrderedSame || [status caseInsensitiveCompare:@"true"] == NSOrderedSame)
            {
                patientFromDictionary.active.value = true;
            }
            else
            {
                patientFromDictionary.active.value = false;
            }
        }
        else if ([key isEqualToString:@"Provider:"]) //additional info provider
        {
            patientFromDictionary.provider.type.value = [dictionaryToConvertToPatient objectForKey:key];
        }
        else if ([key isEqualToString:@"Linked Patients:"]) //additional info linked patients
        {
            NSArray *linkArray = [[dictionaryToConvertToPatient objectForKey:key] componentsSeparatedByString:@","];
            
            for (int i = 0; i < [linkArray count]; i++)
            {
                FHIRResourceReference *currentLink = [[FHIRResourceReference alloc] init];
                currentLink.reference.uri = [NSURL URLWithString:[linkArray objectAtIndex:i]];
                [patientFromDictionary.link addObject:currentLink];
            }
        }
        else if ([key isEqualToString:@"Species:"]) //animal section species
        {
            FHIRCoding *codeSpecies = [[FHIRCoding alloc] init];
            
            if ([[dictionaryToConvertToPatient objectForKey:key] caseInsensitiveCompare:@"dog"] == NSOrderedSame)
            {
                codeSpecies.code.value = @"canislf";
                codeSpecies.display.value = @"Dog";
            }
            else if ([[dictionaryToConvertToPatient objectForKey:key] caseInsensitiveCompare:@"sheep"] == NSOrderedSame)
            {
                codeSpecies.code.value = @"ovisa";
                codeSpecies.display.value = @"Sheep";
            }
            else if ([[dictionaryToConvertToPatient objectForKey:key] caseInsensitiveCompare:@"bird"] == NSOrderedSame)
            {
                codeSpecies.code.value = @"serinuscd";
                codeSpecies.display.value = @"Domestic Canary";
            }
            else
            {
                codeSpecies.code.value = @"UNK";
                codeSpecies.display.value = @"unknown";
            }
            
            [patientFromDictionary.animal.species.coding addObject:codeSpecies];
        }
        else if ([key isEqualToString:@"Breed:"]) //animal section breed
        {
            FHIRCoding *codeBreed = [[FHIRCoding alloc] init];
            
            if ([[dictionaryToConvertToPatient objectForKey:key] caseInsensitiveCompare:@"german shephard"] == NSOrderedSame)
            {
                codeBreed.code.value = @"gsd";
                codeBreed.display.value = @"German Shepherd Dog";
            }
            else if ([[dictionaryToConvertToPatient objectForKey:key] caseInsensitiveCompare:@"Irish Terrier"] == NSOrderedSame)
            {
                codeBreed.code.value = @"irt";
                codeBreed.display.value = @"Irish Terrier";
            }
            else if ([[dictionaryToConvertToPatient objectForKey:key] caseInsensitiveCompare:@"Tibetan Mastiff"] == NSOrderedSame)
            {
                codeBreed.code.value = @"tibmas";
                codeBreed.display.value = @"Tibetan Mastiff";
            }
            else if ([[dictionaryToConvertToPatient objectForKey:key] caseInsensitiveCompare:@"Golden Retriever"] == NSOrderedSame)
            {
                codeBreed.code.value = @"gret";
                codeBreed.display.value = @"Golden Retriever";
            }
            else
            {
                codeBreed.code.value = @"UNK";
                codeBreed.display.value = @"unknown";
            }
            
            [patientFromDictionary.animal.breed.coding addObject:codeBreed];
        }
        else if ([key isEqualToString:@"Gender Status:"]) //animal section gender status
        {
            FHIRCoding *codeGender = [[FHIRCoding alloc] init];
            
            if ([[dictionaryToConvertToPatient objectForKey:key] caseInsensitiveCompare:@"neutered"] == NSOrderedSame)
            {
                codeGender.code.value = @"neutered";
                codeGender.display.value = @"Neutered";
            }
            else if ([[dictionaryToConvertToPatient objectForKey:key] caseInsensitiveCompare:@"intact"] == NSOrderedSame)
            {
                codeGender.code.value = @"intact";
                codeGender.display.value = @"Intact";
            }
            else
            {
                codeGender.code.value = @"UNK";
                codeGender.display.value = @"unknown";
            }
            
            [patientFromDictionary.animal.genderStatus.coding addObject:codeGender];
        }
        else if ([key rangeOfString:@"Contact"].location != NSNotFound) //create contact object
        {
            [patientFromDictionary.contact addObject:[self returnPatientContact:dictionaryToConvertToPatient]];
        }
        else
        {
            NSLog(@"Invalid Key Was Passed");
        }
    }
    
    return patientFromDictionary;
}

#pragma mark - private methods

+ (FHIRCoding *)returnGenderCode:(NSDictionary *)dictionary
{
    NSString *genderString = [[NSString alloc] initWithString:[dictionary objectForKey:@"Gender:"]];
    FHIRCoding *codingObject = [[FHIRCoding alloc] init];
    
    if ([genderString caseInsensitiveCompare:@"male"] == NSOrderedSame)
    {
        codingObject.code.value = @"M";
        codingObject.display.value = @"Male";
    }
    else if ([genderString caseInsensitiveCompare:@"female"] == NSOrderedSame)
    {
        codingObject.code.value = @"F";
        codingObject.display.value = @"Female";
    }
    else if ([genderString caseInsensitiveCompare:@"female"] == NSOrderedSame)
    {
        codingObject.code.value = @"UN";
        codingObject.display.value = @"Undifferentiated";
    }
    else
    {
        codingObject.code.value = @"UNK";
        codingObject.display.value = @"unknown";
    }
    
    return codingObject;
}

+ (FHIRCoding *)returnMaritalStatus:(NSDictionary *)dictionary
{
    NSString *maritalStatusString = [[NSString alloc] initWithString:[dictionary objectForKey:@"Marital Status:"]];
    FHIRCoding *codingObject = [[FHIRCoding alloc] init];
    
    if ([maritalStatusString caseInsensitiveCompare:@"unmarried"] == NSOrderedSame)
    {
        codingObject.code.value = @"U";
        codingObject.display.value = @"unmarried";
    }
    else if ([maritalStatusString caseInsensitiveCompare:@"Annulled"] == NSOrderedSame)
    {
        codingObject.code.value = @"A";
        codingObject.display.value = @"Annulled";
    }
    else if ([maritalStatusString caseInsensitiveCompare:@"Divorced"] == NSOrderedSame)
    {
        codingObject.code.value = @"D";
        codingObject.display.value = @"Divorced";
    }
    else if ([maritalStatusString caseInsensitiveCompare:@"Interlocutory"] == NSOrderedSame)
    {
        codingObject.code.value = @"I";
        codingObject.display.value = @"Interlocutory";
    }
    else if ([maritalStatusString caseInsensitiveCompare:@"Legally Separated"] == NSOrderedSame)
    {
        codingObject.code.value = @"L";
        codingObject.display.value = @"Legally Separated";
    }
    else if ([maritalStatusString caseInsensitiveCompare:@"Married"] == NSOrderedSame)
    {
        codingObject.code.value = @"M";
        codingObject.display.value = @"Married";
    }
    else if ([maritalStatusString caseInsensitiveCompare:@"Polygamous"] == NSOrderedSame)
    {
        codingObject.code.value = @"P";
        codingObject.display.value = @"Polygamous";
    }
    else if ([maritalStatusString caseInsensitiveCompare:@"Never Married"] == NSOrderedSame)
    {
        codingObject.code.value = @"S";
        codingObject.display.value = @"Never Married";
    }
    else if ([maritalStatusString caseInsensitiveCompare:@"Domestic partner"] == NSOrderedSame)
    {
        codingObject.code.value = @"T";
        codingObject.display.value = @"Domestic partner";
    }
    else if ([maritalStatusString caseInsensitiveCompare:@"Widowed"] == NSOrderedSame)
    {
        codingObject.code.value = @"W";
        codingObject.display.value = @"Widowed";
    }
    else
    {
        codingObject.code.value = @"UNK";
        codingObject.display.value = @"unknown";
    }
    
    return codingObject;
}

+ (NSObject *)returnDeceased:(NSDictionary *)dictionary
{
    NSObject *deceasedObject = [[NSObject alloc] init];
    NSString *deceasedString = [[NSString alloc] initWithString:[dictionary objectForKey:@"Deceased:"]];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9][0-9]/[0-9][0-9]/[0-2][0-9][0-9][0-9]"
                                                                           options:0 error:NULL];
    NSTextCheckingResult *match = [regex firstMatchInString:deceasedString options:0 range:NSMakeRange(0, [deceasedString length])];
    
    if ([deceasedString caseInsensitiveCompare:@"yes"] == NSOrderedSame)
    {
        FHIRBool *deceasedBool = [[FHIRBool alloc] init];
        deceasedBool.value = true;
        deceasedObject = deceasedBool;
    }
    else if ([deceasedString caseInsensitiveCompare:@"no"] == NSOrderedSame)
    {
        FHIRBool *deceasedBool = [[FHIRBool alloc] init];
        deceasedBool.value = false;
        deceasedObject = deceasedBool;
    }
    else if (match)
    {
        FHIRDate *deceasedDate = [[FHIRDate alloc] init];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy"];
        
        NSDate *date = [dateFormatter dateFromString:deceasedString];
        deceasedDate.value = date;
        deceasedObject = deceasedDate;
    }
    else
    {
        FHIRBool *deceasedBool = [[FHIRBool alloc] init];
        deceasedBool.value = false;
        deceasedObject = deceasedBool;
    }
    
    return deceasedObject;
}

+ (NSObject *)returnSiblings:(NSDictionary *)dictionary
{
    NSObject *multiBirthObject = [[NSObject alloc] init];
    NSString *siblingsString = [[NSString alloc] initWithString:[dictionary objectForKey:@"Siblings:"]];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9][0-9]" options:0 error:NULL];
    NSTextCheckingResult *match = [regex firstMatchInString:siblingsString options:0 range:NSMakeRange(0, [siblingsString length])];
    
    if ([siblingsString caseInsensitiveCompare:@"yes"] == NSOrderedSame)
    {
        FHIRBool *siblingBool = [[FHIRBool alloc] init];
        siblingBool.value = true;
        multiBirthObject = siblingBool;
    }
    else if ([siblingsString caseInsensitiveCompare:@"no"] == NSOrderedSame)
    {
        FHIRBool *siblingBool = [[FHIRBool alloc] init];
        siblingBool.value = false;
        multiBirthObject = siblingBool;
    }
    else if (match)
    {
        NSNumber *siblingsNumber = [[NSNumber alloc] init];
        siblingsNumber = [NSNumber numberWithInt:[siblingsString intValue]];
        
        multiBirthObject = siblingsNumber;
    }
    else
    {
        FHIRBool *siblingBool = [[FHIRBool alloc] init];
        siblingBool.value = false;
        multiBirthObject = siblingBool;
    }
    
    return multiBirthObject;
}

+ (FHIRPatientContact *)returnPatientContact:(NSDictionary *)dictionary
{
    FHIRPatientContact *contactInfo = [[FHIRPatientContact alloc] init];
    for (NSString *key in dictionary)
    {
        if ([key isEqualToString:@"Contact Name:"])
        {
            FHIRHumanName *contactName = [[FHIRHumanName alloc] init];
        
            NSArray *names = [[dictionary objectForKey:key] componentsSeparatedByString:@" "];
        
            [contactName.given addObject:[names objectAtIndex:0]];
            [contactName.family addObject:[names lastObject]];
            contactInfo.name = contactName;
        }
        else if ([key isEqualToString:@"Contact Gender:"])
        {
            NSString *genderString = [[NSString alloc] initWithString:[dictionary objectForKey:key]];
            FHIRCoding *codingObject = [[FHIRCoding alloc] init];
            
            if ([genderString caseInsensitiveCompare:@"male"] == NSOrderedSame)
            {
                codingObject.code.value = @"M";
                codingObject.display.value = @"Male";
            }
            else if ([genderString caseInsensitiveCompare:@"female"] == NSOrderedSame)
            {
                codingObject.code.value = @"F";
                codingObject.display.value = @"Female";
            }
            else if ([genderString caseInsensitiveCompare:@"female"] == NSOrderedSame)
            {
                codingObject.code.value = @"UN";
                codingObject.display.value = @"Undifferentiated";
            }
            else
            {
                codingObject.code.value = @"UNK";
                codingObject.display.value = @"unknown";
            }
            
            [contactInfo.gender.coding addObject:codingObject];
        }
        else if ([key isEqualToString:@"Contact Organization:"])
        {
            NSString *organization = [[NSString alloc] initWithString:[dictionary objectForKey:key]];
            
            contactInfo.organization.display.value = organization;
        }
        else if ([key isEqualToString:@"Contact Address"])
        {
            NSArray *seperatesLines = [[dictionary objectForKey:key] componentsSeparatedByString:@"\n"];
            FHIRAddress *addressContact = [[FHIRAddress alloc] init];
            
            for (int i = 0; i < [seperatesLines count]; i++)
            {
                [addressContact.line addObject:[seperatesLines objectAtIndex:i]];
            }
            
            contactInfo.address = addressContact;
        }
        else if ([key isEqualToString:@"Contact Home Phone:"])
        {
    
        }
    }
    
    return contactInfo;
}

@end
