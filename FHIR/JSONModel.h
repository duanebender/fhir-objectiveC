//
// JsonModel.h
//
#warning - currently being worked on
//
/*
#import <Foundation/Foundation.h>
#import "JSONKit.h"


@class FHIRActive;
@class FHIRSubject;
@class FHIRProvider;
@class FHIRIdentifier2;
@class FHIRIdentifier;
@class FHIRText;
@class FHIRPatient;

@interface JSON : NSObject
{
    FHIRPatient * Patient;
}

@property(nonatomic,retain) FHIRPatient * Patient;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface FHIRActive : NSObject
{
    NSString * Value;
}

@property(nonatomic,retain) NSString * Value;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface FHIRSubject : NSObject
{
    NSString * Type;
    NSString * Id;
}

@property(nonatomic,retain) NSString * Type;
@property(nonatomic,retain) NSString * Id;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface FHIRProvider : NSObject
{
    NSString * Type;
    NSString * Id;
}

@property(nonatomic,retain) NSString * Type;
@property(nonatomic,retain) NSString * Id;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface FHIRIdentifier2 : NSObject
{
    NSString * System;
    NSString * Id;
}

@property(nonatomic,retain) NSString * System;
@property(nonatomic,retain) NSString * Id;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface FHIRIdentifier : NSObject
{
    NSString * Label;
    FHIRIdentifier2 * Identifier;
}

@property(nonatomic,retain) NSString * Label;
@property(nonatomic,retain) FHIRIdentifier2 * Identifier;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface FHIRText : NSObject
{
    NSString * Status;
    NSString * Div;
}

@property(nonatomic,retain) NSString * Status;
@property(nonatomic,retain) NSString * Div;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface FHIRPatient : NSObject
{
    FHIRActive * Active;
    FHIRSubject * Subject;
    FHIRProvider * Provider;
    NSMutableArray * Identifier;
    FHIRText * Text;
}

@property(nonatomic,retain) FHIRActive * Active;
@property(nonatomic,retain) FHIRSubject * Subject;
@property(nonatomic,retain) FHIRProvider * Provider;
@property(nonatomic,retain) NSMutableArray * Identifier;
@property(nonatomic,retain) FHIRText * Text;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end

//JsonModel.h End
*/
