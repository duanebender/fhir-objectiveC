//
//  FHIRResourceDictionary.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-07.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHIRResourceDictionary : NSObject

@property (nonatomic, retain) NSDictionary *dataForResource;
@property (nonatomic, retain) NSString *resourceName;
@property (nonatomic, retain) NSString *resourceType;

- (id)dataForKey:(NSString *)key;
- (void)setDataForKey:(NSString *)key Data:(id)data;
- (NSString *)getResourceName;
- (void)setResourceName:(NSString *)resourceName;
- (NSString *)getResourceType;
- (void)setResourceType:(NSString *)resourceType;

@end
