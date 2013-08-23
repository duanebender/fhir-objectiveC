//
//  FHIRTests.m
//  FHIRTests
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "FHIRTests.h"
#import "FHIRPatient.h"
#import "DictToJSON.h"
#import "FHIRHumanName.h"
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
    
}

- (void)testJSON
{
    NSLog(@"Beginning FHIRJSON tests...");
    
    [self testBase64];
    
    //return back to patient
    JSONToDict *jsonDict = [[JSONToDict alloc] init];
    NSObject *patientJSON = [[NSObject alloc] init];
    patientJSON = [jsonDict convertJsonToDictionary:@"http://hl7.org/implement/standards/fhir/patient-example-a.json"];//@"http://hl7.org/implement/standards/fhir/patient-example-a.json"];
    
    
    //again to .json file
    DictToJSON *json = [[DictToJSON alloc] init];
    [json generateJson:patientJSON urlPath:@"/Users/adamsippel/Desktop/Patient.txt"];
    
    /*
    //Medication
    NSObject *medicationDict = [[NSObject alloc] init];
    medicationDict = [jsonDict convertJsonToDictionary:@"http://hl7connect.healthintersections.com.au/svc/fhir/medication/@example/history/@1?_format=json"];
    
    [json generateJson:medicationDict urlPath:@"/Users/adamsippel/Desktop/Medication.txt"];
    */
    /*
    NSObject *patientJSONDesktop = [[NSObject alloc] init];
    patientJSONDesktop = [jsonDict convertJsonToDictionary:@"/Users/adamsippel/Desktop/Patient.txt"];
    NSLog(@"PatientDesktop:%@", patientJSONDesktop);
    
    NSArray *comparator = [[NSArray alloc] initWithObjects:patientJSON, patientJSONDesktop, nil];
    
    NSDictionary *patientOnline = [[NSDictionary alloc] initWithDictionary:[[[comparator objectAtIndex:0] generateAndReturnResourceDictionary] dataForResource]];
    NSDictionary *patientDesktop = [[NSDictionary alloc] initWithDictionary:[[[comparator objectAtIndex:1] generateAndReturnResourceDictionary] dataForResource]];
    
    if ([patientOnline isEqualToDictionary:patientDesktop])
    {
        NSLog(@"THEY ARE THE SAME SEE!");
    }
    else
    {
        NSLog(@"Something is off...");
    }
     */
    
/*
    //Organization Test
    JSONToDict *jsonDictORG = [[JSONToDict alloc] init];
    NSObject *orgJSON = [[NSObject alloc] init];
    orgJSON = [jsonDictORG convertJsonToDictionary:@"http://hl7.org/implement/standards/fhir/organization-example-lab.json"];
    NSLog(@"ORG:%@", orgJSON);
    
    //again to .json file
    DictToJSON *jsonORG = [[DictToJSON alloc] init];
    [jsonORG generateJson:orgJSON urlPath:@"/Users/adamsippel/Desktop/Organization.txt"];
 */   
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
    NSObject *patientXML = [[NSObject alloc] init];
    patientXML = [xmlDict convertXmlToDictionary:@"http://cr.marc-hi.ca:8080/fhir/0.09/Patient/@27320/history/@27321"];
    
    DictToXML *xml = [[DictToXML alloc] init];
    [xml generateXml:patientXML urlPath:@"/Users/adamsippel/Desktop/Patient.xml"];

    /*
    //organization test
    XMLToDict *xmlDictORG = [[XMLToDict alloc] init];
    NSObject *orgXML = [xmlDictORG convertXmlToDictionary:@"http://hl7connect.healthintersections.com.au/svc/fhir/organization/@1/history/@1?_format=xml"];
    
    DictToXML *xmlORG = [[DictToXML alloc] init];
    [xmlORG generateXml:orgXML urlPath:@"/Users/adamsippel/Desktop/Organization.xml"];
     */
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
        
    */
  

}

- (void)testBase64
{
    NSLog(@"Beginning FHIRBASE64 tests...");
    /*
    Base64Binary *base64Test = [[Base64Binary alloc] init];
    
    NSString *stringOfDuckyImageEncoded = @"R0lGODlhEwARAPcAAAAAAAAA/+9aAO+1AP/WAP/eAP/eCP/eEP/eGP/nAP/nCP/nEP/nIf/nKf/nUv/nWv/vAP/vCP/vEP/vGP/vIf/vKf/vMf/vOf/vWv/vY//va//vjP/3c//3lP/3nP//tf//vf///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////yH5BAEAAAEALAAAAAATABEAAAi+AAMIDDCgYMGBCBMSvMCQ4QCFCQcwDBGCA4cLDyEGECDxAoAQHjxwyKhQAMeGIUOSJJjRpIAGDS5wCDly4AALFlYOgHlBwwOSNydM0AmzwYGjBi8IHWoTgQYORg8QIGDAwAKhESI8HIDgwQaRDI1WXXAhK9MBBzZ8/XDxQoUFZC9IiCBh6wEHGz6IbNuwQoSpWxEgyLCXL8O/gAnylNlW6AUEBRIL7Og3KwQIiCXb9HsZQoIEUzUjNEiaNMKAAAA7";
    
    NSData *imageData = [base64Test decodeBase64String:stringOfDuckyImageEncoded];
    [imageData writeToFile:@"/Users/adamsippel/Desktop/PatientImage.png" atomically:YES];
    
    //now test encoder to decoders through
    Base64Binary *base64Test2 = [[Base64Binary alloc] init];
    
    NSString *imageBase64EncodedString = [base64Test2 encodeDataToBase64String:[NSData dataWithContentsOfFile:@"/Users/adamsippel/Desktop/creeperwall.png"]];
    
    NSData *imageData2 = [base64Test decodeBase64String:imageBase64EncodedString];
    [imageData2 writeToFile:@"/Users/adamsippel/Desktop/TestImageDecoded.png" atomically:YES];
     */
}


@end
