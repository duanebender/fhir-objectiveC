//
//  FHIRTests.m
//  FHIRTests
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "FHIRTests.h"
#import "Patient.h"
#import "TestingJSON.h"


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
    STAssertEqualObjects(human1.period.start, [NSDate date], @"Dates should match."); //date are same, maybe this STAssertEqualObjects doesn't work for dates
    
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
    Patient *patientJson = [[Patient alloc] init];
    
    ResourceReference *resource1 = [[ResourceReference alloc] init];
    resource1.display.value = @"Hat";
    resource1.uriId.uri = [NSURL URLWithString:@"http://www.google.ca"];
    resource1.version.uri = [NSURL URLWithString:@"version1"];
    resource1.type.value = @"Code1";
    NSLog(@"Made it here A");
    FHIRResourceDictionary *temp = [resource1 generateAndReturnResourceReferenceDictionary];
    NSLog(@"Made it here B");
    [patientJson.link addObject:temp.dataForResource];
    
    ResourceReference *resource2 = [[ResourceReference alloc] init];
    resource2.display.value = @"Tie";
    resource2.uriId.uri = [NSURL URLWithString:@"http://www.yahoo.ca"];
    resource2.version.uri = [NSURL URLWithString:@"version2"];
    resource2.type.value = @"Code2";
    FHIRResourceDictionary *temp2 = [resource2 generateAndReturnResourceReferenceDictionary];
    [patientJson.link addObject:temp2.dataForResource];
    
    patientJson.active.value = YES;
    
    
    TestingJSON *json = [[TestingJSON alloc] init];
    NSDictionary *tempDictionary = [[NSDictionary alloc] init];

    tempDictionary = [patientJson generateAndReturnPatientResourceDictionary];
    [json generateJsonString:tempDictionary];
    
    NSLog(@"TestJson ***************** %@", json.jsonString);
}

- (void)testXML
{
    NSLog(@"Beginning FHIRXML tests...");
    
    //code in here
}

@end
