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
    STAssertFalse(patient.active == NO, @"BOOL Should be YES"); //should pass
    
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
    
    
    //display contents of any object
    NSLog(@"TestObject ***************** %@",[patient.identifier objectAtIndex:0]);
    
}

@end
