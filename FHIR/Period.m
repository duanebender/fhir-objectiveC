//
//  Period.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Period.h"

@interface Period()

@property (nonatomic, retain) NSDate *start; //The start of the period. The boundary is inclusive.
@property (nonatomic, retain) NSDate *end; //The end of the period. If the high is missing, it means that the period is ongoing

@end

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
