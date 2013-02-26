//
//  Image.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Code.h"
#import "Base64Binary.h"

#warning - content not fixed in .m

@interface Image : Element

@property (nonatomic, retain) FHIRResourceDictionary *imageDictionary;

@property (nonatomic, retain) Code *mimeType;
@property (nonatomic, retain) Base64Binary *content;

- (NSDictionary *)generateAndReturnImageDictionary; //return image resources ready for formatting
- (void)imageParser:(NSDictionary *)dictionary; //set image from dictionary

@end
