//
//  Narrative.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Code.h"
#import "XhtmlNode.h"

typedef enum NarrativeStatus
{
    NarrativeStatusGenerated = 1, // The contents of the narrative are entirely generated from the structured data in the resource.
    NarrativeStatusExtensions, //The contents of the narrative are entirely generated from the structured data in the resource and some of the content is generated from extensions
    NarrativeStatusAdditional, //The contents of the narrative contain additional information not found in the structured data
    NarrativeStatusEmpty //the contents of the narrative are some equivalent of "No human readable text provided for this resource"
}NarrativeStatus;

@interface Narrative : Element
{
    NarrativeStatus narrativeStatus;
}
@property (nonatomic) NarrativeStatus *status; //The status of the narrative - whether it's entirely generated (from just the defined data or the extensions too), or whether a human authored it and it may contain additional data
@property (nonatomic, retain) XhtmlNode *div; //The actual narrative content, a stripped down version of XHTML
@property (nonatomic, retain) NSMutableArray *image; //array of images referred to directly in the xhtml

@end
