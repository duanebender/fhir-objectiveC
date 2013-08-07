//
//  Element.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Contains strings of the Element Id's
 */

#import <Foundation/Foundation.h>
#import "FHIRResourceDictionary.h"

@interface FHIRElement : NSObject

@property (nonatomic, retain) NSString *xmlId;

@end
