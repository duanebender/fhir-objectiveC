//
//  pie.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "CodeableConcept.h"

//private variables
@interface CodeableConcept()
    @property (nonatomic, retain) NSArray *coding; //A reference to a code defined by a terminology system. Contains "coding" objects only.
    @property (nonatomic, retain) String_ *text; //A human language representation of the concept as seen/selected/uttered by the user who entered the data and/or which represents the intended meaning of the user or concept
    @property (nonatomic, retain) NSString *primary; //Indicates which of the codes in the codings was chosen by a user, if one was chosen directly

@end

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
