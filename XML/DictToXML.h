//
//  DictToXML.h
//  FHIR
//
//  Created by Adam Sippel on 2013-03-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FHIRResourceDictionary.h"
#import "Patient.h"

@interface DictToXML : NSObject

@property (nonatomic, retain) NSString *xmlString;

- (void)generateXmlString:(FHIRResourceDictionary *)xml urlPath:(NSString *)urlString;

@end
