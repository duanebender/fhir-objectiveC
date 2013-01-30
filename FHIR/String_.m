//
//  String_.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "String_.h"

@interface String_()
    
@property (nonatomic, retain) NSString *value; //contains the value of a string

@end

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
