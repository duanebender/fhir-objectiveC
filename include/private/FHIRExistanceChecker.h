//
//  ExistanceChecker.h
//  FHIR
//
//  Created by Adam Sippel on 2013-03-18.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Checks arrays for nil or null values and removes them completely, as well as handles other required universal methods.
 */

#import <Foundation/Foundation.h>
#import "FHIRResourceReference.h"
#import "FHIRIdentifier.h"

@interface FHIRExistanceChecker : NSObject

+ (NSObject *)generateArray:(NSArray *)array; //checks an array and returns a null value if the array has no values
+ (NSObject *)stringChecker:(FHIRString *)string; //checks a string and returns a null value if the string is blank

+ (NSDate *)generateDateTimeFromString:(NSString *)string; //takes in a string and spits out a dateTime in the proper format
+ (id)checkEmptySingleObjectArray:(NSArray *)arrayToCheck; //checks arrays used for multiple object types such as MultiBirthX in FHIRPatient
+ (NSObject *)emptyObjectChecker:(NSObject *)objectToCheck; //sets values from an empty object to NSNull as to not break arrays or dictionaries
+ (NSObject *)primitiveValueChecker:(NSDictionary *)dictionaryWithSingleValueKey; //for use to check if primitive types have an internal value

@end
