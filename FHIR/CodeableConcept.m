//
//  pie.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "CodeableConcept.h"

@implementation CodeableConcept

    + (NSArray *)getCoding //<Coding>
    {
        return [coding];
    }

    + (NSString *)getText
    {
        return self.text;
    }

    + (void)setText:(NSString *)value
    {
        self.text = value;
    }

    + (NSString *)getPrimary
    {
        return self.primary;
    }

    + (void)setPrimary:(NSString *)value
    {
        self.primary = value;
    }

@end
