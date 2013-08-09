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
#import "AddressViewTableViewCell.h"
#import "LinksViewTableViewCell.h"
#import "ContactListTableViewCell.h"
#import "PhoneViewTableViewCell.h"

@interface PatientInfoViewTableViewController ()

- (int)checkWhichSectionIsCurrentlyBeingBuiltForRowsNeeded:(NSInteger)section;

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

#pragma mark - dynamic table sections code

- (int)checkWhichSectionIsCurrentlyBeingBuiltForRowsNeeded:(NSInteger)section
{
    if ([[self.sectionsTitleArray objectAtIndex:section] isEqualToString:@"Personal Info"])
    {
        return [self.personalCellsLabels count];
    }
    else if ([[self.sectionsTitleArray objectAtIndex:section] isEqualToString:@"Contact Info"])
    {
        return [self.contactCellLabels count];
    }
    else if ([[self.sectionsTitleArray objectAtIndex:section] isEqualToString:@"Additional Info"])
    {
        return [self.addCellLabels count];
    }
    else if ([[self.sectionsTitleArray objectAtIndex:section] isEqualToString:@"Animal Info"])
    {
        return [self.animalCellLabels count];
    }
    else if ([[self.sectionsTitleArray objectAtIndex:section] isEqualToString:@"Contact List"])
    {
        return [self.contactListCells count];
    }
    else
    {
        return 0;
    }
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
    return [self checkWhichSectionIsCurrentlyBeingBuiltForRowsNeeded:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SingleLineViewTableViewCell *singleCell = [[SingleLineViewTableViewCell alloc] init];
    AddressViewTableViewCell *addressCell = [[AddressViewTableViewCell alloc] init];
    LinksViewTableViewCell *linkCell = [[LinksViewTableViewCell alloc] init];
    ContactListTableViewCell *contactListViewCell = [[ContactListTableViewCell alloc] init];
    PhoneViewTableViewCell *phoneViewCell = [[PhoneViewTableViewCell alloc] init];

    if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"Personal Info"])
    {
        singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleViewCell" forIndexPath:indexPath];
        [singleCell.titleLabel setText:[self.personalCellsLabels objectAtIndex:indexPath.row]];
        [singleCell.contentLabel setText:[self.personalCellsContents objectAtIndex:indexPath.row]];
        return singleCell;
    }
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"Contact Info"])
    {
        if (indexPath.row == [self.addCellLabels indexOfObject:@"Address:"])
        {
            addressCell = [tableView dequeueReusableCellWithIdentifier:@"addressViewCell" forIndexPath:indexPath];
            addressCell.streetLabel = [self.addressContentsDict objectForKey:@"Street"];
            addressCell.apptLabel = [self.addressContentsDict objectForKey:@"Appt"];
            addressCell.cityProvStateLabel = [self.addressContentsDict objectForKey:@"CityState"];
            addressCell.countryLabel = [self.addressContentsDict objectForKey:@"Country"];
            addressCell.zipPostalCodeLabel = [self.addressContentsDict objectForKey:@"ZipPostal"];
            return addressCell;
        }
        else if (indexPath.row == [self.contactCellLabels indexOfObject:@"Phone"])
        {
            phoneViewCell = [tableView dequeueReusableCellWithIdentifier:@"phoneViewCell" forIndexPath:indexPath];
            phoneViewCell.phoneHomeText.text = [self.phoneContentsDict objectForKey:@"phoneHomeText"];
            phoneViewCell.phoneCellText.text = [self.phoneContentsDict objectForKey:@"phoneCellText"];
            phoneViewCell.phoneWorkText.text = [self.phoneContentsDict objectForKey:@"phoneWorkText"];
            return phoneViewCell;
        }
        else
        {
            singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleViewCell" forIndexPath:indexPath];
            [singleCell.titleLabel setText:[self.contactCellLabels objectAtIndex:indexPath.row]];
            [singleCell.contentLabel setText:[self.contactCellContents objectAtIndex:indexPath.row]];
            return singleCell;
        }
    }
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"Additional Info"])
    {
        if (indexPath.row == [self.addCellLabels indexOfObject:@"Linked Patients:"])
        {
            linkCell = [tableView dequeueReusableCellWithIdentifier:@"linkViewCell" forIndexPath:indexPath];
            linkCell.linkedPatientsTextField.text = [self.addCellContents objectAtIndex:indexPath.row];
            return linkCell;
        }
        else
        {
            singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleViewCell" forIndexPath:indexPath];
            [singleCell.titleLabel setText:[self.addCellLabels objectAtIndex:indexPath.row]];
            [singleCell.contentLabel setText:[self.addCellContents objectAtIndex:indexPath.row]];
            return singleCell;
        }
    }
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"Contact List"])
    {
        NSLog(@"HERE");
        //contactListViewCell = [tableView dequeueReusableCellWithIdentifier:@"contactListViewCell" forIndexPath:indexPath];
        NSLog(@"HERE?");
        NSDictionary *currentContactItem = [[NSDictionary alloc] initWithDictionary:[self.contactListCells objectAtIndex:indexPath.row]];
        NSLog(@"%@",currentContactItem);
        [contactListViewCell.nameText setText:[currentContactItem objectForKey:@"nameText"]];
        [contactListViewCell.genderText setText:[currentContactItem objectForKey:@"genderText"]];
        [contactListViewCell.relationshipText setText:[currentContactItem objectForKey:@"relationshipText"]];
        [contactListViewCell.addressStreetText setText:[currentContactItem objectForKey:@"addressStreetText"]];
        [contactListViewCell.addressAptText setText:[currentContactItem objectForKey:@"addressApptText"]];
        [contactListViewCell.addressCityText setText:[currentContactItem objectForKey:@"addressCityText"]];
        [contactListViewCell.addressCountryText setText:[currentContactItem objectForKey:@"addressCountryText"]];
        [contactListViewCell.addressPostalText setText:[currentContactItem objectForKey:@"addressPostalText"]];
        [contactListViewCell.phoneHomeText setText:[currentContactItem objectForKey:@"phoneHome"]];
        [contactListViewCell.phoneCellText setText:[currentContactItem objectForKey:@"phoneCell"]];
        [contactListViewCell.phoneWorkText setText:[currentContactItem objectForKey:@"phoneWork"]];
        [contactListViewCell.faxText setText:[currentContactItem objectForKey:@"faxText"]];
        [contactListViewCell.emailText setText:[currentContactItem objectForKey:@"emailText"]];
        [contactListViewCell.organizationText setText:[currentContactItem objectForKey:@"organizationText"]];
        return contactListViewCell;
    }
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"Animal Info"])
    {
        singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleViewCell" forIndexPath:indexPath];
        [singleCell.titleLabel setText:[self.animalCellLabels objectAtIndex:indexPath.row]];
        [singleCell.contentLabel setText:[self.animalCellContents objectAtIndex:indexPath.row]];
        return singleCell;
    }
    else
    {
        return nil;
    }
}

#pragma mark - table header code below

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40; 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"Contact Info"])
    {
        if (indexPath.row == [self.contactCellLabels indexOfObject:@"Address:"])
        {
            return 195;
        }
        else if (indexPath.row == [self.contactCellLabels indexOfObject:@"Phone:"])
        {
            return 125;
        }
        else
        {
            return 44;
        }
    }
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"Additional Info"])
    {
        if (indexPath.row == [self.addCellLabels indexOfObject:@"Linked Patients:"])
        {
            return 130;
        }
        else
        {
            return 44;
        }
    }
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"Contact List"])
    {
        return 575;
    }
    else
    {
        return 44;
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
