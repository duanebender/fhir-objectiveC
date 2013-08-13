//
//  AllPatientItemReturnMethods.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-25.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "AllPatientItemReturnMethods.h"
#import "FHIRCommunication.h"

@implementation AllPatientItemReturnMethods

+ (NSString *)returnPatientsName:(FHIRPatient *)patientToCheckNameOf
{
    NSMutableString *fullName = [[NSMutableString alloc] initWithString:@""];
    
    FHIRHumanName *patientName = [patientToCheckNameOf.name objectAtIndex:0];
    
    //given add on
    for (int i=0; [patientName.given count] > i; i++)
    {
        FHIRString *givenName = [patientName.given objectAtIndex:i];
        fullName = [NSString stringWithFormat:@"%@ %@", fullName, givenName.value];
    }
    
    //family add on
    for (int i=0; [patientName.family count] > i; i++)
    {
        FHIRString *familyName = [patientName.family objectAtIndex:i];
        fullName = [NSString stringWithFormat:@"%@ %@", fullName, familyName.value];
    }
    
    return fullName;
}

+ (NSString *)returnPatientsDOB:(FHIRPatient *)patientToCheckDOB
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    NSString *date = [dateFormatter stringFromDate:patientToCheckDOB.birthDate.value];
    
    if (date)
    {
        return date;
    }
    else
    {
        return @"N/A";
    }
}

+ (UIImage *)returnPatientDefaultImage:(FHIRPatient *)patientToCheckImage
{
    NSString *genderTypeString = [[NSString alloc] init];
    FHIRCoding *codeToCheck = [patientToCheckImage.gender.coding objectAtIndex:0];
    genderTypeString = codeToCheck.code.value;
    
    UIImage *imageForProfile = [[UIImage alloc] init];
    
    if([patientToCheckImage.photo count] != 0) //there is a profile picture
    {
        
    }
    else //use a default image
    {
        if ([patientToCheckImage.animal.species.coding count] != 0) //patient is animal
        {
            imageForProfile = [UIImage imageNamed:@"profile_pet.png"];
        }
        else
        {
            if ([patientToCheckImage.gender class] == [NSNull class]) //patient is human male
            {
                imageForProfile = [UIImage imageNamed:@"profile_male.png"];
            }
            else if ([genderTypeString isEqualToString:@"M"])
            {
                imageForProfile = [UIImage imageNamed:@"profile_male.png"];
            }
            else
            {
                imageForProfile = [UIImage imageNamed:@"profile_female.png"];
            }
        }
    }
    
    return imageForProfile;
}

+ (NSString *)returnPatientsGender:(FHIRPatient *)patientToCheckGender
{
    NSString *genderTypeString = [[NSString alloc] init];
    FHIRCoding *codeToCheck = [patientToCheckGender.gender.coding objectAtIndex:0];
    genderTypeString = codeToCheck.code.value;
    
    if ([genderTypeString isEqualToString:@"M"])
    {
        return @"Male";
    }
    else if ([genderTypeString isEqualToString:@"F"])
    {
        return @"Female";
    }
    else if ([genderTypeString isEqualToString:@"UN"])
    {
        return @"Undifferentiated"; //could not be uniquely defined as male or female
    }
    else //UNK for unknown
    {
        return @"unknown";
    }
}

+ (NSString *)returnPatientsMaritalStatus:(FHIRPatient *)patientToCheckMaritalStatus
{
    NSString *statusTypeString = [[NSString alloc] init];
    FHIRCoding *codeToCheck = [patientToCheckMaritalStatus.maritalStatus.coding objectAtIndex:0];
    statusTypeString = codeToCheck.code.value;
    
    if ([statusTypeString isEqualToString:@"U"]) //person is not married presently, but marital history is unknown.
    {
        return @"unmarried"; 
    }
    else if ([statusTypeString isEqualToString:@"A"]) //marriage contract considered null 
    {
        return @"Annulled"; 
    }
    else if ([statusTypeString isEqualToString:@"D"]) //divorced
    {
        return @"Divorced"; 
    }
    else if ([statusTypeString isEqualToString:@"I"]) //Subject to an Interocutory Decree
    {
        return @"Interlocutory";
    }
    else if ([statusTypeString isEqualToString:@"L"]) //legally seperated
    {
        return @"Legally Seperated";
    }
    else if ([statusTypeString isEqualToString:@"M"]) //Married currently
    {
        return @"Married";
    }
    else if ([statusTypeString isEqualToString:@"P"]) //more than 1 spouse
    {
        return @"Polygamous";
    }
    else if ([statusTypeString isEqualToString:@"S"]) //never entered a marriage contract
    {
        return @"Never Married";
    }
    else if ([statusTypeString isEqualToString:@"T"]) //declares domestic partner relationship exists
    {
        return @"Domestic Partner";
    }
    else if ([statusTypeString isEqualToString:@"W"]) //spouse has died
    {
        return @"Widowed";
    }
    else //unknown
    {
        return @"unknwon";
    }
}

