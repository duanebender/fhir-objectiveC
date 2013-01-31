//
//  Period.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

//A time period defined by a start and end time.

#import <Foundation/Foundation.h>
#import "Type.h"

@interface Period : Type

- (NSDate *)getStart; //get starting date
- (void)setStart:(NSDate *)value; //set starting date
- (NSDate *)getEnd; //get ending date
- (void)setEnd:(NSDate *)value; //set ending date

@end
