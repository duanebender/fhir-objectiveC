//
//  Resource.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Resource.h"

@implementation Resource

@synthesize extensions = _extensions;
@synthesize text = _text;

- (Narrative *)getText
{
    return self.text;
}

- (void)setText:(Narrative *)text
{
    self.text = text;
}

- (NSArray *)getExtensions
{
    return self.extensions;
}

@end
