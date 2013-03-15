//
//  FHIRResourceDictionary.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-07.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHIRResourceDictionary : NSObject

@property (nonatomic, retain) NSMutableDictionary *dataForResource; //distionary of resources
@property (nonatomic, retain) NSString *resourceName; //name of the resource to be collected

- (void)cleanAndCheck; //removes nil values from dictionary

@end
