//
//  Code.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"

@interface Code : Type

@property (nonatomic, retain) NSString *value;

- (NSDictionary *)generateAndReturnDictionary; //returns ready to be formatted
- (void)setValueCode:(NSDictionary *)dictionary; //rsets value for code from dictionary

@end
