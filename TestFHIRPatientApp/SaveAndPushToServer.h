//
//  SaveAndPushToServer.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-08-14.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FHIR.h"

@interface SaveAndPushToServer : NSObject

@property (nonatomic, strong) FHIRPatient *patient;

- (void)pushUpdatedPatientToServer:(FHIRPatient *)patientToPush; //push a predetermined patient to the server
- (void)pushNewPatientToServer:(NSDictionary *)patientInfoToConvertAndPush; //take in brand new patient data and push it as a patient object to server

- (FHIRPatient *)returnPatientForDictionaryData:(NSDictionary *)dictionaryToConvertToPatient;

@end
