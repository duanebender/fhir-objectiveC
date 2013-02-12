//
//  Period.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

//A time period defined by a start and end time.

#import <Foundation/Foundation.h>
#import "Type.h"

@interface Period : Type

@property (nonatomic, retain) NSDate *start; //The start of the period. The boundary is inclusive.
@property (nonatomic, retain) NSDate *end; //The end of the period. If the high is missing, it means that the period is ongoing

@end
