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


- (void)setDataForKey:(NSString *)key Data:(id)data
{
    [_dataForResource setValue:data forKey:key];
}

@end
