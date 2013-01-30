//
//  ResourceReference.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "ResourceReference.h"

@interface ResourceReference()

@property (nonatomic, retain) Code *type; //The name of one of the resource types defined in this specification to identify the type of the resource being referenced
@property (nonatomic, retain) Uri *uriId; //A literal URL that resolves to the location of the resource. The URL may be relative or absolute. Relative Ids contain the logical id of the resource. This reference is version independent - it points to the latest version of this resource
@property (nonatomic, retain) Uri *version; //A literal URL that resolves to the location of a particular version of the resource. The URL may be relative or absolute. Relative Ids contain the logical version id of the resource.
@property (nonatomic, retain) String_ *display; //Plain text narrative that identifies the resource in addition to the resource reference

@end

@implementation ResourceReference

- (Code *)getType
{
    return self.type;
}

- (void)setType:(Code *)value
{
    self.type = value;
}

- (Uri *)getId
{
    return self.uriId;
}

- (void)setId:(Uri *)value
{
    self.uriId = value;
}

- (Uri *)getVersion
{
    return self.version;
}

- (void)setVersion:(Uri *)value
{
    self.version = value;
}

- (String_ *)getDisplay
{
    return self.display;
}

- (void)setDisplay:(String_ *)value
{
    self.display = value;
}

@end
