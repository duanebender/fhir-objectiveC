//
//  Uri.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Uri.h"

@interface Uri()

#warning - made a Url not a Uri
@property (nonatomic, weak) NSURL *uri;

@end

@implementation Uri

- (NSURL *)getValue
{
    return self.uri;
}

- (void)setValue:(NSURL *)value
{
    self.uri = value;
}

@end
