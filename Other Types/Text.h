//
//  Text.h
//  FHIR
//
//  Created by Adam Sippel on 2013-03-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

//holds generated text that comes along with xml and json files

#import <Foundation/Foundation.h>
#import "String.h"

@interface Text : NSObject

@property (nonatomic, retain) NSString *div;
@property (nonatomic, retain) String *status;

@property (nonatomic, retain) FHIRResourceDictionary *textDictionary;

- (NSDictionary *)generateAndReturnTextDictionary; //returns text ready to be formatted
- (void)textParser:(NSDictionary *)dictionary; //sets text from dictionary

@end
