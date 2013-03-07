//
//  XMLToDict.h
//  FHIR
//
//  Created by Adam Sippel on 2013-03-04.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
#import "XMLReader.h"

@interface XMLToDict : NSObject <NSXMLParserDelegate>

@property (nonatomic) NSString *incomingResourceType;

- (void)convertXmlToDictionary:(NSString *)urlString resourceType:(NSString *)resourceType;

@end
