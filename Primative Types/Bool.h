//
//  Bool.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"

@interface Bool : Type

@property (nonatomic) BOOL value;
@property (nonatomic) NSString *original;

- (NSDictionary *)generateAndReturnDictionary; //returns bool ready to be formatted
- (void)setValueBool:(NSDictionary *)dictionary; //sets the bool from dictionary

@end
