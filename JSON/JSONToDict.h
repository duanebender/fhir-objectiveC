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

- (NSObject *)convertJsonToDictionary:(NSString *)urlString;

@end
