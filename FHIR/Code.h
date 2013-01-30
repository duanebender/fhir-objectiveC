//
//  Code.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"

@interface Code : Type

- (NSString *)getValue; //get the code string
- (void)setValue:(NSString *)value; //set the code string

@end
