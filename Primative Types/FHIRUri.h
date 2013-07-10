//
//  Uri.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A Basic Uri object
 */

#import <Foundation/Foundation.h>
#import "FHIRType.h"

@interface FHIRUri : FHIRType

//value of this uri for direct influence
@property (nonatomic, weak) NSURL *uri;

//Public Methods
- (NSObject *)generateAndReturnDictionary; //returns an NSDictionary containing all elements of this uri
- (void)setValueURI:(NSDictionary *)dictionary; //set this uri object from an NSdictionary

@end
