//
//  FHIRTests.m
//  FHIRTests
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "FHIRTests.h"

@implementation FHIRTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    
    // Test 1 : Round-trip test
    //          Create a patient resource object from the obj-C model
    //          Run the XML formatter on it
    //          Parse the XML back to an object
    //          Do a field-by-field comparison of the original with the roundtripped one
    
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)test
{
    STFail(@"Unit tests are not implemented yet in FHIRTests");
}

@end
