//
//  DictToJSON.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FHIRResourceDictionary.h"
#import "Patient.h"

@interface DictToJSON : NSObject

@property (nonatomic, retain) NSString *jsonString;

- (void)generateJson:(NSObject *)jsonObject urlPath:(NSString *)urlString;

@end
