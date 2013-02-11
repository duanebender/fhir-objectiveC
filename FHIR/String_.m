//
//  String_.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "String_.h"

@implementation String_

- (NSString *)getValue
{
    return self.value;
}

- (void)setValue:(NSString *)value
{
    self.value = value;
}

@end
