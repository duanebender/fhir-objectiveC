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

+ (NSArray *)generateResourceReferenceArray:(NSArray *)resourceReferenceArray;
+ (NSArray *)generateHumanIdArray:(NSArray *)humanIdArray;

+ (NSArray *)generateStringArray:(NSArray *)stringArray;
+ (NSDictionary *)stringChecker:(String *)string;

@end
