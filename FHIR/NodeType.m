//
//  NodeType.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-06.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "NodeType.h"

#define nodeTypes [NSArray arrayWithObjects: @"Test", @"Comment", @"Element", @"Document", nil] //array of all node types, edit if new node Types arrise

@implementation NodeType

@synthesize author = _author;
@synthesize name = _name;
@synthesize descriptionLong = _descriptionLong;
@synthesize descriptionShort = _descriptionShort;
@synthesize nodeType = _nodeType;

//getfield and getfields methods may not be neeed as in the java variant

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
