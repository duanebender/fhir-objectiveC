//
//  AddEditPatientTableViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEditPatientTableViewController : UITableViewController

//personal section cells
@property (nonatomic, strong) NSMutableArray *personalCellsContents;
@property (nonatomic, strong) NSMutableArray *personalCellsLabels;
@property (nonatomic, strong) NSMutableArray *personalCellsReferenceText;

//contact section cells
@property (nonatomic, strong) NSMutableArray *contactCellContents;
@property (nonatomic, strong) NSMutableDictionary *addressContentsDict;
@property (nonatomic, strong) NSMutableDictionary *phoneContentsDict;
@property (nonatomic, strong) NSMutableArray *contactCellLabels;
@property (nonatomic, strong) NSMutableArray *contactCellReferenceText;

//additional info cells
@property (nonatomic, strong) NSMutableArray *addCellContents;
@property (nonatomic, strong) NSMutableArray *addCellLabels;
@property (nonatomic, strong) NSMutableArray *addCellReferenceText;

//animal info cells
@property (nonatomic, strong) NSMutableArray *animalCellContents;
@property (nonatomic, strong) NSMutableArray *animalCellLabels;
@property (nonatomic, strong) NSMutableArray *animalCellReferenceText;

//contact list
@property (nonatomic, strong) NSMutableArray *contactListCells;

@end
