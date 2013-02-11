//
//  pie.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "CodeableConcept.h"

@implementation CodeableConcept

//@synthesize coding = _coding;
//@synthesize text = _text;
//@synthesize primary = _primary;

    - (NSArray *)getCoding //<Coding>
    {
        return self.coding;
    }

    - (String_ *)getText
    {
        return self.text;
    }

    - (void)setText:(String_ *)value
    {
        self.text = value;
    }

    - (NSString *)getPrimary
    {
        return self.primary;
    }

    - (void)setPrimary:(NSString *)value
    {
        self.primary = value;
    }

@end
