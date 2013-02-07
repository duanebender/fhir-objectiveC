//
//  NodeType.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-06.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//
/*
typedef enum NodeTypeValue
{
    Text,
    Comment,
    NodeElement,
    Document
}NodeTypeValue;
 */
 


@interface NodeType : NSObject

@property (nonatomic, retain) NSString *author; //author of node
@property (nonatomic, retain) NSString *name; //name of node
@property (nonatomic, retain) NSString *descriptionLong, *descriptionShort; //description of node in 2 formats
@property (nonatomic, retain) NSString *nodeType; //type of this Node

- (NSString *)getAuthor;
- (void)setAuthor:(NSString *)authorName;
//getfield and getfields methods may not be neeed as in the java variant
- (NSString *)getLongDescription;
- (void)setLongDescription:(NSString *)text;
- (NSString *)getShortDescription;
- (void)setShortDescription:(NSString *)text;
- (NSString *)getName;
- (void)setName:(NSString *)name;
- (NSString *)getAllKnownNodeTypes;
- (NSString *)getType;
- (void)setType:(NSString *)typeOfNode;

@end