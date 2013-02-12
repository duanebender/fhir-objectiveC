//
//  Identifier.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Uri.h"
#import "String_.h"

@interface Identifier : Type

@property (nonatomic, retain) Uri *system; //Establishes the namespace in which set of possible id values is unique.
@property (nonatomic, retain) String_ *idNumber; //The portion of the identifier typically displayed to the user and which is unique within the context of the system.

@end
