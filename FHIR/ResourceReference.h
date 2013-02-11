//
//  ResourceReference.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"
#import "Uri.h"
#import "Code.h"
#import "String_.h"

//A reference from one resource to another

@interface ResourceReference : Type

- (Code *)getType; 
- (void)setType:(Code *)value;
- (Uri *)getId;
- (void)setId:(Uri *)value;
- (Uri *)getVersion;
- (void)setVersion:(Uri *)value;
- (String_ *)getDisplay;
- (void)setDisplay:(String_ *)value;

@property (nonatomic, retain) Code *type; //The name of one of the resource types defined in this specification to identify the type of the resource being referenced
@property (nonatomic, retain) Uri *uriId; //A literal URL that resolves to the location of the resource. The URL may be relative or absolute. Relative Ids contain the logical id of the resource. This reference is version independent - it points to the latest version of this resource
@property (nonatomic, retain) Uri *version; //A literal URL that resolves to the location of a particular version of the resource. The URL may be relative or absolute. Relative Ids contain the logical version id of the resource.
@property (nonatomic, retain) String_ *display; //Plain text narrative that identifies the resource in addition to the resource reference

@end
