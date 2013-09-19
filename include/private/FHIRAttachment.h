//
//  FHIRAttachment.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIR.h"
#import "Base64Binary.h"
#import "FHIRInteger.h"

@interface FHIRAttachment : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *attachmentDictionary; //resources for attachment

//following properties are individual parts of the Attachment Object that can be influenced Individually
@property (nonatomic, retain) FHIRCode *contentType; //Mime type of the content, with charset etc.
@property (nonatomic, retain) FHIRCode *language; //Human language of the content (BCP-47).
@property (nonatomic, retain) Base64Binary *data; //Data inline, base64ed.
@property (nonatomic, retain) FHIRUri *url; //Uri where the data can be found.
@property (nonatomic, retain) FHIRInteger *size; //Number of bytes of content (if url provided).
@property (nonatomic, retain) Base64Binary *hash; //Hash of the data (sha-1, base64ed ).
@property (nonatomic, retain) FHIRString *title; //Label to display in place of the data.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all of the elements of this attachment Object
- (void)attachmentParser:(NSDictionary *)dictionary; //set this Attachment Object from an NSDictionary

@end
