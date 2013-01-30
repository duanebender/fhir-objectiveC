//
//  Resource.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Resource.h"

@interface Resource()

@property (nonatomic, retain) NSArray *extensions; //an array of extension objects
@property (nonatomic, retain) Narrative *text;

@end

@implementation Resource

- (Narrative *)getText
{
    return self.text;
}

- (void)setText:(Narrative *)text
{
    self.text = text;
}

- (NSArray *)getExtensions
{
    return self.extensions;
}

@end
