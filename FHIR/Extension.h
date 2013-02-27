//
//  Extension.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-26.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"
#import "Uri.h"
#import "String.h"
#import "Bool.h"

//Optional Extensions Element - found in all resources
@interface Extension : Element

@property (nonatomic, retain) FHIRResourceDictionary *extensionDictionary; //holds a dictionary of all extension resources

@property (nonatomic, retain) Uri *uri; //Source of the definition for the extension code - a logical name or a URL
@property (nonatomic, retain) String *ref; //Internal reference to context of the extension - a pointer to an xml:id in the same resource
@property (nonatomic, retain) Bool *mustUnderstand; //If this element is set to true, then the containing resource element and its children are only safe to process if the reader understands this extension.
@property (nonatomic, retain) Type *value; //Value of extension - may be a resource or one of a constraint set of the data types (see Extensibility in the spec for list)
@property (nonatomic, retain) NSMutableArray *list; //Nested Extensions - further extensions that are part of the extension

- (NSDictionary *)generateAndReturnExtensionDictionary; //returns dictionary of extension ready to be formatted
- (void)extensionParser:(NSDictionary *)dictionary; //parses extension from dictionary

@end
