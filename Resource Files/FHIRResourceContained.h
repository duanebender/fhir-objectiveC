//
//  FHIRResourceContained.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-20.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Contents of a resource.
 */

#import "FHIR.h"

@interface FHIRResourceContained : FHIRType

@property (nonatomic, strong) FHIRResourceDictionary *containedResourceDictionary; //

@property (nonatomic, strong) NSString *content; //content of this content (ex base64binary string)
@property (nonatomic, strong) NSString *contentId; //id for this content (ex pic1)
@property (nonatomic, strong) NSString *contentType; //type of file contained (ex image/gif)
@property (nonatomic, strong) NSString *contentName; //Name of this content

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all elements of this ResourceContained Object
- (void)resourceContainedParser:(NSDictionary *)dictionary; //set this resourceContained object from an NSdictionary

@end
