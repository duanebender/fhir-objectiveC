//
//  JSONToDict.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface JSONToDict : NSObject

@property (nonatomic) NSString *incomingResourceType;

- (void)convertJsonToDictionary:(NSString *)urlString resourcetype:(NSString *)resourceType;

@end
