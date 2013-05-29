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
    NSLog(@"PAtient:%@", patientJSON);
    
    //again to .json file
    DictToJSON *json = [[DictToJSON alloc] init];
    [json generateJson:patientJSON urlPath:@"/Users/adamsippel/Desktop/JSON/Patient.txt"];
    
    //Organization Test
    JSONToDict *jsonDictORG = [[JSONToDict alloc] init];
    NSObject *orgJSON = [[NSObject alloc] init];
    orgJSON = [jsonDictORG convertJsonToDictionary:@"http://hl7.org/implement/standards/fhir/organization-example-lab.json"];
    NSLog(@"ORG:%@", orgJSON);
    
    //again to .json file
    DictToJSON *jsonORG = [[DictToJSON alloc] init];
    [jsonORG generateJson:orgJSON urlPath:@"/Users/adamsippel/Desktop/JSON/Organization.txt"];
    
    /*
    //FIREHOSE!!!!!!
    
    NSObject *patientJSONA = [[NSObject alloc] init];
    for (int i = 0; i < 50; i ++)
    {
    
    JSONToDict *jsonDictA = [[JSONToDict alloc] init];
    NSMutableString *urlString = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"http://hl7connect.healthintersections.com.au/svc/fhir/patient/@%d", i]];
    patientJSONA = [jsonDictA convertJsonToDictionary:[urlString stringByAppendingString:@"/history/@1?_format=json"]];
    NSLog(@"%@", patientJSONA);
    
    //again to .json file
    DictToJSON *jsonA = [[DictToJSON alloc] init];
    NSString *printToString = [[NSString alloc] initWithString:[NSString stringWithFormat:@"/Users/adamsippel/Desktop/TempJSON/Patient%d.txt",i]];
    [jsonA generateJson:patientJSONA urlPath:printToString];
        
    }
    
    for (int i = 0; i < 50; i ++)
    {
        JSONToDict *jsonDictB = [[JSONToDict alloc] init];
        NSObject *patientJSONB = [[NSObject alloc] init];
        patientJSONB = [jsonDictB convertJsonToDictionary:[NSString stringWithFormat:@"/Users/adamsippel/Desktop/TempJSON/Patient%d.txt",i]];
        NSLog(@"%@",patientJSON);
        
        NSDictionary *testDict = [[NSDictionary alloc] initWithObjectsAndKeys:patientJSONA, @"PA", patientJSONB, @"PB", nil];
        
        STAssertTrue([[testDict objectForKey:@"PA"] patientDictionary] == [[testDict objectForKey:@"PB"] patientDictionary], @"Should be the same otherwise not grabbing all values properly.");
    }
     */

}

- (void)testXML
{
    NSLog(@"Beginning FHIRXML tests...");
    
    //code in here
    XMLToDict *xmlDict = [[XMLToDict alloc] init];
    NSObject *patientXML = [xmlDict convertXmlToDictionary:@"http://hl7connect.healthintersections.com.au/svc/fhir/patient/@1/history/@1?_format=xml"];
    
    DictToXML *xml = [[DictToXML alloc] init];
    [xml generateXml:patientXML urlPath:@"/Users/adamsippel/Desktop/Patient.xml"];
    
    //organization test
    XMLToDict *xmlDictORG = [[XMLToDict alloc] init];
    NSObject *orgXML = [xmlDictORG convertXmlToDictionary:@"http://hl7connect.healthintersections.com.au/svc/fhir/organization/@1/history/@1?_format=xml"];
    
    DictToXML *xmlORG = [[DictToXML alloc] init];
    [xmlORG generateXml:orgXML urlPath:@"/Users/adamsippel/Desktop/Organization.xml"];
    
    /*
    NSObject *patientXMLA = [[NSObject alloc] init];
    for (int i = 0; i < 50; i ++)
    {
        
        XMLToDict *xmlDictA = [[XMLToDict alloc] init];
        NSMutableString *urlString = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"http://hl7connect.healthintersections.com.au/svc/fhir/patient/@%d", i]];
        patientXMLA = [xmlDictA convertXmlToDictionary:[urlString stringByAppendingString:@"/history/@1?_format=xml"]];
        NSLog(@"%@", patientXMLA);
        
        //again to .xml file
        DictToXML *xmlA = [[DictToXML alloc] init];
        NSString *printToString = [[NSString alloc] initWithString:[NSString stringWithFormat:@"/Users/adamsippel/Desktop/TempXML/Patient%d.xml",i]];
        [xmlA generateXml:patientXMLA urlPath:printToString];
        
    }
  */

}


@end
