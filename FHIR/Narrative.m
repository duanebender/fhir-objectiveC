//
//  Narrative.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Narrative.h"

@interface Narrative()
{
    NarrativeStatus narrativeStatus;
}
@property (nonatomic) NarrativeStatus *status; //The status of the narrative - whether it's entirely generated (from just the defined data or the extensions too), or whether a human authored it and it may contain additional data
@property (nonatomic, retain) XhtmlNode *div; //The actual narrative content, a stripped down version of XHTML
@property (nonatomic, retain) NSArray *image; //array of images referred to directly in the xhtml

@end

@interface Image()

@property (nonatomic, retain) Code *mimeType;
@property (nonatomic, retain) Base64Binary *content;

@end

@implementation Narrative

- (NarrativeStatus *)fromCode:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return NULL;
    else if ([codeString caseInsensitiveCompare:@"generated"] == TRUE) return generated;
    else if ([codeString caseInsensitiveCompare:@"extensions"] == TRUE) return extensions;
    else if ([codeString caseInsensitiveCompare:@"additional"] == TRUE) return additional;
    else if ([codeString caseInsensitiveCompare:@"empty"] == TRUE) return empty;
    else [NSException raise:@"Unknown Narrative Status" format:@"code %@", codeString];
};

- (NSString *)toCode
{
    switch (narrativeStatus)
    {
        case generated:
            return @"generated";
            break;
        case extensions:
            return @"generated";
            break;
        case additional:
            return @"generated";
            break;
        case empty:
            return @"generated";
            break;
            
        default:
            return @"?";
    }
}

- (NarrativeStatus *)getStatus
{
    return self.status;
}

- (void)setStatus:(NarrativeStatus *)value
{
    self.status = value;
}

- (XhtmlNode *)getDiv
{
    return self.div;
}

- (void)setDiv:(XhtmlNode *)value
{
    self.div = value;
}

- (NSArray *)getImage
{
    return self.image;
}

@end


@implementation Image

- (Code *)getMimeType
{
    return self.mimeType;
}

- (void)setMimeType:(Code *)value
{
    self.mimeType = value;
}

- (Base64Binary *)getContent
{
    return self.content;
}

- (void)setContent:(Base64Binary *)value
{
    self.content = value;
}

@end