+ (NSString *)returnPatientsDeceasedStatus:(FHIRPatient *)patientToCheckDeceased
{
    NSObject *deceasedObject = [patientToCheckDeceased.deceasedX objectAtIndex:0];
    
    if ([deceasedObject class] == [NSNull class])
    {
        return @"N/A";
    }
    else if ([deceasedObject class] == [FHIRDate class])
    {
        FHIRDate *deceasedDate = [patientToCheckDeceased.deceasedX objectAtIndex:0];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy"];
        
        NSString *date = [dateFormatter stringFromDate:deceasedDate.value];
        return date;
    }
    else if ([deceasedObject class] == [FHIRBool class])
    {
        FHIRBool *deceasedBool = [patientToCheckDeceased.deceasedX objectAtIndex:0];
        if (deceasedBool.value)
        {
            return @"Yes";
        }
        else
        {
            return @"No";
        }
    }
    else
    {
        return @"N/A";
    }
}

+ (NSString *)returnPatientsLanguage:(FHIRPatient *)patientToCheckLanguage
{

    if ([patientToCheckLanguage.communication count] != 0) //languages are available
    {
        NSMutableString *returnString = [[NSMutableString alloc] initWithString:@""];
        for (int i = 0; i < [patientToCheckLanguage.communication count]; i++)
        {
            FHIRCommunication *currentCommunication = [patientToCheckLanguage.communication objectAtIndex:i];
            FHIRCoding *codeForLanguage = [currentCommunication.language.coding objectAtIndex:0];
            NSString *stringLanguageToAdd = codeForLanguage.display.value;
            
            if (i == 0)
            {
                returnString = [[NSMutableString alloc] initWithFormat:@"%@",stringLanguageToAdd];
            }
            else
            {
                [returnString appendFormat:@", %@",stringLanguageToAdd];
            }
        }
        
        return returnString;
    }
    else //they have no language info
    {
        return @"N/A";
    }
}

+ (NSMutableString *)returnPatientsAddressInfo:(FHIRPatient *)patientToCheckAddress
{
    FHIRAddress *addressOfPatient = [patientToCheckAddress.address objectAtIndex:0];
    
    NSMutableString *fullAddress = [[NSMutableString alloc] initWithString:@""];
    
    for (int i = 0; i < [addressOfPatient.line count]; i++)
    {
        FHIRString *currentLine = [[FHIRString alloc] init];
        currentLine = [addressOfPatient.line objectAtIndex:i];
        [fullAddress appendFormat:@"%@ \n", currentLine.value];
    }
   
    return fullAddress;
}

