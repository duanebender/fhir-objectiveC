//
//  Element.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Element.h"

@interface Element()

@property (nonatomic, retain) NSString *xmlId;

@end

@implementation Element

    - (NSString *)getXmlId
    {
        return self.xmlId;
    }

    - (void) setXmlId:(NSString *)xmlId
    {
        self.xmlId = xmlId;
    }

@end
