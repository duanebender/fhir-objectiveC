//
//  Extension.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-26.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Optional Extensions Element - found in all resources
 */

#import <Foundation/Foundation.h>
#import "FHIRElement.h"
#import "FHIRUri.h"
#import "FHIRBool.h"
#import "FHIRString.h"

@interface FHIRExtension : FHIRElement

//following properties are individual parts of the Extension Object that can be influenced Individually
@property (nonatomic, retain) FHIRResourceDictionary *extensionDictionary; //holds a dictionary of all extension resources

@property (nonatomic, retain) FHIRUri *url; //Source of the definition for the extension code - a logical name or a URL
@property (nonatomic, retain) FHIRBool *isModifier; //
@property (nonatomic, retain) NSArray *valueX; //
@property (nonatomic, retain) NSMutableArray *extension; //Nested Extensions - further extensions that are part of the extension

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all elements of this Extension Object
- (void)extensionParser:(NSDictionary *)dictionary; //sets elements of this extension object from an NSDictionary

@end
