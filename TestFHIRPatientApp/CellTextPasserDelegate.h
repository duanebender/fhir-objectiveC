//
//  CellTextPasserDelegate.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-08-14.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CellTextPasserDelegate <NSObject>

- (void)textFromTheCell:(NSDictionary *)dictionaryOfStringsTextFromCell;

@end
