//
//  FHIRChoiceOption.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIR.h"

@interface FHIRChoiceOption : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *optionDictionary; //resources for option

//following properties are individual parts of the ChoiceOption Object that can be influenced Individually
@property (nonatomic, retain) FHIRCode *code; //Possible code.
@property (nonatomic, retain) FHIRString *display; //Display for the code.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all of the elements of this choiceOption Object
- (void)choiceOptionParser:(NSDictionary *)dictionary; //set this ChoiceOption Object from an NSDictionary

@end
