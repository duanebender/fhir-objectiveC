//
//  Image.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Contains an image
 */

#import <Foundation/Foundation.h>
#import "FHIRCode.h"
#import "Base64Binary.h"

@interface FHIRImage : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *imageDictionary; //contains all image resources

//following properties are individual parts of the Identifier Object that can be influenced Individually
@property (nonatomic, retain) FHIRCode *mimeType;
@property (nonatomic, retain) Base64Binary *content; //the image itself encoded in base64Binary

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //return a NSDictionary containing all the elements of this Image Object
- (void)imageParser:(NSDictionary *)dictionary; //set this image object from an NSdictionary

@end
