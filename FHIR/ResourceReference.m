//
//  ResourceReference.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "ResourceReference.h"

@implementation ResourceReference

@synthesize type = _type; //The name of one of the resource types defined in this specification to identify the type of the resource being referenced
@synthesize uriId = _uriId; //A literal URL that resolves to the location of the resource. The URL may be relative or absolute. Relative Ids contain the logical id of the resource. This reference is version independent - it points to the latest version of this resource
@synthesize version = _version; //A literal URL that resolves to the location of a particular version of the resource. The URL may be relative or absolute. Relative Ids contain the logical version id of the resource.
@synthesize display = _display; //Plain text narrative that identifies the resource in addition to the resource reference

- (id)init
{
    self = [super init];
    if (self) {
        _type = [[Code alloc] init];
        _uriId = [[Uri alloc] init];
        _version = [[Uri alloc] init];
        _display = [[String alloc] init];
    }
    return self;
}

@end
