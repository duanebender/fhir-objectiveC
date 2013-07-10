//
//  Uri.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRUri.h"
#import "FHIRExistanceChecker.h"

@implementation FHIRUri

@synthesize uri = _uri;

- (NSObject *)generateAndReturnDictionary
{
    NSObject *uriObject;
    uriObject = [FHIRExistanceChecker primitiveValueChecker:[[NSDictionary alloc] initWithObjectsAndKeys:_uri, @"value", nil]];
    return uriObject;
}

- (void)setValueURI:(NSDictionary *)dictionary
{
    _uri = [dictionary objectForKey:@"value"];
}

@end
