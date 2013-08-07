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
    if ([[self.sectionsTitleArray objectAtIndex:section] isEqualToString:@"PERSONAL INFO"])
    {
        return [self.personalCellsLabels count];
    }
    else if ([[self.sectionsTitleArray objectAtIndex:section] isEqualToString:@"CONTACT INFO"])
    {
        return [self.contactCellLabels count];
    }
    else if ([[self.sectionsTitleArray objectAtIndex:section] isEqualToString:@"ADDITIONAL INFO"])
    {
        return [self.addCellLabels count];
    }
    else if ([[self.sectionsTitleArray objectAtIndex:section] isEqualToString:@"ANIMAL INFO"])
    {
        return [self.animalCellLabels count];
    }
    else if ([[self.sectionsTitleArray objectAtIndex:section] isEqualToString:@"CONTACT LIST"])
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
    ContactListTableViewCell *contactListCell = [[ContactListTableViewCell alloc] init];

    if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"PERSONAL INFO"])
    {
        singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleViewCell" forIndexPath:indexPath];
        [singleCell.titleLabel setText:[self.personalCellsLabels objectAtIndex:indexPath.row]];
        [singleCell.contentLabel setText:[self.personalCellsContents objectAtIndex:indexPath.row]];
        return singleCell;
    }
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"CONTACT INFO"])
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
        else
        {
            singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleViewCell" forIndexPath:indexPath];
            [singleCell.titleLabel setText:[self.contactCellLabels objectAtIndex:indexPath.row]];
            [singleCell.contentLabel setText:[self.contactCellContents objectAtIndex:indexPath.row]];
            return singleCell;
        }
    }
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"ADDITIONAL INFO"])
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
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"CONTACT LIST"])
    {
        NSLog(@"HERE");
        contactListCell = [tableView dequeueReusableCellWithIdentifier:@"contactListViewCell" forIndexPath:indexPath];
        NSLog(@"HERE?");
        NSDictionary *currentContactItem = [[NSDictionary alloc] initWithDictionary:[self.contactListCells objectAtIndex:indexPath.row]];
        NSLog(@"%@",currentContactItem);
        [contactListCell.contactInfoLabel setText:@"Contact Info:"];
        [contactListCell.nameLabel setText:@"Name:"];
        [contactListCell.nameText setText:[currentContactItem objectForKey:@"nameText"]];
        [contactListCell.genderLabel setText:@"Gender:"];
        [contactListCell.genderText setText:[currentContactItem objectForKey:@"genderText"]];
        [contactListCell.relationshipLabel setText:@"Relationship:"];
        [contactListCell.relationshipText setText:[currentContactItem objectForKey:@"relationshipText"]];
        [contactListCell.addressLabel setText:@"Address:"];
        [contactListCell.addressStreetText setText:[currentContactItem objectForKey:@"addressStreetText"]];
        [contactListCell.addressAptText setText:[currentContactItem objectForKey:@"addressApptText"]];
        [contactListCell.addressCityText setText:[currentContactItem objectForKey:@"addressCityText"]];
        [contactListCell.addressCountryText setText:[currentContactItem objectForKey:@"addressCountryText"]];
        [contactListCell.addressPostalText setText:[currentContactItem objectForKey:@"addressPostalText"]];
        [contactListCell.phoneLabel setText:@"Phone:"];
        [contactListCell.phoneHomeText setText:[currentContactItem objectForKey:@"phoneHome"]];
        [contactListCell.phoneCellText setText:[currentContactItem objectForKey:@"phoneCell"]];
        [contactListCell.phoneWorkText setText:[currentContactItem objectForKey:@"phoneWork"]];
        [contactListCell.faxLabel setText:@"Fax:"];
        [contactListCell.faxText setText:[currentContactItem objectForKey:@"faxText"]];
        [contactListCell.emailLabel setText:@"Email:"];
        [contactListCell.emailText setText:[currentContactItem objectForKey:@"emailText"]];
        [contactListCell.organizationLabel setText:@"Organization:"];
        [contactListCell.organizationText setText:[currentContactItem objectForKey:@"organizationText"]];
        return contactListCell;
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
    if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"CONTACT INFO"])
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
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"ADDITIONAL INFO"])
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
    else if (indexPath.section == [self.sectionsTitleArray indexOfObject:@"CONTACT LIST"])
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
