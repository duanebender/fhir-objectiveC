//
//  AddEditPatientTableViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "AddEditPatientTableViewController.h"
#import "SingleLineInputTableViewCell.h"
#import "AddressInputTableViewCell.h"
#import "PhoneTableViewCell.h"
#import "LargeTextFieldTableViewCell.h"
#import "ContactListItemTableViewCell.h"
#import "SectionHeaderView.h"

@interface AddEditPatientTableViewController ()

@end

@implementation AddEditPatientTableViewController

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 5;
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
            return [self.contactCellLabels count];
            break;
            
        case 2: //Additional Info section
            return [self.addCellLabels count];
            break;
            
        case 3: //Animal Info section
            return [self.animalCellLabels count];
            break;
            
        case 4: //Contact List
            return 1;
            break;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SingleLineInputTableViewCell *singleCell = [[SingleLineInputTableViewCell alloc] init];
    AddressInputTableViewCell *addressCell = [[AddressInputTableViewCell alloc] init];
    PhoneTableViewCell *phoneCell = [[PhoneTableViewCell alloc] init];
    LargeTextFieldTableViewCell *largeTextCell = [[LargeTextFieldTableViewCell alloc] init];
    ContactListItemTableViewCell *contactListCell = [[ContactListItemTableViewCell alloc] init];
    
    switch (indexPath.section)
    {
        case 0: //section Patient Info all single cells
            singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleTextCell" forIndexPath:indexPath];
            [singleCell.titleLabel setText:[self.personalCellsLabels objectAtIndex:indexPath.row]];
            singleCell.inputTextField.placeholder = [self.personalCellsReferenceText objectAtIndex:indexPath.row];
            [singleCell.inputTextField setText:[self.personalCellsContents objectAtIndex:indexPath.row]];
            return singleCell;
            break;
            
        case 1: //section contact info
            switch (indexPath.row)
            {
                case 0: //address cell
                    addressCell = [tableView dequeueReusableCellWithIdentifier:@"addressTextCell" forIndexPath:indexPath];
                    [addressCell.addressLabel setText:@"Address:"];
                    addressCell.streetNumberTextField.placeholder = @"33 Named Street";
                    addressCell.apptNumberTextField.placeholder = @"appt #";
                    addressCell.cityStateTextField.placeholder = @"city, state/province";
                    addressCell.countryTextField.placeholder = @"Canada";
                    addressCell.postalZipCodeTextField.placeholder = @"zip/postal code";
                    addressCell.streetNumberTextField.text = [self.addressContentsDict objectForKey:@"Street"];
                    addressCell.apptNumberTextField.text = [self.addressContentsDict objectForKey:@"Appt"];
                    addressCell.cityStateTextField.text = [self.addressContentsDict objectForKey:@"CityState"];
                    addressCell.countryTextField.text = [self.addressContentsDict objectForKey:@"Country"];
                    addressCell.postalZipCodeTextField.text = [self.addressContentsDict objectForKey:@"ZipPostal"];
                    return addressCell;
                    break;
                
                case 1: //phone cell
                    phoneCell = [tableView dequeueReusableCellWithIdentifier:@"phoneCell" forIndexPath:indexPath];
                    [phoneCell.titleLabel setText:@"Phone:"];
                    phoneCell.homePhoneTextField.placeholder = @"Home: (555) 555-5555";
                    phoneCell.cellPhoneTextField.placeholder = @"Cell: (555) 555-5555";
                    phoneCell.workPhoneTextField.placeholder = @"Work: (555) 555-5555";
                    phoneCell.homePhoneTextField.text = [self.phoneContentsDict objectForKey:@"phoneHomeText"];
                    phoneCell.cellPhoneTextField.text = [self.phoneContentsDict objectForKey:@"cellPhoneText"];
                    phoneCell.workPhoneTextField.text = [self.phoneContentsDict objectForKey:@"phoneWorkText"];
                    return phoneCell;
                    break;
                    
                default:
                    singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleTextCell" forIndexPath:indexPath];
                    [singleCell.titleLabel setText:[self.contactCellLabels objectAtIndex:indexPath.row]];
                    singleCell.inputTextField.placeholder = [self.contactCellReferenceText objectAtIndex:indexPath.row];
                    [singleCell.inputTextField setText:[self.contactCellContents objectAtIndex:indexPath.row]];
                    return singleCell;
                    break;
            }
            break;
            
        case 2: //section additional info
            switch (indexPath.row)
            {
            case 3: //linked patients cell
                largeTextCell = [tableView dequeueReusableCellWithIdentifier:@"largeTextCell" forIndexPath:indexPath];
                    [largeTextCell.largeTextLabel setText:@"Linked Patients:"];
                    return largeTextCell;
                break;
                
            default:
                singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleTextCell" forIndexPath:indexPath];
                [singleCell.titleLabel setText:[self.addCellLabels objectAtIndex:indexPath.row]];
                singleCell.inputTextField.placeholder = [self.addCellReferenceText objectAtIndex:indexPath.row];
                [singleCell.inputTextField setText:[self.addCellContents objectAtIndex:indexPath.row]];
                return singleCell;
                break;
            }
            break;
            
        case 3: //section animal Info all single cells
            singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleTextCell" forIndexPath:indexPath];
            [singleCell.titleLabel setText:[self.animalCellLabels objectAtIndex:indexPath.row]];
            singleCell.inputTextField.placeholder = [self.animalCellReferenceText objectAtIndex:indexPath.row];
            [singleCell.inputTextField setText:[self.animalCellContents objectAtIndex:indexPath.row]];
            return singleCell;
            break;
            
        case 4: //section contact list
            contactListCell = [tableView dequeueReusableCellWithIdentifier:@"contactListCell" forIndexPath:indexPath];
            [singleCell.titleLabel setText:[self.animalCellLabels objectAtIndex:indexPath.row]];
            singleCell.inputTextField.placeholder = [self.animalCellReferenceText objectAtIndex:indexPath.row];
            [singleCell.inputTextField setText:[self.animalCellContents objectAtIndex:indexPath.row]];
            return contactListCell;
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
    
    switch (section)
    {
        case 0:
            title = @"Personal Info";
            break;
            
        case 1:
            title = @"Contact Info";
            break;
            
        case 2:
            title = @"Additional Info";
            break;
            
        case 3:
            title = @"Animal Info";
            break;
            
        case 4:
            title = @"Contact List";
            break;
            
        default:
            title = @"";
            break;
    }
    
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
