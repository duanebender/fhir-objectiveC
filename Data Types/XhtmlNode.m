//
//  XhtmlNode.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "XhtmlNode.h"

#define NBSP = [NSString withFormat:"%c", 0xa0]

@implementation XhtmlNode

@synthesize xhtmlNodeDictionary = _xhtmlNodeDictionary;

@synthesize childNodes = _childNodes; //array of XhtmlNodes
@synthesize node = _node; //decides node type
@synthesize name = _name; //name variable
@synthesize attributes = _attributes; //@property (nonatomic, retain) Map *attributes; //Map<String, String> Atributes = new HashMap<String, String>();
@synthesize content = _content; //content of this XhtmlNode

- (id)init
{
    self = [super init];
    if (self) {
        _xhtmlNodeDictionary = [[FHIRResourceDictionary alloc] init];
        _node = [[NodeType alloc] init];
        _name = [[FHIRString alloc] init];
        _attributes = [[NSMutableDictionary alloc] init];
        _childNodes = [[NSMutableArray alloc] init];
        _content = [[FHIRString alloc] init];
    }
    return self;
}

- (NSString *)getNodeType
{
    return self.node.nodeType;
}

- (void)setNodeType:(NSString *)nodeType
{
    self.node.nodeType = nodeType;
}

- (void)setValueContent:(NSString *)content
{
    if (!(![self.node.nodeType isEqual: @"Test"] || ![self.node.nodeType isEqual: @"Comment"]))
    {
        [NSException raise:@"Wrong Node Type" format:@"Wrong Node Type"];
    }
    self.content.value = content;
}

- (XhtmlNode *)addTag:(NSString *)name
{
    if (!([self.node.nodeType isEqual: @"Element"] || [self.node.nodeType isEqual: @"Document"]))
    {
        [NSException raise:@"Wrong Node Type" format:@"Node Type is %@", self.node.nodeType];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:@"Element"];
    node.name.value = name;
    [_childNodes addObject:node];
    return node;
}

- (XhtmlNode *)addTag:(NSInteger *)index :(NSString *)name
{
    if (!([self.node.nodeType isEqual: @"Element"] || [self.node.nodeType isEqual: @"Document"]))
    {
        [NSException raise:@"Wrong Node Type" format:@"Node Type is %@", self.node.nodeType];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:@"Element"];
    node.name.value = name;
    [_childNodes addObject:node];
    return node;
}

- (XhtmlNode *)addComment:(NSString *)content
{
    if (!([self.node.nodeType isEqual: @"Element"] || [self.node.nodeType isEqual: @"Document"]))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type"];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:@"Comment"];
    node.content.value = content;
    [_childNodes addObject:node];
    return node;
}

- (XhtmlNode *)addDocType:(NSString *)content
{
    if (!([self.node.nodeType isEqual: @"Element"] || [self.node.nodeType isEqual: @"Document"]))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type"];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:@"DocType"]; //document instead of DocType?
    node.content.value = content;
    [_childNodes addObject:node];
    return node;
}


- (XhtmlNode *)addInstruction:(NSString *)content
{
    if (!([self.node.nodeType isEqual: @"Element"] || [self.node.nodeType isEqual: @"Document"]))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type"];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:@"Instruction"]; //Instruction is a type?
    node.content.value = content;
    [_childNodes addObject:node];
    return node;
}

- (XhtmlNode *)addText:(NSString *)content
{
    if (!([self.node.nodeType isEqual: @"Element"] || [self.node.nodeType isEqual: @"Document"]))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type"];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:@"Text"];
    node.content.value = content;
    [_childNodes addObject:node];
    return node;
}

- (XhtmlNode *)addText:(NSInteger *)index :(NSString *)content
{
    if (!([self.node.nodeType isEqual: @"Element"] || [self.node.nodeType isEqual: @"Document"]))
    {
        [NSException raise:@"Node" format:@"Wrong Node Type"];
    }
    if (content == NULL)
    {
        [NSException raise:@"Content" format:@"Content cannot be null."];
    }
    XhtmlNode *node = [[XhtmlNode alloc] init];
    [node setNodeType:@"Text"];
    node.content.value = content;
    [_childNodes addObject:node]; //atIndex:index];
    return node;
}

#warning - below function purpose unknown
/*
- (BOOL *)allChildrenAreText
{
    BOOL res = TRUE;
    for (XhtmlNode* n in _childNodes)
    {
        res = res && n.getNodeType == NodeType.Text;
    }
    return res;
}
 */

- (XhtmlNode *)getElement:(NSString *)name
{
    for (XhtmlNode* n in _childNodes)
    {
        if ([n.getNodeType isEqual: @"Element"] && [self.name.value caseInsensitiveCompare:(n.name.value)])
        {
            return n;
        }
    }
    return NULL;
}
                                                  
- (NSString *)allText
{
    NSMutableString *tempString = [[NSMutableString alloc]init];
    for (XhtmlNode* n in _childNodes)
    {
        if ([n.getNodeType isEqual: @"Text"])
        {
            [tempString appendString:n.name.value];
        }
        else if ([n.getNodeType isEqual: @"Element"])
        {
            [tempString appendString:n.allText];
        }
        
    }
    return tempString;
}
                                                  
- (void)attribute:(NSString *)name :(NSString *)value
{
    if (!([self.node.nodeType isEqual: @"Element"] || [self.node.nodeType isEqual: @"Document"]))
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
    [self.attributes setObject:value forKey:name];
}
                                                  
- (NSString *)getAttribute:(NSString *)name
{
    return [self.attributes objectForKey:name];
}
                                                  
- (void)setAttribute:(NSString *)name :(NSString *)value
{
    [self.attributes setObject:value forKey:name];
}

- (NSDictionary *)generateAndReturnXhtmlNodeDictionary
{
    _xhtmlNodeDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [_node generateAndReturnDictionary], @"node",
                                            [_name generateAndReturnDictionary], @"name",
                                            _attributes, @"attributes",
                                            _childNodes, @"childnode",
                                            [_content generateAndReturnDictionary], @"content",
                                            nil];
    _xhtmlNodeDictionary.resourceName = @"XhtmlNode";
    return _xhtmlNodeDictionary.dataForResource;
}

- (void)xhtmlNodeParser:(NSDictionary *)dictionary
{
    [_node nodeTypeParser:[dictionary objectForKey:@"node"]];
    [_name setValueString:[dictionary objectForKey:@"name"]];
    _attributes = [[NSMutableDictionary alloc] initWithDictionary:[dictionary objectForKey:@"attributes"]];
    //NSLog(@"%@", _attributes);
    
    //_childNodes
    NSArray *nodeArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"childnode"]];
    _childNodes = [[NSMutableArray alloc] init];
    for (int i = 0; i < [nodeArray count]; i++)
    {
        XhtmlNode *tempN1 = [[XhtmlNode alloc] init];
        [tempN1 xhtmlNodeParser:[nodeArray objectAtIndex:i]];
        [_childNodes addObject:tempN1];
        //NSLog(@"%@", _childNodes);
    }
    
    [_content setValueString:[dictionary objectForKey:@"content"]];
}

@end

