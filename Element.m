//
//  Element.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Element.h"

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
