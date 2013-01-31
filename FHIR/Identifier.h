//
//  Identifier.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"
#import "Uri.h"
#import "String_.h"

@interface Identifier : Type

- (Uri *)getSystem; //return identity of the system
- (void)setSystem:(Uri *)value; //set identity of the system
- (String_ *)getId; //get the system id
- (void)setId:(String_ *)value; //set the system id

@end
