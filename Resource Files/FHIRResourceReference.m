//
//  ResourceReference.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRResourceReference.h"
#import "FHIRExistanceChecker.h"

@implementation FHIRResourceReference

@synthesize resourceReferenceDictionary = _resourceReferenceDictionary;

@synthesize type = _type; //The name of one of the resource types defined in this specification to identify the type of the resource being referenced
@synthesize reference = _reference; //A literal URL that resolves to the location of the resource. The URL may be relative or absolute. Relative Ids contain the logical id of the resource. This reference is version independent - it points to the latest version of this resource
@synthesize version = _version; //A literal URL that resolves to the location of a particular version of the resource. The URL may be relative or absolute. Relative Ids contain the logical version id of the resource.
@synthesize display = _display; //Plain text narrative that identifies the resource in addition to the resource reference

- (id)init
{
    self = [super init];
    if (self) {
        _resourceReferenceDictionary = [[FHIRResourceDictionary alloc] init];
        _type = [[FHIRCode alloc] init];
        _reference = [[FHIRUri alloc] init];
        _version = [[FHIRUri alloc] init];
        _display = [[FHIRString alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _resourceReferenceDictionary.dataForResource = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          [FHIRExistanceChecker emptyObjectChecker:[_type generateAndReturnDictionary]], @"type",
                                          [FHIRExistanceChecker emptyObjectChecker:[_reference generateAndReturnDictionary]], @"reference",
                                          [FHIRExistanceChecker emptyObjectChecker:[_version generateAndReturnDictionary]], @"version",
                                          [FHIRExistanceChecker stringChecker:_display], @"display",
                                          nil];

    [_resourceReferenceDictionary cleanUpDictionaryValues];
    
    _resourceReferenceDictionary.resourceName = @"ResourceReference";
    return _resourceReferenceDictionary.dataForResource;
}

- (void)resourceReferenceParser:(NSDictionary *)dictionary
{
    [_type setValueCode:[dictionary objectForKey:@"type"]];
    [_reference setValueURI:[dictionary objectForKey:@"reference"]];
    [_version setValueURI:[dictionary objectForKey:@"version"]];
    [_display setValueString:[dictionary objectForKey:@"display"]];
}

@end
