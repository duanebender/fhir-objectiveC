//
//  Narrative.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Narrative.h"

@implementation Narrative

@synthesize status = _status; //The status of the narrative - whether it's entirely generated (from just the defined data or the extensions too), or whether a human authored it and it may contain additional data
@synthesize div = _div; //The actual narrative content, a stripped down version of XHTML
@synthesize image = _image; //array of images referred to directly in the xhtml

- (NSInteger)fromCode:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return 0;
    else if ([codeString caseInsensitiveCompare:@"generated"] == TRUE) return NarrativeStatusGenerated;
    else if ([codeString caseInsensitiveCompare:@"extensions"] == TRUE) return NarrativeStatusExtensions;
    else if ([codeString caseInsensitiveCompare:@"additional"] == TRUE) return NarrativeStatusAdditional;
    else if ([codeString caseInsensitiveCompare:@"empty"] == TRUE) return NarrativeStatusEmpty;
    else [NSException raise:@"Unknown Narrative Status" format:@"code %@", codeString];
};

- (NSString *)toCode
{
    switch (narrativeStatus)
    {
        case NarrativeStatusGenerated:
            return @"generated";
            break;
        case NarrativeStatusExtensions:
            return @"generated";
            break;
        case NarrativeStatusAdditional:
            return @"generated";
            break;
        case NarrativeStatusEmpty:
            return @"generated";
            break;
            
        default:
            return @"?";
    }
}

@end
