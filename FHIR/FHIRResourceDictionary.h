//
//  FHIRResourceDictionary.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-07.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHIRResourceDictionary : NSObject

@property (nonatomic, retain) NSDictionary *dataForResource; //distionary of resources
@property (nonatomic, retain) NSString *resourceName; //name of resource dictionary
@property (nonatomic, retain) NSString *resourceType; //type of resource the dictionary itself is

- (void)setDataForKey:(NSString *)key Data:(id)data;

@end
