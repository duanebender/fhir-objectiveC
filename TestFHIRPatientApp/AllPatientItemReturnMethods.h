//
//  AllPatientItemReturnMethods.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-25.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FHIR.h"

@interface AllPatientItemReturnMethods : NSObject

//personal info methods
+ (NSString *)returnPatientsName:(FHIRPatient *)patientToCheckNameOf; //Patient Full Name
+ (NSString *)returnPatientsSSN:(FHIRPatient *)patientToCheckSSNOf; //Patient SSN
+ (NSString *)returnPatientsDOB:(FHIRPatient *)patientToCheckDOB; //Patient Date of Birth
+ (NSString *)returnPatientsGender:(FHIRPatient *)patientToCheckGender; //Patient Gender
+ (NSString *)returnPatientsMaritalStatus:(FHIRPatient *)patientToCheckMaritalStatus; //Patient Marital Status
+ (NSString *)returnPatientsDeceasedStatus:(FHIRPatient *)patientToCheckDeceased; //Patient Date of death?
+ (NSString *)returnPatientsLanguage:(FHIRPatient *)patientToCheckLanguage; //Patient language

//contact info methods
+ (NSMutableString *)returnPatientsAddressInfo:(FHIRPatient *)patientToCheckAddress; //Patient's Address
+ (NSMutableDictionary *)returnPatientsTelecom:(FHIRPatient *)patientToFindPhone; //Patients phone numbers, email, and fax

//additional info methods
+ (NSString *)returnPatientsMultipleBirth:(FHIRPatient *)patientToCheckMultipleBirthOf; //Patient's siblings
+ (NSString *)returnPatientsActiveStatus:(FHIRPatient *)patientToCheckActiveStatusOf; //Patient's active status
+ (NSString *)returnPatientsProvider:(FHIRPatient *)patientToCheckProviderOf; //Patient's provider
+ (NSString *)returnPatientsLinkedToThisPatient:(FHIRPatient *)patientToCheckLinksTo; //Patient links

//animal info methods
+ (NSString *)returnPatientAnimalSpecies:(FHIRPatient *)patientToCheckSpeciesOf; //Patient's species
+ (NSString *)returnPatientAnimalBreed:(FHIRPatient *)patientToCheckBreedOf; //Patient's breed
+ (NSString *)returnPatientAnimalGenderStatus:(FHIRPatient *)patientToCheckGenderStatusOf; //Patient's gender status

//contact list methods
+ (NSArray *)returnPatientsContactListItemsInAnArray:(FHIRPatient *)patientToGetContactsOf; //takes in patient and returns a dictionary for each contact patient has with contact info

//extra Methods
+ (UIImage *)returnPatientDefaultImage:(FHIRPatient *)patientToCheckImage; //Patient Profile Image
+ (NSMutableArray *)generateSectionsArrayForPatientListing:(FHIRPatient *)patientToBuildSectionsFor; //Patient List Sections

@end
