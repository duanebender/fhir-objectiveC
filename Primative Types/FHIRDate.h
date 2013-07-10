//
//  FHIRDate.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-24.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHIRDate : NSObject

//value of this date for direct influence
@property (nonatomic, retain) NSDate *value; //contains the value of a string

//Public Methods
- (NSObject *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this String Object
- (void)setValueDate:(NSDictionary *)dictionary; //sets this string from an NSDictionary

@end
