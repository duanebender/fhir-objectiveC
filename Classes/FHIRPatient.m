//
//  Patient.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRPatient.h"
#import "FHIRCommunication.h"
#import "FHIRAttachment.h"
#import "FHIRResourceContained.h"

@implementation FHIRPatient:FHIRResource

@synthesize patientDictionary = _patientDictionary; //a dictionary containing all resources in this patient object
@synthesize resourceTypeValue = _resourceTypeValue; //holds resource type, text, name, and extensions
@synthesize identifier = _identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY.
@synthesize name = _name;//THIS ARRAY IS FILLED WITH "HumanName" OBJECTS ONLY.
@synthesize telecom = _telecom; //THIS ARRAY FILLED WITH "Contact" OBJECTS ONLY.
@synthesize gender = _gender; 
@synthesize birthDate = _birthDate; 
@synthesize deceasedX = _deceasedX; //(Boolean/dateTime)
@synthesize address = _address; //THIS ARRAY IS FILLED WITH "Address" OBJECTS ONLY.
@synthesize maritalStatus = _maritalStatus; 
@synthesize multipleBirthX = _multipleBirthX; //(Integer/Boolean object)
@synthesize photo = _photo; //THIS ARRAY IS FILLED WITH "Attachment" OBJECTS ONLY.
@synthesize provider = _provider; //(ResourceReference(Organisation))
@synthesize link = _link; //THIS ARRAY IS FILLED WITH "ResourceReference(Patient)" OBJECTS ONLY.
@synthesize active = _active; 
@synthesize animal = _animal; 
@synthesize communication = _communication; //THIS ARRAY IS FILLED WITH "Communication" OBJECTS ONLY.
@synthesize contact = _contact; //THIS ARRAY IS FILLED WITH "PatientContact" OBJECTS ONLY.

- (id)init
{
    self = [super init];
    if (self) {
        _patientDictionary = [[FHIRResourceDictionary alloc] init];
        _link = [[NSMutableArray alloc] init];
        _active = [[FHIRBool alloc] init];
        _identifier = [[NSMutableArray alloc] init];
        _name = [[NSMutableArray alloc] init];
        _telecom = [[NSMutableArray alloc] init];
        _gender = [[FHIRCodeableConcept alloc] init];
        _birthDate = [[FHIRDate alloc] init];
        _deceasedX = [[NSArray alloc] init];
        _address = [[NSMutableArray alloc] init];
        _maritalStatus = [[FHIRCodeableConcept alloc] init];
        _multipleBirthX = [[NSArray alloc] init];
        _photo = [[NSMutableArray alloc] init];
        _provider = [[FHIRResourceReference alloc] init];
        _resourceTypeValue = [[FHIRResource alloc] init];
        _animal = [[FHIRAnimal alloc] init];
        _communication = [[NSMutableArray alloc] init];
        _contact = [[NSMutableArray alloc] init];
    }
    return self;
}

//override method
- (NSString *)getResourceType
{
    return [_resourceTypeValue returnResourceType];
}

