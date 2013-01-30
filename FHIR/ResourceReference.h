//
//  ResourceReference.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"
#import "Uri.h"
#import "Code.h"
#import "String_.h"

//A reference from one resource to another

@interface ResourceReference : Type

- (Code *)getType; 
- (void)setType:(Code *)value;
- (Uri *)getId;
- (void)setId:(Uri *)value;
- (Uri *)getVersion;
- (void)setVersion:(Uri *)value;
- (String_ *)getDisplay;
- (void)setDisplay:(String_ *)value;

@end
