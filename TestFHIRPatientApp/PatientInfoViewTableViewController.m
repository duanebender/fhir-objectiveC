//
//  PatientInfoViewTableViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-25.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "PatientInfoViewTableViewController.h"
#import "SectionHeaderView.h"
#import "SingleLineViewTableViewCell.h"

@interface PatientInfoViewTableViewController ()

@end

@implementation PatientInfoViewTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.sectionsTitleArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section)
    {
        case 0: //Patient Info section
            return [self.personalCellsLabels count];
            break;
            
        case 1: //Contact info section
            return 0;//[self.contactCellLabels count];
            break;
            
        case 2: //Additional Info section
            return 0;//[self.addCellLabels count];
            break;
            
        case 3: //Animal Info section
            return 0;//[self.animalCellLabels count];
            break;
            
        case 4: //Contact List
            return 0;
            break;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SingleLineViewTableViewCell *singleCell = [[SingleLineViewTableViewCell alloc] init];
    
    switch (indexPath.section)
    {
        case 0: //section Patient Info all single cells
            singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleViewCell" forIndexPath:indexPath];
            [singleCell.titleLabel setText:[self.personalCellsLabels objectAtIndex:indexPath.row]];
            [singleCell.contentLabel setText:[self.personalCellsContents objectAtIndex:indexPath.row]];
            return singleCell;
            break;
            
        default:
            return nil;
            break;
    }
}

#pragma mark - table header code below

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
            
        case 1: //Contact info section
            switch (indexPath.row)
        {
            case 0: //address row
                return 200;
                break;
                
            case 1: //phone row
                return 125;
                break;
                
            default:
                return 44;
                break;
        }
            break;
            
        case 2: //Additional info section
            switch (indexPath.row)
        {
            case 3: //linked patients row
                return 170;
                break;
                
            default:
                return 44;
                break;
        }
            break;
            
        case 4: //Contact List Section
            return 575;
            break;
            
        default: //Patient info and Animal Section
            return 44;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    NSString *title;
    
    title = [self.sectionsTitleArray objectAtIndex:section];
    
    return [[SectionHeaderView alloc] initWithTitle:title];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
