//
//  Demographics.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Demographics.h"

@implementation Demographics

@synthesize name = _name; //A name associated with the individual.
@synthesize telecom = _telecom; //A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.
@synthesize gender = _gender; //Administrative Gender - the gender that the patient is considered to have for administration / record keeping purposes
@synthesize birthDate = _birthDate; //The birth date for the individual, to the degre of precision now
@synthesize deceased = _deceased; //Indicates if the individual is deceased or not
@synthesize address = _address; //One or more addresses for the individual
@synthesize maritalStatus = _maritalStatus; //This field contains a patient's marital (civil) status.
@synthesize language = _language; //A language spoken by the person, with proficiency

@end
