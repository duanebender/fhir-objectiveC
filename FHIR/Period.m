//
//  Period.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Period.h"

@implementation Period

@synthesize start = _start; //The start of the period. The boundary is inclusive.
@synthesize end = _end; //The end of the period. If the high is missing, it means that the period is ongoing

@end
