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
#import "DictToXML.h"


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
    //STAssertTrue(patient.getResourceType == ResourceTypePatient, @"Should be true."); //should pass
    //STAssertFalse(patient.getResourceType == ResourceTypeAdmission, @"Should be false"); //should pass
    
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
     
    //return back to patient
    JSONToDict *jsonDict = [[JSONToDict alloc] init];
    NSObject *patientJSON = [[NSObject alloc] init];
    patientJSON = [jsonDict convertJsonToDictionary:@"http://hl7.org/implement/standards/fhir/patient-example-a.json"];
    NSLog(@"%@", patientJSON);
    
    //again to .json file
    DictToJSON *json = [[DictToJSON alloc] init];
    [json generateJson:patientJSON urlPath:@"/Users/adamsippel/Desktop/Patient.txt"];
    
    //take new dictionary and make a new file
    /*
    JSONToDict *jsonDict2 = [[JSONToDict alloc] init];
    [jsonDict2 convertJsonToDictionary:@"http://hl7.org/implement/standards/fhir/patient-example-b.json"];
    
    DictToJSON *json2 = [[DictToJSON alloc] init];
    FHIRResourceDictionary *tempJsonDict2 = [[FHIRResourceDictionary alloc] init];
    tempJsonDict2 = [jsonDict2.patient generateAndReturnPatientResourceDictionary];
    [json2 generateJsonString:tempJsonDict2 urlPath:@"/Users/adamsippel/Desktop/Patient2.txt"];
     */

}

- (void)testXML
{
    NSLog(@"Beginning FHIRXML tests...");
    
    //code in here
    XMLToDict *xmlDict = [[XMLToDict alloc] init];
    NSObject *patientXML = [xmlDict convertXmlToDictionary:@"http://hl7connect.healthintersections.com.au/svc/fhir/patient/@1/history/@1?_format=xml"];//@"http://demo.oridashi.com.au:8190/patient/@36?_format=xml"];
    NSLog(@"XMLDict before change%@", patientXML);
    
    DictToXML *xml = [[DictToXML alloc] init];
    [xml generateXml:patientXML urlPath:@"/Users/adamsippel/Desktop/Patient.xml"];

}

@end
