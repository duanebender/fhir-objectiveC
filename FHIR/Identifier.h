//
//  Identifier.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
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

@property (nonatomic, retain) Uri *system; //Establishes the namespace in which set of possible id values is unique.
@property (nonatomic, retain) String_ *idNumber; //The portion of the identifier typically displayed to the user and which is unique within the context of the system.

@end
