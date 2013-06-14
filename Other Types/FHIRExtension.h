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

@property (nonatomic, retain) FHIRUri *uri; //Source of the definition for the extension code - a logical name or a URL
@property (nonatomic, retain) FHIRString *ref; //Internal reference to context of the extension - a pointer to an xml:id in the same resource
@property (nonatomic, retain) FHIRBool *mustUnderstand; //If this element is set to true, then the containing resource element and its children are only safe to process if the reader understands this extension.
@property (nonatomic, retain) FHIRType *value; //Value of extension - may be a resource or one of a constraint set of the data types (see Extensibility in the spec for list)
@property (nonatomic, retain) NSMutableArray *list; //Nested Extensions - further extensions that are part of the extension

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all elements of this Extension Object
- (void)extensionParser:(NSDictionary *)dictionary; //sets elements of this extension object from an NSDictionary

@end
