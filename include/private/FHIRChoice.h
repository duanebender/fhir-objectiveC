//
//  FHIRChoice.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIR.h"

@interface FHIRChoice : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *choiceDictionary; //resources for choice

//following properties are individual parts of the Choice Object that can be influenced Individually
@property (nonatomic, retain) FHIRCode *code; //Selected code.
@property (nonatomic, retain) NSMutableArray *option; //List of possible code values. CONTAINS CHOICEOPTION VALUES ONLY.
@property (nonatomic, retain) FHIRBool *isOrdered; //If order of the values has meaning.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all of the elements of this choice Object
- (void)choiceParser:(NSDictionary *)dictionary; //set this Choice Object from an NSDictionary

@end
