//
//  Uri.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Uri.h"

@implementation Uri

@synthesize uri = _uri;

- (NSDictionary *)generateAndReturnDictionary
{
    NSDictionary *stringDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[_uri absoluteString], @"value", nil];
    return stringDictionary;
}

@end
