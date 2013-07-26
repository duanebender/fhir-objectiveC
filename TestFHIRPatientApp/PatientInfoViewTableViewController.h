//
//  PatientInfoViewTableViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-25.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientInfoViewTableViewController : UITableViewController

//sections List String
@property (nonatomic, strong) NSMutableArray *sectionsTitleArray;

//personal section cells
@property (nonatomic, strong) NSMutableArray *personalCellsContents;
@property (nonatomic, strong) NSMutableArray *personalCellsLabels;

//contact section cells
@property (nonatomic, strong) NSMutableArray *contactCellContents;
@property (nonatomic, strong) NSMutableDictionary *addressContentsDict;
@property (nonatomic, strong) NSMutableDictionary *phoneContentsDict;
@property (nonatomic, strong) NSMutableArray *contactCellLabels;

//additional info cells
@property (nonatomic, strong) NSMutableArray *addCellContents;
@property (nonatomic, strong) NSMutableArray *addCellLabels;

//animal info cells
@property (nonatomic, strong) NSMutableArray *animalCellContents;
@property (nonatomic, strong) NSMutableArray *animalCellLabels;

//contact list
@property (nonatomic, strong) NSMutableArray *contactListCells;

@end
