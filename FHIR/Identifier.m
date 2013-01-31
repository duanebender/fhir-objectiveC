//
//  Identifier.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Identifier.h"

@interface Identifier()

@property (nonatomic, retain) Uri *system; //Establishes the namespace in which set of possible id values is unique.
@property (nonatomic, retain) String_ *idNumber; //The portion of the identifier typically displayed to the user and which is unique within the context of the system.

@end

@implementation Identifier

- (Uri *)getSystem
{
    return self.system;
}

- (void)setSystem:(Uri *)value
{
    self.system = value;
}

- (String_ *)getId
{
    return self.idNumber;
}

- (void)setId:(String_ *)value
{
    self.idNumber = value;
}

@end
