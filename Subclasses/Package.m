//
//  Package.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Package.h"

@implementation Package

@synthesize packageDictionary = _packageDictionary; //a dictionary containing all resources in this package object
@synthesize container = _container; //The kind of container that this package comes as.
@synthesize content = _content; //THIS ARRAY CONTAINS "Content" OBJECTS ONLY. A set of components that go to make up the described item.

- (id)init
{
    self = [super init];
    if (self) {
        _packageDictionary = [[FHIRResourceDictionary alloc] init];
        _container = [[CodeableConcept alloc] init];
        _content = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _packageDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [_container generateAndReturnDictionary], @"container",
                                           [ExistanceChecker generateArray:_content], @"content",
                                           nil];
    _packageDictionary.resourceName = @"Package";
    [_packageDictionary cleanUpDictionaryValues];
    return _packageDictionary.dataForResource;
}

- (void)activityParser:(NSDictionary *)dictionary
{
    [_container codeableConceptParser:[dictionary objectForKey:@"container"]];
    
    //_content
    NSArray *contentArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"content"]];
    _content = [[NSMutableArray alloc] init];
    for (int i = 0; i < [contentArray count]; i++)
    {
        Content *tempCN = [[Content alloc] init];
        [tempCN contentParser:[contentArray objectAtIndex:i]];
        [_content addObject:tempCN];
        //NSLog(@"%@", _content);
    }
    
}

@end
