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

- (void)cleanAndCheck
{
    for (NSString *key in self.dataForResource)
    {
        if ([self.dataForResource objectForKey:key] == nil)
        {
            [self.dataForResource setValue:@"nil" forKey:key];
        }
    }
}

- (void)cleanUpDictionaryValues
{
    //remove entries with no values
    NSDictionary *tempDict = [[NSDictionary alloc] initWithDictionary:_dataForResource];
    
    for (NSString* key in tempDict)
    {
        if (key != @"div")
        {
            NSObject *value = [tempDict valueForKey:key];
            if (value == NULL || value == [NSNull null] || value == nil || [tempDict count] == 0)
            {
                [_dataForResource removeObjectForKey:key];
            }
        }
    }
    
    if ([tempDict count] == 0)
    {
        _dataForResource = NULL;
    }
}

@end
