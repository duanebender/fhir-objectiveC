//
//  Uri.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"

@interface Uri : Type

@property (nonatomic, weak) NSURL *uri;

- (NSDictionary *)generateAndReturnDictionary; //returns ready for formatting
- (void)setValueURI:(NSDictionary *)dictionary; //set uri from dictionary

@end
