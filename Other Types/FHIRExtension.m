//
//  Extension.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-26.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRExtension.h"
#import "FHIRExistanceChecker.h"
#import "Base64Binary.h"
#import "FHIRCodeableConcept.h"
#import "FHIRQuantity.h"
#import "FHIRAttachment.h"
#import "FHIRChoice.h"
#import "FHIRRange.h"

@implementation FHIRExtension
{
    NSString *valueTag;
}
@synthesize url = _url; //Source of the definition for the extension code - a logical name or a URL
@synthesize isModifier = _isModifier; //
@synthesize valueX = _valueX; //
@synthesize extension = _extension; //Nested Extensions - further extensions that are part of the extension

- (id)init
{
    self = [super init];
    if (self) {
        _extensionDictionary = [[FHIRResourceDictionary alloc] init];
        _url = [[FHIRUri alloc] init];
        _isModifier = [[FHIRBool alloc] init];
        _valueX = [[NSArray alloc] init];
        _extension = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)checkValueExtensionType:(NSDictionary *)valueDict valueString:(NSString *)key
{
    valueTag = [[NSString alloc] initWithString:key];
    
    if ([key isEqualToString:@"valueInteger"])
    {
        NSNumber *value = [[NSNumber alloc] initWithInteger:[valueDict objectForKey:@"value"]];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueDecimal"])
    {
        _valueX = [[NSArray alloc] initWithObjects:[valueDict objectForKey:@"value"], nil];
    }
    else if ([key isEqualToString:@"valueDateTime"] || [key isEqualToString:@"valueDate"] || [key isEqualToString:@"valueInstant"]) //FHIRExistance checker will handle the difference
    {
        _valueX = [[NSArray alloc] initWithObjects:[FHIRExistanceChecker generateDateTimeFromString:[valueDict objectForKey:@"value"]], nil];
    }
    else if ([key isEqualToString:@"valueString"])
    {
        FHIRString *value = [[FHIRString alloc] init];
        [value setValueString:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueUri"])
    {
        FHIRUri *value = [[FHIRUri alloc] init];
        [value setValueURI:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueBoolean"])
    {
        FHIRBool *value = [[FHIRBool alloc] init];
        [value setValueBool:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueCode"])
    {
        FHIRCode *value = [[FHIRCode alloc] init];
        [value setValueCode:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueBase64Binary"])
    {
        Base64Binary *value = [[Base64Binary alloc] init];
        [value setValueBase64BinaryData:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueCoding"])
    {
        FHIRCoding *value = [[FHIRCoding alloc] init];
        [value codingParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueCodeableConcept"])
    {
        FHIRCodeableConcept *value = [[FHIRCodeableConcept alloc] init];
        [value codeableConceptParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueAttachment"])
    {
        FHIRAttachment *value = [[FHIRAttachment alloc] init];
        [value attachmentParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueIdentifier"])
    {
        FHIRIdentifier *value = [[FHIRIdentifier alloc] init];
        [value identifierParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueQuantity"])
    {
        FHIRQuantity *value = [[FHIRQuantity alloc] init];
        [value quantityParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueChoice"])
    {
        FHIRChoice *value = [[FHIRChoice alloc] init];
        [value choiceParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueRange"])
    {
        FHIRRange *value = [[FHIRRange alloc] init];
        [value rangeParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valuePeriod"])
    {
        FHIRPeriod *value = [[FHIRPeriod alloc] init];
        [value periodParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueRatio"])
    {
        FHIRRatio *value = [[FHIRRatio alloc] init];
        [value ratioParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueHumanName"])
    {
        FHIRHumanName *value = [[FHIRHumanName alloc] init];
        [value humanNameParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueAddress"])
    {
        FHIRAddress *value = [[FHIRAddress alloc] init];
        [value addressParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueContact"])
    {
        FHIRContact *value = [[FHIRContact alloc] init];
        [value contactParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueSchedule"])
    {
        FHIRSchedule *value = [[FHIRSchedule alloc] init];
        [value scheduleParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else if ([key isEqualToString:@"valueResource"])
    {
        FHIRResource *value = [[FHIRResource alloc] init];
        [value resourceParser:valueDict];
        _valueX = [[NSArray alloc] initWithObjects:value, nil];
    }
    else _valueX = NULL;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _extensionDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [_url generateAndReturnDictionary], @"url",
                                           [_isModifier generateAndReturnDictionary], @"isModifier",
                                           [FHIRExistanceChecker checkEmptySingleObjectArray:_valueX], valueTag,
                                           [FHIRExistanceChecker generateArray:_extension], @"extension",
                                           nil];
    _extensionDictionary.resourceName = @"Extension";
    [_extensionDictionary cleanUpDictionaryValues];
    return _extensionDictionary.dataForResource;
}

- (void)extensionParser:(NSDictionary *)dictionary
{
    [_url setValueURI:[dictionary objectForKey:@"uri"]];
    [_isModifier setValueBool:[dictionary objectForKey:@"isModifier"]];
    
    //_value
    for (NSString *key in dictionary)
    {
        NSRange r;
        if ((r = [key rangeOfString:@"/^value(\\d+)$/" options:NSRegularExpressionSearch]).location != NSNotFound)
        {
            [self checkValueExtensionType:[dictionary objectForKey:key] valueString:key];
        }
    }
    
    //_list
    NSArray *listArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"extension"]];
    _extension = [[NSMutableArray alloc] init];
    for (int i = 0; i < [listArray count]; i++)
    {
        FHIRExtension *tempS1 = [[FHIRExtension alloc] init];
        [tempS1 extensionParser:[listArray objectAtIndex:i]];
        [_extension addObject:tempS1];
        //NSLog(@"%@", _extension);
    }
}

@end
