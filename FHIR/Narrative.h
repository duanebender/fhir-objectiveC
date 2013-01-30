//
//  Narrative.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"
#import "Code.h"
#import "Base64Binary.h"
#import "XhtmlNode.h"

typedef enum
{
    generated, // The contents of the narrative are entirely generated from the structured data in the resource.
    extensions, //The contents of the narrative are entirely generated from the structured data in the resource and some of the content is generated from extensions
    additional, //The contents of the narrative contain additional information not found in the structured data
    empty //the contents of the narrative are some equivalent of "No human readable text provided for this resource"
}NarrativeStatus;

@interface Narrative : Element

- (NarrativeStatus *)getStatus;
- (void)setStatus:(NarrativeStatus *)value;
- (XhtmlNode *)getDiv;
- (void)setDiv:(XhtmlNode *)value;
- (NSArray *)getImage;

@end

@interface Image : Element

- (Code *)getMimeType;
- (void)setMimeType:(Code *)value;
- (Base64Binary *)getContent;
- (void)setContent:(Base64Binary *)value;

@end
