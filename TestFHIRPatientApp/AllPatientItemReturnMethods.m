//
//  AllPatientItemReturnMethods.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-25.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "AllPatientItemReturnMethods.h"

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
    UIImage *imageForProfile = [[UIImage alloc] init];
    
    if([patientToCheckImage.photo count] != 0) //there is a profile picture
    {
        
    }
    else //use a default image
    {
        if ([patientToCheckImage.animal class] != [NSNull class]) //patient is animal
        {
            imageForProfile = [UIImage imageNamed:@"defaultAnimalProfileImage.jpg"];
        }
        else
        {
            if ([patientToCheckImage.gender class] == [NSNull class]) //patient is human male
            {
                imageForProfile = [UIImage imageNamed:@"defaultMaleProfileImage.gif"];
            }
            else if ([patientToCheckImage.gender.text.value isEqualToString:@"Male"])
            {
                imageForProfile = [UIImage imageNamed:@"defaultMaleProfileImage.gif"];
            }
            else
            {
                imageForProfile = [UIImage imageNamed:@"defaultFemaleProfileImage.jpeg"];
            }
        }
    }
    
    return imageForProfile;
}

+ (NSMutableArray *)generateSectionsArrayForPatientListing:(FHIRPatient *)patientToBuildSectionsFor
{
    NSMutableArray *sectionArrayToBuild = [[NSMutableArray alloc] init];
    
    //section patient info needed?
    if ([patientToBuildSectionsFor.name count] > 0 || [patientToBuildSectionsFor.birthDate class] != [NSNull class] || [patientToBuildSectionsFor.maritalStatus class] != [NSNull class] || [patientToBuildSectionsFor.deceasedX class] != [NSNull class] || [patientToBuildSectionsFor.communication count] > 0)
    {
        [sectionArrayToBuild addObject:@"PERSONAL INFO"];
    }
    
    //section contact info needed?
    if ([patientToBuildSectionsFor.address count] > 0 || [patientToBuildSectionsFor.telecom count] > 0)
    {
        [sectionArrayToBuild addObject:@"CONTACT INFO"];
    }
    
    //section additional info needed?
    if ([patientToBuildSectionsFor.multipleBirthX class] != [NSNull class] || [patientToBuildSectionsFor.link count] > 0 || [patientToBuildSectionsFor.active class] != [NSNull class] || [patientToBuildSectionsFor.provider class] != [NSNull class])
    {
        [sectionArrayToBuild addObject:@"ADDITIONAL INFO"];
    }
    
    //section animal info needed?
    if ([patientToBuildSectionsFor.animal.species.primary.value class] != [NSNull class])
    {
        [sectionArrayToBuild addObject:@"ANIMAL INFO"];
        NSLog(@"%@",[patientToBuildSectionsFor.animal.species.primary.value class]);
    }
    
    if ([patientToBuildSectionsFor.contact count] > 0)
    {
        [sectionArrayToBuild addObject:@"CONTACT LIST"];
    }
    
    return sectionArrayToBuild;
}

@end
