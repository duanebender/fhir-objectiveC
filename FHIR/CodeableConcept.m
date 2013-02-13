//
//  pie.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "CodeableConcept.h"

@implementation CodeableConcept

@synthesize coding = _coding; //A reference to a code defined by a terminology system. Contains "coding" objects only.
@synthesize text = _text; //A human language representation of the concept as seen/selected/uttered by the user who entered the data and/or which represents the intended meaning of the user or concept
@synthesize primary = _primary; //Indicates which of the codes in the codings was chosen by a user, if one was chosen directly

- (id)init
{
    self = [super init];
    if (self) {
        _coding = [[NSMutableArray alloc] init];
        _text = [[String alloc] init];
        _primary = [[String alloc] init];
    }
    return self;
}

@end
