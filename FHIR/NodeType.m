//
//  NodeType.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-06.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "NodeType.h"

#define nodeTypes [NSArray arrayWithObjects: @"Test", @"Comment", @"NodeElement", @"Document", nil] //array of all node types, edit if new node Types arrise

@implementation NodeType

@synthesize author = _author;
@synthesize name = _name;
@synthesize descriptionLong = _descriptionLong;
@synthesize descriptionShort = _descriptionShort;
@synthesize nodeType = _nodeType;

- (NSString *)getAuthor
{
    return self.author;
}

- (void)setAuthor:(NSString *)authorName
{
    self.author = authorName;
}

//getfield and getfields methods may not be neeed as in the java variant

- (NSString *)getLongDescription
{
    return self.descriptionLong;
}

- (void)setLongDescription:(NSString *)text;
{
    self.descriptionLong = text;
}

- (NSString *)getShortDescription
{
    return self.descriptionShort;
}

- (void)setShortDescription:(NSString *)text
{
    self.descriptionShort = text;
}

- (NSString *)getName
{
    return self.name;
}

- (void)setName:(NSString *)name
{
    self.name = name;
}

- (NSString *)getAllKnownNodeTypes
{
    NSMutableString *tempListOfNodes;
    
    for (NSString *current in nodeTypes)
    {
        [tempListOfNodes appendString: current];
        [tempListOfNodes appendString: @", "];
    }
    
    return tempListOfNodes;
}

- (NSString *)getType
{
    return self.nodeType;
}

- (void)setType:(NSString *)typeOfNode
{
    BOOL isLegitamateNodeType = NO;
    
    for (NSString *legitamateTypes in nodeTypes)
    {
        if ([typeOfNode caseInsensitiveCompare:legitamateTypes] == YES)
        {
            isLegitamateNodeType = YES;
            self.nodeType = typeOfNode;
            break;
        }
        else
        {
            continue;
        }
    }
    if (isLegitamateNodeType == NO)
    {
        [NSException raise:@"Illagitamate Type" format:@"Node Type %@ is not a Valid Node Type.", self.nodeType];
    }
}

@end
