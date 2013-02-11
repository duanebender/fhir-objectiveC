//
//  Narrative.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Narrative.h"

@implementation Narrative

- (NSInteger)fromCode:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return 0;
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
