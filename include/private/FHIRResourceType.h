//
//  ResourceType.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A definition of every currently available resource type for checking validity
 */

typedef enum ResourceType
{
    ResourceTypeProvenance = 1,
    ResourceTypeDevice,
    ResourceTypeOrder,
    ResourceTypeOrganization,
    ResourceTypePrescription,
    ResourceTypeGroup,
    ResourceTypeValueSet,
    ResourceTypeCoverage,
    ResourceTypeTest,
    ResourceTypeMedicationAdministration,
    ResourceTypeSecurityEvent,
    ResourceTypeIssueReport,
    ResourceTypeList,
    ResourceTypeLabReport,
    ResourceTypeConformance,
    ResourceTypeXdsEntry,
    ResourceTypeDocument,
    ResourceTypeMessage,
    ResourceTypeProfile,
    ResourceTypeObservation,
    ResourceTypeImmunization,
    ResourceTypeProblem,
    ResourceTypeOrderResponse,
    ResourceTypePatient,
    ResourceTypeXdsEntry2,
    ResourceTypeProvider,
    ResourceTypeXdsFolder,
    ResourceTypeMedication,
    ResourceTypeSpecimen,
    ResourceTypeFood,
    ResourceTypeLocation,
    ResourceTypeProcedure,
    ResourceTypeAdmission,
    ResourceTypeSubstance,
    ResourceTypeAnatomicalLocation,
    ResourceTypeInterestOfCare,
    ResourceTypeAdverseReaction, //ResourceTypes from here down are newly added
    ResourceTypeAlert,
    ResourceTypeAllergyIntollerance,
    ResourceTypeCarePlan
}ResourceType;

