//
//  XhtmlNode.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeType.h"

@interface XhtmlNode : NSObject

- (NSString *)getNodeType; //NodeType value
- (void)setNodeType:(NSString *)nodeType; //set NodeType value
- (NSString *)getName;
- (void)setName:(NSString *)name;
- (NSMutableDictionary *)getAttributes; //<String, String>?
- (NSMutableArray *)getChildNodes;
- (NSString *)getContent;
- (void)setContent:(NSString *)content;
- (XhtmlNode *)addTag:(NSString *)name;
- (XhtmlNode *)addTag:(NSInteger *)index:(NSString *)name;
- (XhtmlNode *)addComment:(NSString *)content;
- (XhtmlNode *)addDocType:(NSString *)content;
- (XhtmlNode *)addInstruction:(NSString *)content;
- (XhtmlNode *)addText:(NSString *)content;
- (XhtmlNode *)addText:(NSInteger *)index:(NSString *)content;
- (BOOL *)allChildrenAreText;
- (XhtmlNode *)getElement:(NSString *)name;
- (NSString *)allText;
- (void)attribute:(NSString *)name:(NSString *)value;
- (NSString *)getAttribute:(NSString *)name;
- (void)setAttribute:(NSString *)name:(NSString *)value;

@property (nonatomic) NodeType *node; //decides node type
@property (nonatomic, retain) NSString *name; //name variable
@property (nonatomic, retain) NSMutableDictionary *Attributes;
//@property (nonatomic, retain) Map *attributes; //Map<String, String> Atributes = new HashMap<String, String>();
@property (nonatomic, retain) NSMutableArray *childNodes; //array of XhtmlNodes
@property (nonatomic, retain) NSString *content; //content of this XhtmlNode

@end
