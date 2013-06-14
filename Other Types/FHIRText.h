//
//  Text.h
//  FHIR
//
//  Created by Adam Sippel on 2013-03-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
*holds generated text that comes along with xml and json files
*/

#import <Foundation/Foundation.h>
#import "FHIRString.h"

@interface FHIRText : NSObject

@property (nonatomic, retain) FHIRResourceDictionary *textDictionary;

//following properties are individual parts of the Text Object that can be influenced Individually
@property (nonatomic, retain) NSString *div; //holds the text in this object
@property (nonatomic, retain) FHIRString *status;

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all elements of this text object
- (void)textParser:(NSDictionary *)dictionary; //sets this text object from an NSdictionary

@end
