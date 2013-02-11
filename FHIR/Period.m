//
//  Period.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Period.h"

@implementation Period

- (NSDate *)getStart
{
    return self.start;
}

- (void)setStart:(NSDate *)value
{
    self.start = value;
}

- (NSDate *)getEnd
{
    return self.end;
}

- (void)setEnd:(NSDate *)value
{
    self.end = value;
}

@end
