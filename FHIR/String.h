//
//  String.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"

@interface String : Type

@property (nonatomic, retain) NSString *value; //contains the value of a string

- (NSDictionary *)generateAndReturnDictionary; //returns ready to be formatted

@end