//
//  ResourceReference.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "ResourceReference.h"

@implementation ResourceReference

- (Code *)getType
{
    return self.type;
}

- (void)setType:(Code *)value
{
    self.type = value;
}

- (Uri *)getId
{
    return self.uriId;
}

- (void)setId:(Uri *)value
{
    self.uriId = value;
}

- (Uri *)getVersion
{
    return self.version;
}

- (void)setVersion:(Uri *)value
{
    self.version = value;
}

- (String_ *)getDisplay
{
    return self.display;
}

- (void)setDisplay:(String_ *)value
{
    self.display = value;
}

@end
