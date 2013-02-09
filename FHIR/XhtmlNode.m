//
//  XhtmlNode.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "XhtmlNode.h"

@interface XhtmlNode()

#warning - not fully implemented, check line below
//public static final String NBSP = Character.toString((char)0xa0);

@property (nonatomic, retain) NodeType *nodeType; //decides node type
@property (nonatomic, retain) NSString *name; //name variable
@property (nonatomic, retain) NSMutableDictionary *Attributes;
//@property (nonatomic, retain) Map *attributes; //Map<String, String> Atributes = new HashMap<String, String>();
@property (nonatomic, retain) NSMutableArray *childNodes; //array of XhtmlNodes
@property (nonatomic, retain) NSString *content; //content of this XhtmlNode

@end

@implementation XhtmlNode

- (NodeType *)getNodeType
{
    return self.nodeType;
}

- (void)setNodeType:(NodeType *)nodeType
{
    self.nodeType = nodeType;
}

- (NSString *)getName
{
    return self.name;
}

- (void)setName:(NSString *)name
{
    self.name = name;
}

- (NSMutableDictionary *)getAttributes
{
    return self.Attributes;
}

- (NSArray *)getChildNodes
{
    return self.childNodes;
}

- (NSString *)getContent
{
    return self.content;
}
/*
- (void)setContent:(NSString *)content
{
    if (!(self.nodeType != NodeType.Text || self.nodeType != NodeType.Comment))
    {
        [NSException raise:@"Wrong Node Type" format:@"Wrong Node Type"];
    }
    self.content = content;
}

- (XhtmlNode *)addTag:(NSString *)name
{
    if (!(self.nodeType == NodeType.Element || self.nodeType == NodeType.Document))
    {
        [NSException raise:@"Wrong Node Type" format:@"Node Type is %@", self.nodeType.toString];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:NodeType.Element];
    [node setName:name];
    [childNodes addObject:node];
    return node;
}

- (XhtmlNode *)addTag:(NSInteger *)index:(NSString *)name
{
    if (!(self.nodeType == NodeType.Element || self.nodeType == NodeType.Document))
    {
        [NSException raise:@"Wrong Node Type" format:@"Node Type is %@", self.nodeType.toString];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:NodeType.Element];
    [node setName:name];
    [childNodes addObject:node];
    return node;
}

- (XhtmlNode *)addComment:(NSString *)content
{
    if (!(self.nodeType == NodeType.Element || self.nodeType == NodeType.Document))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type"];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:NodeType.Comment];
    [node setContent:content];
    [childNodes addObject:node];
    return node;
}

- (XhtmlNode *)addDocType:(NSString *)content
{
    if (!(self.nodeType == NodeType.Element || self.nodeType == NodeType.Document))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type"];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:NodeType.DocType];
    [node setContent:content];
    [childNodes addObject:node];
    return node;
}


- (XhtmlNode *)addInstruction:(NSString *)content
{
    if (!(self.nodeType == NodeType.Element || self.nodeType == NodeType.Document))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type"];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:NodeType.Instruction];
    [node setContent:content];
    [childNodes addObject:node];
    return node;
}

- (XhtmlNode *)addText:(NSString *)content
{
    if (!(self.nodeType == NodeType.Element || self.nodeType == NodeType.Document))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type"];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:NodeType.Text];
    [node setContent:content];
    [childNodes addObject:node];
    return node;
}

- (XhtmlNode *)addText:(NSInteger *)index :(NSString *)content
{
    if (!(self.nodeType == NodeType.Element || self.nodeType == NodeType.Document))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type"];
    }
    if (content == NULL)
    {
        [NSException raise:@"Content" format:@"Content cannot be null."];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:NodeType.Text];
    [node setContent:content];
#warning - not sure if next line is proper
    [childNodes addObject:node atIndex:index];
    return node;
}

- (BOOL *)allChildrenAreText
{
    BOOL res = TRUE;
    for (XhtmlNode* n in childNodes)
    {
        res = res && n.getNodeType == NodeType.Text;
    }
    return res;
}

- (XhtmlNode *)getElement:(NSString *)name
{
    for (XhtmlNode* n in childNodes)
    {
        if (n.getNodeType == NodeType.Element && [self.name caseInsensitiveCompare:(n.getName))
        {
            return n;
        }
    }
    return NULL;
}
                                                  
- (NSString *)allText
{
#warning - Add stringbuilder instead of NSString below
    NSString *tempString = [[NSString alloc]init];
    for (XhtmlNode* n in childNodes)
    {
        if (n.getNodeType == NodeType.Text)
        {
            tempString += n.getContent;
        }
        else if (n.getNodeType == NodeType.Element)
        {
            tempstring += n.allText;
        }
        return tempString.toString;
    }
}
                                                  
- (void)attribute:(NSString *)name :(NSString *)value
{
    if (!(self.nodeType == NodeType.Element || self.nodeType == NodeType.Document))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type."];
    }
    if (name == NULL)
    {
        [NSException raise:@"Name" format:@"Name is Null"];
    }
    if (value == NULL)
    {
        [NSException raise:@"Value" format:@"Value is Null"];
    }
#warning - not sure what the below function is for...
    [Attributes setObject:value forKey:name];
}
                                                  
- (NSString *)getAttribute:(NSString *)name
{
#warning - not sure if below function is proper...
    return [Attributes objectForKey:name];
}
                                                  
- (void)setAttribute:(NSString *)name :(NSString *)value
{
#warning - not sure if below function is proper...
    [Attributes setObject:value forKey:name];
}

*/
@end