+ (NSMutableDictionary *)returnPatientsTelecom:(FHIRPatient *)patientToFindPhone
{
    NSMutableDictionary *telecomContactDict = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *phoneDict = [[NSMutableDictionary alloc] init];
    
    if ([patientToFindPhone.telecom count] != 0)
    {
        for (int i = 0; i < [patientToFindPhone.telecom count]; i++)
        {
            FHIRContact *contactLine = [patientToFindPhone.telecom objectAtIndex:i];
            
            //check for home phone
            NSMutableString *homePhone = [[NSMutableString alloc] init];
            if (contactLine.use == ContactUseHome)
            {
                [homePhone setString:contactLine.value.value];
            }
            else
            {
                [homePhone setString:@"N/A"];
            }
            [phoneDict setObject:homePhone forKey:@"phoneHomeText"];
            
            //check for work phone
            NSMutableString *workPhone = [[NSMutableString alloc] init];
            if (contactLine.use == ContactUseWork)
            {
                [workPhone setString:contactLine.value.value];
            }
            else
            {
                [workPhone setString:@"N/A"];
            }
            [phoneDict setObject:workPhone forKey:@"phoneWorkText"];
            
            //check for cell phone
            NSMutableString *cellPhone = [[NSMutableString alloc] init];
            if (contactLine.use == ContactUseMobile)
            {
                [cellPhone setString:contactLine.value.value];
            }
            else
            {
                [cellPhone setString:@"N/A"];
            }
            [phoneDict setObject:cellPhone forKey:@"cellPhoneText"];
            
            //add in
            [telecomContactDict setObject:phoneDict forKey:@"Phone:"];
            
            //check for fax number
            NSMutableString *faxNumber = [[NSMutableString alloc] init];
            if (contactLine.system == ContactSystemFax)
            {
                [faxNumber setString:contactLine.value.value];
            }
            else
            {
                [faxNumber setString:@"N/A"];
            }
            [telecomContactDict setObject:faxNumber forKey:@"Fax:"];
            
            //check for email
            NSMutableString *email = [[NSMutableString alloc] init];
            if (contactLine.system == ContactSystemEmail)
            {
                [email setString:contactLine.value.value];
            }
            else
            {
                [email setString:@"N/A"];
            }
            [telecomContactDict setObject:email forKey:@"Email:"];
        } //end telecom for loop
    }
    return telecomContactDict;
}

+ (NSString *)returnPatientsMultipleBirth:(FHIRPatient *)patientToCheckMultipleBirthOf
{
    if ([[patientToCheckMultipleBirthOf.multipleBirthX objectAtIndex:0] class] == [FHIRInteger class]) //is number of siblings
    {
        FHIRInteger *siblingNumber = [patientToCheckMultipleBirthOf.multipleBirthX objectAtIndex:0];
        return [NSString stringWithFormat:@"%@",siblingNumber.value];
    }
    else if ([patientToCheckMultipleBirthOf.multipleBirthX class] == [FHIRBool class]) //is yes or no?
    {
        FHIRBool *siblingsYes = [patientToCheckMultipleBirthOf.multipleBirthX objectAtIndex:0];
        if (siblingsYes)
        {
            return @"Yes";
        }
        else
        {
            return @"No";
        }
    }
    else //null class or improper classification
    {
        return @"N/A";
    }
}

+ (NSString *)returnPatientsActiveStatus:(FHIRPatient *)patientToCheckActiveStatusOf
{
    if (patientToCheckActiveStatusOf.active.value)
    {
        return @"True";
    }
    else
    {
        return @"False";
    }
}

+ (NSString *)returnPatientsProvider:(FHIRPatient *)patientToCheckProviderOf
{
    if ([patientToCheckProviderOf.provider.display.value class] != [NSNull class])
    {
        return patientToCheckProviderOf.provider.display.value;
    }
    else
    {
        return @"N/A";
    }
}

+ (NSString *)returnPatientsLinkedToThisPatient:(FHIRPatient *)patientToCheckLinksTo
{
    NSMutableString *tempString = [[NSMutableString alloc] initWithString:@""];
    
    for (int i = 0; i < [patientToCheckLinksTo.link count]; i++)
    {
        NSString *toAppend = [[[[patientToCheckLinksTo.link objectAtIndex:i] reference] uri] absoluteString];

        if (i == 0)
        {
            [tempString appendFormat:@" %@",toAppend];
        }
        else
        {
            [tempString appendFormat:@",\n %@",toAppend];
        }
    }
    
    return tempString;
}

+ (NSString *)returnPatientAnimalSpecies:(FHIRPatient *)patientToCheckSpeciesOf
{
    if ([patientToCheckSpeciesOf.animal.species.coding count] != 0)
    {
        return [[[patientToCheckSpeciesOf.animal.species.coding objectAtIndex:0] display] value];
    }
    else
    {
        return @"N/A";
    }
    
}

+ (NSString *)returnPatientAnimalBreed:(FHIRPatient *)patientToCheckBreedOf
{
    if ([patientToCheckBreedOf.animal.breed.coding count] != 0)
    {
        return [[[patientToCheckBreedOf.animal.breed.coding objectAtIndex:0] display] value];
    }
    else
    {
        return @"N/A";
    }
}

