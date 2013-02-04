//
//  HumanName.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"
#import "String_.h"
#import "Period.h"

typedef enum
{
    usual, //Known as/conventional/the one you normally use
    official, //The formal name as registered in an official (government) registry, but which name might not be commonly used. May be called "legal name".
    temp, //A temporary name. A name valid time can provide more detailed information. This may also be used for temporary names assigned at birth or in emergency situations.
    nickname, //A name that is used to address the person in an informal manner, but is not part of their formal or usual name
    annonymous, //Anonymous assigned name, alias, or pseudonym (used to protect a person's identity for privacy reasons)
    old, //This name is no longer in use (or was never correct, but retained for records)
    maiden //A name used prior to marriage. Marriage naming customs vary greatly around the world. This name use is for use by applications that collect and store "maiden" names. Though the concept of maiden name is often gender specific, the use of this term is not gender specific. The use of this term does not imply any particular history for a person's name, nor should the maiden name be determined algorithmically.
}NameUse;

@interface HumanName : Type

- (NameUse *)getUse;
- (void)setUse:(NameUse *)value;
- (String_ *)getText;
- (void)setText:(String_ *)value;
- (NSMutableArray *)getFamily; //returns an array of String_ <String_>
- (NSMutableArray *)getGiven; //returns an array of String_ <String_>
- (NSMutableArray *)getPrefix; //returns an array of String_ <String_>
- (NSMutableArray *)getSuffix; //returns an array of String_ <String_>
- (Period *)getPeriod;
- (void)setPeriod:(Period *)value;

@end
