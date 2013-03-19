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

+ (NSArray *)generateArray:(NSArray *)array;
+ (NSDictionary *)stringChecker:(String *)string;

@end