+ (NSString *)returnPatientAnimalGenderStatus:(FHIRPatient *)patientToCheckGenderStatusOf
{
    NSString *statusTypeString = [[NSString alloc] init];
    FHIRCoding *codeToCheck = [patientToCheckGenderStatusOf.animal.genderStatus.coding objectAtIndex:0];
    statusTypeString = codeToCheck.code.value;
    
    if ([patientToCheckGenderStatusOf.animal.genderStatus.coding count] != 0)
    {
        if ([statusTypeString isEqualToString:@"neutered"])
        {
            return @"Neutered";
        }
        else if ([statusTypeString isEqualToString:@"intact"])
        {
            return @"Intact";
        }
        else
        {
            return @"Unknown";
        }
    }
    else
    {
        return @"N/A";
    }
}

+ (NSArray *)returnPatientsContactListItemsInAnArray:(FHIRPatient *)patientToGetContactsOf
{
    NSMutableArray *arrayOfPatientContactItems = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [patientToGetContactsOf.contact count]; i++)
    {
        NSMutableDictionary *currentContactDictionary = [[NSMutableDictionary alloc] init];
        FHIRPatientContact *contact = [[FHIRPatientContact alloc] init];
        contact = [patientToGetContactsOf.contact objectAtIndex:i];
        
        //if Patient Has Name
        NSMutableString *fullName = [[NSMutableString alloc] initWithString:@""];
        if ([contact.name class] != [NSNull class] || ([contact.name.given count] != 0 && [contact.name.family count] != 0)) //add their name to dictionary
        {
            if ([contact.name.given count] != 0)
            {
                FHIRString *givenName = [contact.name.given objectAtIndex:0];
                [fullName appendFormat:@"%@",givenName.value];
            }
            
            if ([contact.name.family count] != 0)
            {
                FHIRString *familyName = [contact.name.given objectAtIndex:0];
                [fullName appendFormat:@"%@",familyName.value];
            }  
        }
        else
        {
            fullName = [[NSMutableString alloc] initWithString:@"N/A"];
        }
        [currentContactDictionary setObject:fullName forKey:@"nameText"];
        //end patient name
        
        //if Patient has a gender
        NSMutableString *gender = [[NSMutableString alloc] init];
        NSString *genderTypeString = [[NSString alloc] init];
        if ([contact.gender.coding count] != 0)
        {
            FHIRCoding *codeToCheck = [contact.gender.coding objectAtIndex:0];
            genderTypeString = codeToCheck.code.value;
        
            if ([genderTypeString isEqualToString:@"M"])
            {
                [gender setString:@"Male"];
            }
            else if ([genderTypeString isEqualToString:@"F"])
            {   
                [gender setString:@"Female"];
            }
            else if ([genderTypeString isEqualToString:@"UN"])
            {
                [gender setString:@"Undifferentiated"]; //could not be uniquely defined as male or female
            }
            else //UNK for unknown
            {
                [gender setString:@"unknown"];
            }
        }
        else //no gender
        {
            [gender setString:@"N/A"];
        }
        [currentContactDictionary setObject:gender forKey:@"genderText"];
        //end patient gender
        
        //if Patient has relationship
        NSMutableString *relationshipString = [[NSMutableString alloc] init];
        if ([contact.relationship count] != 0)
        {
            FHIRCodeableConcept *relationship = [contact.relationship objectAtIndex:0];
            FHIRCoding *codingTemp = [relationship.coding objectAtIndex:0];
            [relationshipString setString:codingTemp.code.value];
        }
        else
        {
            [relationshipString setString:@"N/A"];
        }
        [currentContactDictionary setObject:relationshipString forKey:@"relationshipText"];
        //end relationship
        
        //if patient address
        if ([contact.address.line count] != 0)
        {
            NSMutableString *fullAddress = [[NSMutableString alloc] initWithString:@""];
            NSMutableDictionary *dictForAddress = [[NSMutableDictionary alloc] init];
            
            NSRegularExpression *streetRegex = [NSRegularExpression regularExpressionWithPattern:@"\\d{1,4}\\s[a-zA-Z]{2,30}\\s[a-zA-Z]{2,15}" options:NSRegularExpressionCaseInsensitive error:nil]; //street number regular expression
            NSRegularExpression *apptRegex = [NSRegularExpression regularExpressionWithPattern:@"?(apt|appt|ap)\\s*?(#)\\s[a-zA-Z0-9]{1,6}" options:NSRegularExpressionCaseInsensitive error:nil]; //appt number regular expression
            NSRegularExpression *cityStateRegex = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]{2,30},\\s*([A-Z]{2}|[a-zA-Z]{2,15})" options:NSRegularExpressionCaseInsensitive error:nil]; //city state regular expression
            NSRegularExpression *countryRegex = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]{2,40}\\s*[a-zA-Z]{2,40}*\\s*[a-zA-Z]{2,40}*" options:NSRegularExpressionCaseInsensitive error:nil]; //country regular expression
            NSRegularExpression *zipPostalRegex = [NSRegularExpression regularExpressionWithPattern:@"([a-zA-Z][0-9][a-zA-Z]\\s*[0-9][a-zA-Z][0-9]|[0-9]{5})" options:NSRegularExpressionCaseInsensitive error:nil]; //zip or postal code regular expression
            
            NSDictionary *regexForAddressValues = [[NSDictionary alloc] initWithObjectsAndKeys:
                                                   streetRegex, @"Street",
                                                   apptRegex, @"Appt",
                                                   cityStateRegex, @"CityState",
                                                   countryRegex, @"Country",
                                                   zipPostalRegex, @"ZipPostal",
                                                   nil];
            
            for (int i = 0; i < [contact.address.line count]; i++)
            {
                FHIRString *currentString = [contact.address.line objectAtIndex:i];
                [fullAddress appendFormat:@" %@",currentString.value];
            }
            
            for (NSString *key in regexForAddressValues)
            {
                NSRange r;
                if ([fullAddress rangeOfString:[regexForAddressValues objectForKey:key] options:NSRegularExpressionSearch].location != NSNotFound)
                {
                    r = [fullAddress rangeOfString:[regexForAddressValues objectForKey:key] options:NSRegularExpressionSearch];
                    [dictForAddress setObject:[fullAddress substringWithRange:r] forKey:key];
                }
            }
        
            //street
            if ([dictForAddress objectForKey:@"Street"])
            {
                [currentContactDictionary setObject:[dictForAddress objectForKey:@"Street"] forKey:@"addressStreetText"];
            }
            else
            {
                [currentContactDictionary setObject:@"N/A" forKey:@"addressStreetText"];
            }
        
            //appt
            if ([dictForAddress objectForKey:@"Appt"])
            {
                [currentContactDictionary setObject:[dictForAddress objectForKey:@"Appt"] forKey:@"addressApptText"];
            }
            else
            {
                [currentContactDictionary setObject:@"N/A" forKey:@"addressApptText"];
            }
        
            //citystate
            if ([dictForAddress objectForKey:@"CityState"])
            {
                [currentContactDictionary setObject:[dictForAddress objectForKey:@"CityState"] forKey:@"addressCityText"];
            }
            else
            {
                [currentContactDictionary setObject:@"N/A" forKey:@"addressCityText"];
            }
        
            //country
            if ([dictForAddress objectForKey:@"Country"])
            {
                [currentContactDictionary setObject:[dictForAddress objectForKey:@"Country"] forKey:@"addressCountryText"];
            }
            else
            {
                [currentContactDictionary setObject:@"N/A" forKey:@"addressCountryText"];
            }   
        
            //country
            if ([dictForAddress objectForKey:@"ZipPostal"])
            {
                [currentContactDictionary setObject:[dictForAddress objectForKey:@"ZipPostal"] forKey:@"addressPostalText"];
            }
            else
            {
                [currentContactDictionary setObject:@"N/A" forKey:@"addressPostalText"];
            }
            
        }
        else
        {
            [currentContactDictionary setObject:@"N/A" forKey:@"addressStreetText"];
            [currentContactDictionary setObject:@"N/A" forKey:@"addressApptText"];
            [currentContactDictionary setObject:@"N/A" forKey:@"addressCityText"];
            [currentContactDictionary setObject:@"N/A" forKey:@"addressCountryText"];
            [currentContactDictionary setObject:@"N/A" forKey:@"addressPostalText"];
        }
        //end address
        
        //if patient has phone
        if ([contact.telecom count] != 0)
        {
            for (int i = 0; i < [contact.telecom count]; i++)
            {
                FHIRContact *contactLine = [contact.telecom objectAtIndex:i];
                
                //check for home phone
                NSMutableString *homePhone = [[NSMutableString alloc] init];
                if (contactLine.use == ContactUseHome)
                {
                    [homePhone setString:contactLine.value.value];
                }
                else
                {
                    [homePhone setString:@"N/A"];
                }
                [currentContactDictionary setObject:homePhone forKey:@"homePhoneText"];
                
                //check for work phone
                NSMutableString *workPhone = [[NSMutableString alloc] init];
                if (contactLine.use == ContactUseWork)
                {
                    [workPhone setString:contactLine.value.value];
                }
                else
                {
                    [workPhone setString:@"N/A"];
                }
                [currentContactDictionary setObject:workPhone forKey:@"workPhoneText"];
                
                //check for cell phone
                NSMutableString *cellPhone = [[NSMutableString alloc] init];
                if (contactLine.use == ContactUseMobile)
                {
                    [cellPhone setString:contactLine.value.value];
                }
                else
                {
                    [cellPhone setString:@"N/A"];
                }
                [currentContactDictionary setObject:cellPhone forKey:@"cellPhoneText"];
                
                //check for fax number
                NSMutableString *faxNumber = [[NSMutableString alloc] init];
                if (contactLine.system == ContactSystemFax)
                {
                    [faxNumber setString:contactLine.value.value];
                }
                else
                {
                    [faxNumber setString:@"N/A"];
                }
                [currentContactDictionary setObject:faxNumber forKey:@"faxText"];
                
                //check for email
                NSMutableString *email = [[NSMutableString alloc] init];
                if (contactLine.system == ContactSystemEmail)
                {
                    [email setString:contactLine.value.value];
                }
                else
                {
                    [email setString:@"N/A"];
                }
                [currentContactDictionary setObject:email forKey:@"emailText"];
            } //end telecom for loop
        }
        else
        {
            [currentContactDictionary setObject:@"N/A" forKey:@"homePhoneText"];
            [currentContactDictionary setObject:@"N/A" forKey:@"workPhoneText"];
            [currentContactDictionary setObject:@"N/A" forKey:@"cellPhoneText"];
            [currentContactDictionary setObject:@"N/A" forKey:@"faxText"];
            [currentContactDictionary setObject:@"N/A" forKey:@"emailText"];
        }
        //end patient telecom if check
        
        //if Patient is an organization
        NSMutableString *organizationString = [[NSMutableString alloc] init];
        if ([contact.organization class] != [NSNull class])
        {
            [organizationString setString:contact.organization.display.value];
        }
        else
        {
            [organizationString setString:@"N/A"];
        }
        [currentContactDictionary setObject:organizationString forKey:@"organizationText"];
        //end organization
    
        //add contact to the array
        [arrayOfPatientContactItems addObject:currentContactDictionary];
        NSLog(@"%@",arrayOfPatientContactItems);
        
    } //end for loop

    return arrayOfPatientContactItems;
}

