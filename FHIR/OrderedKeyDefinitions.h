//
//  OrderedKeyDefinitions.h
//  FHIR
//
//  Created by Adam Sippel on 2013-08-23.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Resources
 */

//Patient Resource Ordered Keys
#define PATIENT_ORDERED_KEYS [NSArray arrayWithObjects:@"text",@"identifier",@"name",@"telecom",@"gender",@"birthDate",@"deceasedX",@"address",@"maritalStatus",@"multipleBirthX",@"photo",@"communication",@"provider",@"link",@"active",@"animal",@"contact", nil]

//%%%%%%%%%%%%%%%%%%%%%%%%%%

//Identifier
#define IDENTIFIER_ORDERED_KEYS [NSArray arrayWithObjects:@"use",@"label",@"system",@"key",@"period",@"assigner", nil]

//HumanName
#define HUMANNAME_ORDERED_KEYS [NSArray arrayWithObjects:@"use",@"text",@"family",@"given",@"prefix",@"suffix",@"period", nil]

//Contact
#define CONTACT_ORDERED_KEYS [NSArray arrayWithObjects:@"system",@"value",@"use",@"period", nil]

//CodeableConcept
#define CODABLECONCEPT_ORDERED_KEYS [NSArray arrayWithObjects:@"coding",@"text",@"primary", nil]

//Address
#define ADDRESS_ORDERED_KEYS [NSArray arrayWithObjects:@"use",@"text",@"line",@"city",@"state",@"zip",@"country",@"period", nil]

//Attachment
#define ATTACHMENT_ORDERED_KEYS [NSArray arrayWithObjects:@"contentType",@"language",@"data",@"url",@"size",@"hash",@"title", nil]

//ResourceReference
#define RESOURCEREFERENCE_ORDERED_KEYS [NSArray arrayWithObjects:@"type",@"reference",@"display", nil]

//Patient Animal
#define PATIENT_ANIMAL_ORDERED_KEYS [NSArray arrayWithObjects:@"species",@"breed",@"genderStatus", nil]

//Patient Contact
#define PATIENT_CONTACT_ORDERED_KEYS [NSArray arrayWithObjects:@"relationship",@"name",@"telecom",@"address",@"gender",@"organization", nil]

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//Period
#define PERIOD_ORDERED_KEYS [NSArray arrayWithObjects:@"startDate",@"endDate", nil]

//Code
#define CODE_ORDERED_KEYS [NSArray arrayWithObjects:@"system",@"code",@"display", nil]