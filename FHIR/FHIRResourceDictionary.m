//
//  FHIRResourceDictionary.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-07.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRResourceDictionary.h"

@implementation FHIRResourceDictionary

@synthesize dataForResource = _dataForResource;
@synthesize resourceName = _resourceName;
@synthesize resourceType = _resourceType;

- (NSString *)getResourceName
{
    return self.resourceName;
}

- (void)setResourceName:(NSString *)resourceName
{
    self.resourceName = resourceName;
}

- (id)dataForKey:(NSString *)key
{
    return [_dataForResource objectForKey:key];
}

- (void)setDataForKey:(NSString *)key Data:(id)data
{
    [_dataForResource setValue:data forKey:key];
}

- (NSString *)resourceType
{
    return self.resourceType;
}

- (void)setResourceType:(NSString *)resourceType
{
    self.resourceType = resourceType;
}

@end
