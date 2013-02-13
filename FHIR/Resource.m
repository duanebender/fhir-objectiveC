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
@synthesize resourceType = _resourceType;

- (id)init
{
    self = [super init];
    if (self) {
        _extensions = [[NSMutableArray alloc] init];
        _text = [[Narrative alloc] init];
    }
    return self;
}

@end
