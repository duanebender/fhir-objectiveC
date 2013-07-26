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

+ (NSString *)returnPatientsName:(FHIRPatient *)patientToCheckNameOf; //Patient Full Name
+ (NSString *)returnPatientsDOB:(FHIRPatient *)patientToCheckDOB; //Patient Date of Birth
+ (UIImage *)returnPatientDefaultImage:(FHIRPatient *)patientToCheckImage; //Patient Profile Image
+ (NSMutableArray *)generateSectionsArrayForPatientListing:(FHIRPatient *)patientToBuildSectionsFor; //Patient List Sections

@end
