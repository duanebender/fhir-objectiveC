//
//  FHIRResourceDictionary.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-07.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRResourceDictionary.h"
#import "FHIRString.h"
#import "FHIRCode.h"

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
#warning - this does not remove everything for some reason
    //remove entries with no values
    NSInteger *nullCount = 1;
    
    while (nullCount > 0)
    {
        nullCount = 0;
        NSDictionary *tempDict = [[NSDictionary alloc] initWithDictionary:_dataForResource];
    
        //first check through dictionary
        for (NSString* key in tempDict)
        {
            if ([key isEqualToString:@"div"] == FALSE)
            {
                NSObject *value = [tempDict valueForKey:key];
                if (value == NULL || value == [NSNull null] || [tempDict count] == 0)
                {
                    [_dataForResource removeObjectForKey:key];
                    nullCount++;
                }
                
                if ([value class] == [NSDictionary class])
                {
                    NSArray *tempValueHolder = [[NSArray alloc] initWithObjects:value, nil];
                    if ([[tempValueHolder objectAtIndex:0] count] == 0)
                    {
                        [_dataForResource removeObjectForKey:key];
                        nullCount++;
                    }
                }
            }
        }
    
        //final check
        if ([tempDict count] == 0)
        {
            _dataForResource = NULL;
            nullCount = 0;
        }
        
    }
    
    //second check through dictionary to be sure
    NSDictionary *tempDict = [[NSDictionary alloc] initWithDictionary:_dataForResource];
    
    NSArray *blankKeys = [tempDict allKeysForObject:@""];
    NSArray *nullKeys = [tempDict allKeysForObject:NULL];
    NSArray *nullStringKeys = [tempDict allKeysForObject:nil];
    
    if ([blankKeys count] > 0 || [nullKeys count] > 0)
    {
        [_dataForResource removeObjectsForKeys:blankKeys];
        [_dataForResource removeObjectsForKeys:nullKeys];
        [_dataForResource removeObjectsForKeys:nullStringKeys];
    }
    
    NSLog (@"Resource:%@ DATA:%@",_resourceName, _dataForResource);
    
}

@end
