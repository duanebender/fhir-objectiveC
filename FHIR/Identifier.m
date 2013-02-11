//
//  Identifier.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Identifier.h"

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
