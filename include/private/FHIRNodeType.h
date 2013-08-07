//
//  NodeType.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-06.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#warning - This class is currently unused

@interface FHIRNodeType : NSObject

@property (nonatomic, retain) NSString *author; //author of node
@property (nonatomic, retain) NSString *name; //name of node
@property (nonatomic, retain) NSString *descriptionLong, *descriptionShort; //description of node in 2 formats
@property (nonatomic, retain) NSString *nodeType; //type of this Node

//getfield and getfields methods may not be neeed as in the java variant
- (NSString *)getAllKnownNodeTypes;
- (void)setType:(NSString *)typeOfNode;

- (NSDictionary *)generateAndReturnDictionary; //returns a dictionary ready for formatting
- (void)nodeTypeParser:(NSDictionary *)dictionary; //set nodetype from dictionary

@end