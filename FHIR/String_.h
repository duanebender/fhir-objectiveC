//
//  String_.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"

@interface String_ : Type

- (NSString *)getValue;
- (void)setValue:(NSString *)value;

@end
