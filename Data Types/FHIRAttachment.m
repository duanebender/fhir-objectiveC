//
//  FHIRAttachment.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRAttachment.h"

@implementation FHIRAttachment

@synthesize attachmentDictionary = _attachmentDictionary; //resources for attachment
@synthesize contentType = _contentType; //Mime type of the content, with charset etc.
@synthesize language = _language; //Human language of the content (BCP-47).
@synthesize data = _data; //Data inline, base64ed.
@synthesize url = _url; //Uri where the data can be found.
@synthesize size = _size; //Number of bytes of content (if url provided).
@synthesize hash = _hash; //Hash of the data (sha-1, base64ed ).
@synthesize title = _title; //Label to display in place of the data.

- (id)init
{
    self = [super init];
    if (self) {
        _attachmentDictionary = [[FHIRResourceDictionary alloc] init];
        _contentType = [[FHIRCode alloc] init];
        _language = [[FHIRCode alloc] init];
        _data = [[Base64Binary alloc] init];
        _url = [[FHIRUri alloc] init];
        _size = [[FHIRInteger alloc] init];
        _hash = [[Base64Binary alloc] init];
        _title = [[FHIRString alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _attachmentDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [FHIRExistanceChecker emptyObjectChecker:[_contentType generateAndReturnDictionary]], @"contentType",
                                        [FHIRExistanceChecker emptyObjectChecker:[_language generateAndReturnDictionary]], @"language",
                                        [FHIRExistanceChecker emptyObjectChecker:[_data generateAndReturnDictionary]], @"data",
                                        [FHIRExistanceChecker emptyObjectChecker:[_url generateAndReturnDictionary]], @"url",
                                        [FHIRExistanceChecker emptyObjectChecker:[_size generateAndReturnDictionary]], @"size",
                                        [FHIRExistanceChecker emptyObjectChecker:[_hash generateAndReturnDictionary]], @"hash",
                                        [FHIRExistanceChecker emptyObjectChecker:[_title generateAndReturnDictionary]], @"title",
                                        nil];
    _attachmentDictionary.resourceName = @"Attachment";
    [_attachmentDictionary cleanUpDictionaryValues];
    return _attachmentDictionary.dataForResource;
}

- (void)attachmentParser:(NSDictionary *)dictionary
{
    [_contentType setValueCode:[dictionary objectForKey:@"contentType"]];
    [_language setValueCode:[dictionary objectForKey:@"language"]];
    [_data setValueBase64BinaryData:[dictionary objectForKey:@"data"]];
    [_url setValueURI:[dictionary objectForKey:@"url"]];
    [_size setValueInteger:[dictionary objectForKey:@"size"]];
    [_hash setValueBase64BinaryData:[dictionary objectForKey:@"hash"]];
    [_title setValueString:[dictionary objectForKey:@"title"]];
}

@end
