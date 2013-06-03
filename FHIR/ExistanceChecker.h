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
#import "ResourceReference.h"
#import "HumanId.h"

@interface ExistanceChecker : NSObject

+ (NSArray *)generateArray:(NSArray *)array; //checks an array and returns a null value if the array has no values
+ (NSDictionary *)stringChecker:(String *)string; //checks a string and returns a null value if the string is blank

+ (NSDate *)generateDateTimeFromString:(NSString *)string; //takes in a string and spits out a dateTime in the proper format

@end
