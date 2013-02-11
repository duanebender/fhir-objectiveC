//
//  Uri.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#warning - This code is a URL not yet a URI

#import <Foundation/Foundation.h>
#import "Type.h"

@interface Uri : Type

- (NSURL *)getValue; //return the uri text string
- (void)setValue:(NSURL *)value; //set the uri string

@property (nonatomic, weak) NSURL *uri;

@end
