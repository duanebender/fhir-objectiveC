//
//  TestingJSON.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestingJSON : NSObject

@property (nonatomic, retain) NSString *jsonString;

- (void)generateJsonString:(NSDictionary *)json;

@end
