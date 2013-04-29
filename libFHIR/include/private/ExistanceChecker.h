//
//  ExistanceChecker.h
//  FHIR
//
//  Created by Adam Sippel on 2013-03-18.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResourceReference.h"
#import "HumanId.h"

@interface ExistanceChecker : NSObject

+ (NSArray *)generateArray:(NSArray *)array; //checks an array and returns a null value if the array has no values
+ (NSDictionary *)stringChecker:(String *)string; //checks a string and returns a null value if the string is blank

@end
