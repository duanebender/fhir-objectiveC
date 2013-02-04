//
//  HumanName.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "HumanName.h"

@interface HumanName()
{
    NameUse use; //Identifies the purpose for this name
}

@property (nonatomic) NameUse *use;
@property (nonatomic, retain) String_ *text; //a full text representation of the name
@property (nonatomic, retain) NSMutableArray *family; //Family name, this is the name that links to the genealogy. In some cultures (e.g. Eritrea) the family name of a son is the first name of his father.
@property (nonatomic, retain) NSMutableArray *given; //Given name. NOTE: Not to be called "first name" since given names do not always come first.
@property (nonatomic, retain) NSMutableArray *prefix; //Part of the name that is acquired as a title due to academic, legal, employment or nobility status, etc. and that comes at the start of the name
@property (nonatomic, retain) NSMutableArray *suffix; //Part of the name that is acquired as a title due to academic, legal, employment or nobility status, etc. and that comes at the end of the name
@property (nonatomic, retain) Period *period; //Indicates the period of time when this name was valid for the named person.

@end

@implementation HumanName

- (NameUse *)fromCode:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return NULL;
    else if ([codeString caseInsensitiveCompare:@"usual"] == TRUE) return usual;
    else if ([codeString caseInsensitiveCompare:@"official"] == TRUE) return official;
    else if ([codeString caseInsensitiveCompare:@"temp"] == TRUE) return temp;
    else if ([codeString caseInsensitiveCompare:@"nickname"] == TRUE) return nickname;
    else if ([codeString caseInsensitiveCompare:@"annonymous"] == TRUE) return annonymous;
    else if ([codeString caseInsensitiveCompare:@"old"] == TRUE) return old;
    else if ([codeString caseInsensitiveCompare:@"maiden"] == TRUE) return maiden;
    else [NSException raise:@"Unknown Narrative Status" format:@"code %@", codeString];
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
        case nickname:
            return @"nickname";
            break;
        case annonymous:
            return @"annonymous";
            break;
        case old:
            return @"old";
            break;
        case maiden:
            return @"maiden";
            break;
            
        default:
            return @"?";
    }
}

- (NameUse *)getUse
{
    return self.use;
}

- (void)setUse:(NameUse *)value
{
    self.use = value;
}

- (String_ *)getText
{
    return self.text;
}

- (void)setText:(String_ *)value
{
    self.text = value;
}

- (NSMutableArray *)getFamily
{
    return self.family;
}

- (NSMutableArray *)getGiven
{
    return self.given;
}

- (NSMutableArray *)getPrefix
{
    return self.prefix;
}

- (NSMutableArray *)getSuffix
{
    return self.suffix;
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