- (FHIRResourceDictionary *)generateAndReturnResourceDictionary
{
    //find deceased type to set for xml tag
    NSString *deceasedTagString = [[NSString alloc] init];
    if ([_deceasedX count] == 1)
    {
        if ([[_deceasedX objectAtIndex:0] class] == [FHIRBool class]) deceasedTagString = [NSString stringWithFormat:@"deceasedBoolean"];
        else if ([[_deceasedX objectAtIndex:0] class] == [FHIRDate class]) deceasedTagString = [NSString stringWithFormat:@"deceasedDateTime"];
        else deceasedTagString = [NSString stringWithFormat:@"deceased?"];
    }
    
    //find multipleBirth type to set for xml tag
    NSString *multiBirthTagString = [[NSString alloc] init];
    if ([_multipleBirthX count] == 1)
    {
        if ([[_multipleBirthX objectAtIndex:0] class] == [FHIRBool class]) multiBirthTagString = [NSString stringWithFormat:@"multipleBirthBoolean"];
        else if ([[_multipleBirthX objectAtIndex:0] class] == [NSNumber class]) multiBirthTagString = [NSString stringWithFormat:@"multipleBirthInteger"];
        else multiBirthTagString = [NSString stringWithFormat:@"multipleBirth?"];
    }
    
    _patientDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [FHIRExistanceChecker emptyObjectChecker:[_active generateAndReturnDictionary]], @"active",
                                           [FHIRExistanceChecker generateArray:_name], @"name",
                                           [FHIRExistanceChecker generateArray:_identifier], @"identifier",
                                           [FHIRExistanceChecker emptyObjectChecker:[_gender generateAndReturnDictionary]], @"gender",
                                           [FHIRExistanceChecker generateArray:_resourceTypeValue.extensions], @"extension",
                                           [FHIRExistanceChecker emptyObjectChecker:[_resourceTypeValue.text generateAndReturnDictionary]], @"text",
                                           [FHIRExistanceChecker generateArray:_link], @"link",
                                           [FHIRExistanceChecker emptyObjectChecker:[_provider generateAndReturnDictionary]], @"provider",
                                           [FHIRExistanceChecker generateArray:_resourceTypeValue.contained], @"contained",
                                           [FHIRExistanceChecker checkEmptySingleObjectArray:_deceasedX], deceasedTagString,
                                           [FHIRExistanceChecker generateArray:_address], @"address",
                                           [FHIRExistanceChecker emptyObjectChecker:[_maritalStatus generateAndReturnDictionary]], @"maritalStatus",
                                           [FHIRExistanceChecker checkEmptySingleObjectArray:_multipleBirthX], multiBirthTagString,
                                           [FHIRExistanceChecker generateArray:_photo], @"photo",
                                           [FHIRExistanceChecker emptyObjectChecker:[_birthDate generateAndReturnDictionary]], @"birthDate",
                                           [FHIRExistanceChecker generateArray:_contact], @"contact",
                                           [FHIRExistanceChecker emptyObjectChecker:[_animal generateAndReturnDictionary]], @"animal",
                                           [FHIRExistanceChecker generateArray:_communication], @"communication",
                                           [FHIRExistanceChecker generateArray:_telecom], @"telecom",
                                           [FHIRExistanceChecker generateArray:_contact], @"contact",
                                           
                                           nil];
    NSLog(@"BEFORE: %@", _patientDictionary.dataForResource);
    [_patientDictionary cleanUpDictionaryValues];
    NSLog(@"AFTER: %@", _patientDictionary.dataForResource);
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_patientDictionary.dataForResource, @"Patient", nil];
    returnable.resourceName = @"patient";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)patientParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"patient"];
    NSDictionary *patientDict = [dictionary objectForKey:@"Patient"];
    //NSLog(@"%@", patient);
    
    //edited for XML start OLD-->[_resourceTypeValue resourceParser:patientDict];
    [_resourceTypeValue.text narrativeParser:[patientDict objectForKey:@"text"]];
    
    //_resource contained
    NSArray *containArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"contained"]];
    _resourceTypeValue.contained = [[NSMutableArray alloc] init];
    for (int i = 0; i < [containArray count]; i++)
    {
        FHIRResourceContained *tempCON = [[FHIRResourceContained alloc] init];
        [tempCON resourceContainedParser:[containArray objectAtIndex:i]];
        [_resourceTypeValue.contained addObject:tempCON];
        //NSLog(@"%@", _resourceTypeValue.contained);
    }
    
    //_resource extensions
    NSArray *extensionArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"extension"]];
    _resourceTypeValue.extensions = [[NSMutableArray alloc] init];
    for (int i = 0; i < [extensionArray count]; i++)
    {
        FHIRExtension *tempEX = [[FHIRExtension alloc] init];
        [tempEX extensionParser:[extensionArray objectAtIndex:i]];
        [_resourceTypeValue.extensions addObject:tempEX];
        //NSLog(@"%@", _resourceTypeValue.extensions);
    }
    //edited for XML end
    
    [_active setValueBool:[patientDict objectForKey:@"active"]];
    
    //_identifier
    NSArray *identifierArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"identifier"]];
    _identifier = [[NSMutableArray alloc] init];
    for (int i = 0; i < [identifierArray count]; i++)
    {
        FHIRIdentifier *tempID = [[FHIRIdentifier alloc] init];
        [tempID identifierParser:[identifierArray objectAtIndex:i]];
        [_identifier addObject:tempID];
    }
    
    //_name
    NSArray *nameArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"name"]];
    _name = [[NSMutableArray alloc] init];
    for (int i = 0; i < [nameArray count]; i++)
    {
        FHIRHumanName *tempHN = [[FHIRHumanName alloc] init];
        [tempHN humanNameParser:[nameArray objectAtIndex:i]];
        [_name addObject:tempHN];
    }
    
    //_telecom
    NSArray *telecomArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"telecom"]];
    _telecom = [[NSMutableArray alloc] init];
    for (int i = 0; i < [telecomArray count]; i++)
    {
        FHIRContact *tempCO = [[FHIRContact alloc] init];
        [tempCO contactParser:[telecomArray objectAtIndex:i]];
        [_telecom addObject:tempCO];
    }
    
    [_gender codeableConceptParser:[patientDict objectForKey:@"gender"]];
    [_birthDate setValueDate:[patientDict objectForKey:@"birthDate"]];
    
    //sets deceasedX array with the correct object sent
    for (NSString *key in dictionary)
    {
        if ([key isEqualToString:@"deceasedDateTime"] == TRUE)
        {
            FHIRDate *deceasedDate = [[FHIRDate alloc] init];
            [deceasedDate setValueDate:[patientDict objectForKey:@"deceasedDateTime"]];
            _deceasedX = [[NSArray alloc] initWithObjects:deceasedDate, nil];
        }
        else if ([key isEqualToString:@"deceasedBoolean"] == TRUE)
        {
            FHIRBool *deceasedBool = [[FHIRBool alloc] init];
            [deceasedBool setValueBool:[patientDict objectForKey:@"deceasedBoolean"]];
            _deceasedX = [[NSArray alloc] initWithObjects:deceasedBool, nil];
        }
        
    }
    
    //_address
    NSArray *addressArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"address"]];
    _address = [[NSMutableArray alloc] init];
    for (int i = 0; i < [addressArray count]; i++)
    {
        FHIRAddress *tempAD = [[FHIRAddress alloc] init];
        [tempAD addressParser:[addressArray objectAtIndex:i]];
        [_address addObject:tempAD];
    }
    
    [_maritalStatus codeableConceptParser:[patientDict objectForKey:@"maritalStatus"]];
    
    //sets multipleBirthX array with the correct object sent
    for (NSString *key in dictionary)
    {
        if ([key isEqualToString:@"multipleBirthBoolean"] == TRUE)
        {
            //NSLog(@"Bool MultiBirth");
            FHIRBool *multiBirthBool = [[FHIRBool alloc] init];
            [multiBirthBool setValueBool:[patientDict objectForKey:@"multipleBirthBoolean"]];
            _multipleBirthX = [[NSArray alloc] initWithObjects:multiBirthBool, nil];
        }
        else if ([key isEqualToString:@"multipleBirthInteger"] == TRUE)
        {
            //NSLog(@"Int MultiBirth");
            NSNumber *multiBirthInt = [[NSNumber alloc] init];
            multiBirthInt = [NSNumber numberWithInteger:[[patientDict objectForKey:@"multipleBirthInteger"] integerValue]];
            _multipleBirthX = [[NSArray alloc] initWithObjects:multiBirthInt, nil];
        }
        
    }
    
    //_photo
    NSArray *photoArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"photo"]];
    _photo = [[NSMutableArray alloc] init];
    for (int i = 0; i < [photoArray count]; i++)
    {
        FHIRAttachment *tempAT = [[FHIRAttachment alloc] init];
        [tempAT attachmentParser:[photoArray objectAtIndex:i]];
        [_photo addObject:tempAT];
    }
    
    [_provider resourceReferenceParser:[patientDict objectForKey:@"provider"]];
    
    //_contact
    NSArray *contactArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"contact"]];
    _contact = [[NSMutableArray alloc] init];
    for (int i = 0; i < [contactArray count]; i++)
    {
        FHIRPatientContact *tempPC = [[FHIRPatientContact alloc] init];
        [tempPC patientContactParser:[contactArray objectAtIndex:i]];
        [_contact addObject:tempPC];
        NSLog(@"%@", _contact);
    }
    
    //_link
    NSArray *linkArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"link"]];
    _link = [[NSMutableArray alloc] init];
    for (int i = 0; i < [linkArray count]; i++)
    {
        FHIRResourceReference *tempRR = [[FHIRResourceReference alloc] init];
        [tempRR resourceReferenceParser:[linkArray objectAtIndex:i]];
        [_link addObject:tempRR];
        //NSLog(@"%@", _link);
    }
    
    [_animal animalParser:[patientDict objectForKey:@"animal"]];
    
    //_communication
    NSArray *communicationArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"communication"]];
    _communication = [[NSMutableArray alloc] init];
    for (int i = 0; i < [communicationArray count]; i++)
    {
        FHIRCommunication *tempCOM = [[FHIRCommunication alloc] init];
        [tempCOM communicationParser:[communicationArray objectAtIndex:i]];
        [_communication addObject:tempCOM];
    }
    
}

@end
