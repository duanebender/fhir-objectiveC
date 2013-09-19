//
//  PatientViewWriter.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FHIR.h"

@interface PatientViewWriter : NSObject

+ (NSString *)writePatientAsStringForView:(NSMutableDictionary *)patientDict;

@end
