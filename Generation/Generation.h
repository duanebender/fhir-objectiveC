//
//  Generation.h
//  FHIR
//
//  Created by Adam Sippel on 2013-07-09.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Validate and/or generate Objective C classes based on the most up to date schema from http://hl7.org/implement/standards/fhir/
 */

#import <Foundation/Foundation.h>

@interface Generation : NSObject

+ (void)generateFHIRClassFromXMLSchema:(NSString *)urlforXSDFile toFileLocation:(NSString *)filePathForSavedClass;

@end
