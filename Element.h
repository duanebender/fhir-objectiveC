//
//  Element.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Element : NSObject

- (NSString *)getXmlId;
- (void)setXmlId:(NSString *)xmlId;

@property (nonatomic, retain) NSString *xmlId;

@end
