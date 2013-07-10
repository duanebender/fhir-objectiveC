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
{
    NSInteger *nullCount;
}
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
    
    NSMutableDictionary *notNullDictionary = [[NSMutableDictionary alloc] init];
    for (NSString * key in [_dataForResource allKeys])
    {
        if (![[_dataForResource objectForKey:key] isKindOfClass:[NSNull class]])
            [notNullDictionary setObject:[_dataForResource objectForKey:key] forKey:key];
    }
    
    _dataForResource = [[NSMutableDictionary alloc] initWithDictionary:notNullDictionary];
    
    /*
    if ([_dataForResource count] > 0) nullCount = 1;
    else nullCount = 0;
    
    while (nullCount > 0)
    {
        nullCount = 0;
        NSDictionary *tempDict = [[NSDictionary alloc] initWithDictionary:_dataForResource];
    
        //first check through dictionary
        for (NSString* key in tempDict)
        {
            if ([key isEqualToString:@"text"])
            {
                //dont remove as it is manditory
            }
            else if ([key isEqualToString:@"div"] == FALSE)
            {
                NSObject *value = [tempDict valueForKey:key];
                if (value == NULL || value == [NSNull null] || [tempDict count] == 0)
                {
                    [self removeObjectAndIncreaseNullCount:key];
                }
                
                if ([value class] == [NSDictionary class])
                {
                    NSArray *tempValueHolder = [[NSArray alloc] initWithObjects:value, nil];
                    if ([[tempValueHolder objectAtIndex:0] count] == 0)
                    {
                        [self removeObjectAndIncreaseNullCount:key];
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
     */
    
    //second check through dictionary to be sure
    /*
    NSDictionary *tempDict = [[NSDictionary alloc] initWithDictionary:_dataForResource];
    
    NSArray *blankKeys = [tempDict allKeysForObject:@""];
    NSArray *nullKeys = [tempDict allKeysForObject:NULL];
    NSArray *nullStringKeys = [tempDict allKeysForObject:nil];
    
    if ([blankKeys count] > 0 || [nullKeys count] > 0)
    {
        [_dataForResource removeObjectsForKeys:blankKeys];
        [_dataForResource removeObjectsForKeys:nullKeys];
        //[_dataForResource removeObjectsForKeys:nullStringKeys];
    }
     */
    
    //NSLog (@"Resource:%@ DATA:%@",_resourceName, _dataForResource);
    
}

- (void)removeObjectAndIncreaseNullCount:(NSString *)currentKey
{
    if ([_dataForResource objectForKey:currentKey])
    {
        [_dataForResource removeObjectForKey:currentKey];
        nullCount++;
    }
}

@end
