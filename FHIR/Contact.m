//
//  Contact.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize system = _system;
@synthesize use = _use;

- (NSInteger)fromCodeSystem:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return 0;
    else if ([codeString caseInsensitiveCompare:@"phone"] == TRUE) return phone;
    else if ([codeString caseInsensitiveCompare:@"fax"] == TRUE) return fax;
    else if ([codeString caseInsensitiveCompare:@"email"] == TRUE) return email;
    else if ([codeString caseInsensitiveCompare:@"url"] == TRUE) return url;
    else [NSException raise:@"Unknown CodeSystem Status" format:@"code %@", codeString];
};

- (NSString *)toCodeSystem
{
    switch (system)
    {
        case phone:
            return @"phone";
            break;
        case fax:
            return @"fax";
            break;
        case email:
            return @"email";
            break;
        case url:
            return @"url";
            break;
            
        default:
            return @"?";
    }
}

- (NSInteger)fromCodeUse:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return 0;
    else if ([codeString caseInsensitiveCompare:@"home"] == TRUE) return home;
    else if ([codeString caseInsensitiveCompare:@"work"] == TRUE) return work;
    else if ([codeString caseInsensitiveCompare:@"temp"] == TRUE) return temp;
    else if ([codeString caseInsensitiveCompare:@"old"] == TRUE) return old;
    else if ([codeString caseInsensitiveCompare:@"mobile"] == TRUE) return mobile;
    else [NSException raise:@"Unknown CodeSystem Status" format:@"code %@", codeString];
};

- (NSString *)toCodeUse
{
    switch (use)
    {
        case home:
            return @"home";
            break;
        case work:
            return @"work";
            break;
        case temp:
            return @"temp";
            break;
        case old:
            return @"old";
            break;
        case mobile:
            return @"mobile";
            break;
            
        default:
            return @"?";
    }
}

- (ContactSystem *)getSystem
{
    return self.system;
}

- (void)setSystem:(ContactSystem *)value
{
    self.system = value;
}

- (String_ *)getValue
{
    return self.value;
}

- (void)setValue:(String_ *)value
{
    self.value = value;
}

- (ContactUse *)getUse
{
    return self.use;
}

- (void)setUse:(ContactUse *)value
{
    self.use = value;
}

- (Period *)getPeriod
{
    return self.period;
}

- (void)setPeriod:(Period *)value
{
    self.period = value;
}

@end