+ (NSMutableArray *)generateSectionsArrayForPatientListing:(FHIRPatient *)patientToBuildSectionsFor
{
    NSMutableArray *sectionArrayToBuild = [[NSMutableArray alloc] init];
    
    //section patient info needed?
    if ([patientToBuildSectionsFor.name count] > 0 || [patientToBuildSectionsFor.birthDate class] != [NSNull class] || [patientToBuildSectionsFor.maritalStatus class] != [NSNull class] || [patientToBuildSectionsFor.deceasedX class] != [NSNull class] || [patientToBuildSectionsFor.communication count] > 0)
    {
        [sectionArrayToBuild addObject:@"Personal Info"];
    }
    
    //section contact info needed?
    if ([patientToBuildSectionsFor.address count] > 0 || [patientToBuildSectionsFor.telecom count] > 0)
    {
        [sectionArrayToBuild addObject:@"Contact Info"];
    }
    
    //section additional info needed?
    if ([patientToBuildSectionsFor.multipleBirthX class] != [NSNull class] || [patientToBuildSectionsFor.link count] > 0 || [patientToBuildSectionsFor.active class] != [NSNull class] || [patientToBuildSectionsFor.provider class] != [NSNull class])
    {
        [sectionArrayToBuild addObject:@"Additional Info"];
    }
    
    //section animal info needed?
    if ([patientToBuildSectionsFor.animal.species.coding count] != 0)
    {
        [sectionArrayToBuild addObject:@"Animal Info"];
    }
    
    if ([patientToBuildSectionsFor.contact count] > 0)
    {
        [sectionArrayToBuild addObject:@"Contact List"];
    }
    
    return sectionArrayToBuild;
}

@end
