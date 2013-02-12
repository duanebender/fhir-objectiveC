//
//  HumanId.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "HumanId.h"

@implementation HumanId

@synthesize use = _use; //Identifies the use for this identifier, if known
@synthesize label = _label; //A label for the identifier that can be displayed to a human so they can recognise the identifier
@synthesize identifier = _identifier; //The identifier itself
@synthesize period = _period; //Time period during which identifier was valid for use
@synthesize assigner = _assigner; //Organisation that issued/manages the identifier

- (NSInteger)fromCode:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return 0;
    else if ([codeString caseInsensitiveCompare:@"usual"] == TRUE) return usual;
    else if ([codeString caseInsensitiveCompare:@"official"] == TRUE) return official;
    else if ([codeString caseInsensitiveCompare:@"temp"] == TRUE) return temp;
    else [NSException raise:@"Unknown Identifier" format:@"code %@", codeString];
};

- (NSString *)toCode
{
    switch (use)
    {
        case usual:
            return @"usual";
            break;
        case official:
            return @"official";
            break;
        case temp:
            return @"temp";
            break;
            
        default:
            return @"?";
    }
}

@end
