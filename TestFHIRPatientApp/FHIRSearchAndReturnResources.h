//
//  FHIRSearchAndReturnResources.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-08-12.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHIRSearchAndReturnResources : NSObject

+ (NSArray *)returnArrayOfPatientsSearched:(NSString *)urlStringOfSearch;

@end
