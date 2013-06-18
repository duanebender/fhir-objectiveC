//
//  XhtmlNode.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#warning - This class is unused

#import <Foundation/Foundation.h>
#import "FHIRNodeType.h"
#import "FHIRString.h"

@interface XhtmlNode : NSObject

- (NSString *)getNodeType; //NodeType value
- (void)setNodeType:(NSString *)nodeType; //set NodeType value
- (void)setValueContent:(NSString *)content;
- (XhtmlNode *)addTag:(NSString *)name;
- (XhtmlNode *)addTag:(NSInteger *)index :(NSString *)name;
- (XhtmlNode *)addComment:(NSString *)content;
- (XhtmlNode *)addDocType:(NSString *)content;
- (XhtmlNode *)addInstruction:(NSString *)content;
- (XhtmlNode *)addText:(NSString *)content;
- (XhtmlNode *)addText:(NSInteger *)index :(NSString *)content;
//- (BOOL *)allChildrenAreText;
- (XhtmlNode *)getElement:(NSString *)name;
- (NSString *)allText;
- (void)attribute:(NSString *)name :(NSString *)value;
- (NSString *)getAttribute:(NSString *)name;
- (void)setAttribute:(NSString *)name :(NSString *)value;

@property (nonatomic, retain) FHIRResourceDictionary *xhtmlNodeDictionary; //contains all the reources for the xhtmlnode

@property (nonatomic) FHIRNodeType *node; //decides node type
@property (nonatomic, retain) FHIRString *name; //name variable
@property (nonatomic, retain) NSMutableDictionary *attributes; //@property (nonatomic, retain) Map *attributes; //Map<String, String> Atributes = new HashMap<String, String>();
@property (nonatomic, retain) NSMutableArray *childNodes; //array of XhtmlNodes
@property (nonatomic, retain) FHIRString *content; //content of this XhtmlNode

- (NSDictionary *)generateAndReturnXhtmlNodeDictionary; //returns resources of xhtmlnode ready to be formatted
- (void)xhtmlNodeParser:(NSDictionary *)dictionary; //set xhtmlnode from dictionary

@end
