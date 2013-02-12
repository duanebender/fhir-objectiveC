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

@interface Image : Element

@property (nonatomic, retain) Code *mimeType;
@property (nonatomic, retain) Base64Binary *content;

@end
