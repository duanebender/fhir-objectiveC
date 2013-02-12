//
//  FHIRTests.m
//  FHIRTests
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "FHIRTests.h"
#import "Patient.h"
#import "Coding.h"


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
    patient.active = YES;
    NSLog(@"Active Status of Patient: %@", ([patient active])? @"YES" : @"NO");
    STAssertTrue(patient.active == YES, @"BOOL Should be YES"); //should pass
    STAssertTrue(patient.active == NO, @"BOOL Should be YES, this test should fail."); //should fail
    
    //test resoourcetype
    STAssertTrue(patient.getResourceType == ResourceTypePatient, @"Should be true."); //should pass
    STAssertTrue(patient.getResourceType == ResourceTypeAdmission, @"Should fail, patient should be of patient type."); //should fail
    
    //test maritalstatus
    patient.details.maritalStatus.text.value = @"Single";
    STAssertTrue(patient.details.maritalStatus.text.value == @"Married", @"Should be single."); //should fail
    
    //test animal
    Coding *patientCode = [[Coding alloc] init];
    patientCode.code.codeText = @"This is code apparently";
    [patient.animal.breed.coding addObject:patientCode];
    Coding *testableValue = [patient.animal.breed.coding objectAtIndex:1];
    STAssertTrue([testableValue.code.codeText caseInsensitiveCompare:@"This is code apparently"], @"This should pass."); //should pass
    
    //identifier testing
    HumanId *human1 = [[HumanId alloc] init];
    human1.period.start = [NSDate date];
    [patient.identifier addObject:human1];
    STAssertTrue(human1.period.start == [NSDate date], @"Dates should match."); //should pass

    
}

@end
