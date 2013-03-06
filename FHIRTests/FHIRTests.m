//
//  FHIRTests.m
//  FHIRTests
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "FHIRTests.h"
#import "Patient.h"
#import "DictToJSON.h"
#import "HumanName.h"
#import "JSONToDict.h"
#import "Base64Encoder.h"
#import "Base64Decoder.h"
#import "XMLToDict.h"


@implementation FHIRTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.

    NSLog(@"Initializing test suite...");
    
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
    NSLog(@"FHIR tests complete.");


}

- (void)test
{
    NSLog(@"Beginning FHIR tests...");
    
    // Test 1 : Round-trip test
    //          Create a patient resource object from the obj-C model
    //          Run the XML formatter on it
    //          Parse the XML back to an object
    //          Do a field-by-field comparison of the original with the roundtripped one
    
    //Patient *patient = [[Patient alloc] init];
    //patient.active = Boolean.true;
    
    Patient *patient = [[Patient alloc] init];
    
    //activestatus test
    patient.active.value = YES;
    NSLog(@"Active Status of Patient: %@", ([patient active])? @"YES" : @"NO");
    STAssertTrue(patient.active.value == YES, @"BOOL Should be YES"); //should pass
    STAssertFalse(patient.active.value == NO, @"BOOL Should be YES"); //should pass
    
    //test resoourcetype
    STAssertTrue(patient.getResourceType == ResourceTypePatient, @"Should be true."); //should pass
    STAssertFalse(patient.getResourceType == ResourceTypeAdmission, @"Should be false"); //should pass
    
    //test maritalstatus
//    patient.details.maritalStatus.text.value = @"Single";
    [patient.details.maritalStatus.text setValue:@"Single"];
    
    
    
    //NSLog(@"Active Status of Patient: %@", patient.details.maritalStatus.text.value);
    STAssertEqualObjects(patient.details.maritalStatus.text.value, @"Single", @"Should be single."); //should pass
    
    //test animal
    [patient.animal.breed.coding addObject:@"This is code?"];
    STAssertEqualObjects([patient.animal.breed.coding objectAtIndex:0], @"This is code?", @"This should pass."); //should pass
    
    //test name demographic array
    [patient.details.name addObject:@"Sir Sparkles"];
    STAssertEqualObjects([patient.details.name objectAtIndex:0], @"Sir Sparkles", @"This should pass."); //should pass
    
    //identifier testing
    HumanId *human1 = [[HumanId alloc] init];
    human1.period.start = [NSDate date];
    [patient.identifier addObject:human1];
    STAssertEqualObjects([patient.identifier objectAtIndex:0], human1, @"Should Match Values.");
    STAssertEqualObjects([NSDateFormatter localizedStringFromDate:human1.period.start dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle],[NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"Dates should match."); //should pass
    
    //Test codeableconcept NSString
    patient.animal.breed.primary.value = @"Pie";
    STAssertEqualObjects(patient.animal.breed.primary.value, @"Pie", @"Should Match Values."); //should pass
    
    //Test ResourceReference Uri
    patient.provider.version.uri = [NSURL URLWithString:@"http://www.google.ca"];
    STAssertEqualObjects(patient.provider.version.uri, [NSURL URLWithString:@"http://www.google.ca"], @"Should both be google url.");
    
    //display contents of any object
    //NSLog(@"TestObject ***************** %@",patient.provider.version.uri);
    
}

- (void)testJSON
{
    NSLog(@"Beginning FHIRJSON tests...");
    
    //code in here
    //initialize test patient
    Patient *patientJson = [[Patient alloc] init];
    
    //implement 2 resource references in link
    ResourceReference *resource1 = [[ResourceReference alloc] init];
    resource1.display.value = @"Hat";
    resource1.uriId.uri = [NSURL URLWithString:@"http://www.google.ca"];
    resource1.version.uri = [NSURL URLWithString:@"version1"];
    resource1.type.value = @"Code1";
    NSDictionary *temp = [resource1 generateAndReturnResourceReferenceDictionary];
    [patientJson.link addObject:temp];
    ResourceReference *resource2 = [[ResourceReference alloc] init];
    resource2.display.value = @"Tie";
    resource2.uriId.uri = [NSURL URLWithString:@"http://www.yahoo.ca"];
    resource2.version.uri = [NSURL URLWithString:@"version2"];
    resource2.type.value = @"Code2";
    NSDictionary *temp2 = [resource2 generateAndReturnResourceReferenceDictionary];
    [patientJson.link addObject:temp2];
    
    //test active value of patient
    patientJson.active.value = YES;
    
    //test identifier of patient
    HumanId *id1 = [[HumanId alloc] init];
    id1.identifier.idNumber.value = @"000123";
    id1.label.value = @"Human";
    [id1 setValueUse:@"official"];
    HumanId *id2 = [[HumanId alloc] init];
    id2.identifier.idNumber.value = @"321000";
    id2.label.value = @"Inhuman";
    [id2 setValueUse:@"usual"];
    NSDictionary *temp3 = [id1 generateAndReturnHumanIdDictionary];
    [patientJson.identifier addObject:temp3];
    NSDictionary *temp4 = [id2 generateAndReturnHumanIdDictionary];
    [patientJson.identifier addObject:temp4];
    
    //testing demographics of patient
    HumanName *name1 = [[HumanName alloc] init];
    String *family = [[String alloc] init];
    String *prefix1 = [[String alloc] init];
    String *prefix2 = [[String alloc] init];
    family.value = @"Family";
    prefix1.value = @"P1";
    prefix2.value = @"P2";
    NSLog(@"%@", name1);
    [name1.family addObject:[family generateAndReturnDictionary]];
    [name1.prefix addObject:[prefix1 generateAndReturnDictionary]];
    [name1.prefix addObject:[prefix2 generateAndReturnDictionary]];
    NSLog(@"%@", name1);
    name1.text.value = @"NameText";
    name1.period.start = [NSDate date];
    [patientJson.details.name addObject:[name1 generateAndReturnHumanNameDictionary]];
    
    
    
    //test JSON
    DictToJSON *json = [[DictToJSON alloc] init];
    FHIRResourceDictionary *tempDictionary = [[FHIRResourceDictionary alloc] init];

    tempDictionary = [patientJson generateAndReturnPatientResourceDictionary];
    [json generateJsonString:tempDictionary];
     
    //return back to patient
    JSONToDict *jsonDict = [[JSONToDict alloc] init];
    [jsonDict convertJsonToDictionary:@"http://demo.oridashi.com.au:8190/patient/@36?format=json" resourcetype:@"Patient"];
    NSLog(@"%@", jsonDict);
    
    //take new dictionary and make a new file
    //DictToJSON *json2 = [[DictToJSON alloc] init];
    //FHIRResourceDictionary *tempDictionary2 = [[FHIRResourceDictionary alloc] init];
    
    //tempDictionary2 = [ generateAndReturnPatientResourceDictionary];
    //[json generateJsonString:tempDictionary];
    
}

- (void)testXML
{
    NSLog(@"Beginning FHIRXML tests...");
    
    //code in here
    XMLToDict *xmlDict = [[XMLToDict alloc] init];
    [xmlDict convertXmlToDictionary:@"Patient"];
    NSLog(@"%@", xmlDict);
}

@end
