//
// JsonModel.m
//
//
#warning - currently in the works
/*
#import "JsonModel.h"



@implementation JSON

@synthesize Patient;

- (void) dealloc
{
    [Patient release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[JSON alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        
        Patient = [[FHIRPatient alloc] initWithDictionary:[dictionary objectForKey:@"Patient"]];
    }
    return self;
}


@end


@implementation FHIRActive

@synthesize Value;

- (void) dealloc
{
    [Value release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[FHIRActive alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Value = [dictionary objectForKey:@"Value"];
    }
    return self;
}


@end


@implementation FHIRSubject

@synthesize Type;
@synthesize Id;

- (void) dealloc
{
    [Type release];
    [Id release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[FHIRSubject alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Type = [dictionary objectForKey:@"Type"];
        Id = [dictionary objectForKey:@"Id"];
    }
    return self;
}


@end


@implementation FHIRProvider

@synthesize Type;
@synthesize Id;

- (void) dealloc
{
    [Type release];
    [Id release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[FHIRProvider alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Type = [dictionary objectForKey:@"Type"];
        Id = [dictionary objectForKey:@"Id"];
    }
    return self;
}


@end


@implementation FHIRIdentifier2

@synthesize System;
@synthesize Id;

- (void) dealloc
{
    [System release];
    [Id release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[FHIRIdentifier2 alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        System = [dictionary objectForKey:@"System"];
        Id = [dictionary objectForKey:@"Id"];
    }
    return self;
}


@end


@implementation FHIRIdentifier

@synthesize Label;
@synthesize Identifier;

- (void) dealloc
{
    [Label release];
    [Identifier release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[FHIRIdentifier alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Label = [dictionary objectForKey:@"Label"];
        
        Identifier = [[FHIRIdentifier2 alloc] initWithDictionary:[dictionary objectForKey:@"Identifier"]];
    }
    return self;
}


@end


@implementation FHIRText

@synthesize Status;
@synthesize Div;

- (void) dealloc
{
    [Status release];
    [Div release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[FHIRText alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Status = [dictionary objectForKey:@"Status"];
        Div = [dictionary objectForKey:@"Div"];
    }
    return self;
}


@end


@implementation FHIRPatient

@synthesize Active;
@synthesize Subject;
@synthesize Provider;
@synthesize Identifier;
@synthesize Text;

- (void) dealloc
{
    [Active release];
    [Subject release];
    [Provider release];
    [Identifier release];
    [Text release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[FHIRPatient alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        
        Active = [[FHIRActive alloc] initWithDictionary:[dictionary objectForKey:@"Active"]];
        
        Subject = [[FHIRSubject alloc] initWithDictionary:[dictionary objectForKey:@"Subject"]];
        
        Provider = [[FHIRProvider alloc] initWithDictionary:[dictionary objectForKey:@"Provider"]];
        
        NSArray* temp =  [dictionary objectForKey:@"Identifier"];
        Identifier =  [[NSMutableArray alloc] init];
        for (NSDictionary *d in temp) {
            [Identifier addObject:[FHIRIdentifier objectWithDictionary:d]];
        }
        
        Text = [[FHIRText alloc] initWithDictionary:[dictionary objectForKey:@"Text"]];
    }
    return self;
}


@end
 
 */

//JsonModel.m End

