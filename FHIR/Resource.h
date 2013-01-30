//
//  Resource.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"
#import "Narrative.h"

@interface Resource : Element

- (Narrative *)getText; //returns the narrative text
- (void)setText:(Narrative *)text; //sets the narrative text
- (NSArray *)getExtensions; //returns an array of extensions

#warning - below method is absract with no code?
- (ResourceType *)getResourceType; //returns the resource type

@end
