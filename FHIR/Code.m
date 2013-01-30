//
//  Code.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Code.h"

@interface Code()

@property (nonatomic, retain) NSString *codeText;

@end

@implementation Code

- (NSString *)getValue
{
    return self.codeText;
}

- (void)setValue:(NSString *)value
{
    self.codeText = value;
}

@end
