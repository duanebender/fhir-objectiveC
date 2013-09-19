//
//  AddEditPatientTableViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "AddEditPatientTableViewController.h"
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
    self.tableReturnableDictionary = [[NSMutableDictionary alloc] init];
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
    NSDictionary *contactCellInfo = [self.contactListCells objectAtIndex:0];
    
    switch (indexPath.section)
    {
        case 0: //section Patient Info all single cells
            singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleTextCell" forIndexPath:indexPath];
            [singleCell setDelegate:self];
            [singleCell.titleLabel setText:[self.personalCellsLabels objectAtIndex:indexPath.row]];
            singleCell.inputTextField.placeholder = [self.personalCellsReferenceText objectAtIndex:indexPath.row];
            if ([self.tableReturnableDictionary objectForKey:singleCell.titleLabel.text])
            {
                [singleCell.inputTextField setText:[self.tableReturnableDictionary objectForKey:singleCell.titleLabel.text]];
            }
            else
            {
                [singleCell.inputTextField setText:[self.personalCellsContents objectAtIndex:indexPath.row]];
            }
            return singleCell;
            break;
            
        case 1: //section contact info
            switch (indexPath.row)
            {
                case 0: //address cell
                    addressCell = [tableView dequeueReusableCellWithIdentifier:@"addressTextCell" forIndexPath:indexPath];
                    [addressCell.addressLabel setText:@"Address:"];
                    if ([self.tableReturnableDictionary objectForKey:addressCell.addressLabel.text])
                    {
                        [addressCell.addressTextField setText:[self.tableReturnableDictionary objectForKey:addressCell.addressLabel.text]];
                    }
                    else
                    {
                        [addressCell.addressTextField setText:self.addressContentsString];
                    }
                    [addressCell setDelegate:self];
                    return addressCell;
                    break;
                
                case 1: //phone cell
                    phoneCell = [tableView dequeueReusableCellWithIdentifier:@"phoneCell" forIndexPath:indexPath];
                    [phoneCell.titleLabel setText:@"Phone:"];
                    phoneCell.homePhoneTextField.placeholder = @"Home: (555) 555-5555";
                    phoneCell.cellPhoneTextField.placeholder = @"Cell: (555) 555-5555";
                    phoneCell.workPhoneTextField.placeholder = @"Work: (555) 555-5555";
                    if ([self.tableReturnableDictionary objectForKey:@"Home Phone:"])
                    {
                        phoneCell.homePhoneTextField.text = [self.tableReturnableDictionary objectForKey:@"Home Phone:"];
                    }
                    else
                    {
                        phoneCell.homePhoneTextField.text = [self.phoneContentsDict objectForKey:@"phoneHomeText"];
                    }
                    if ([self.tableReturnableDictionary objectForKey:@"Cell Phone:"])
                    {
                        phoneCell.cellPhoneTextField.text = [self.tableReturnableDictionary objectForKey:@"Cell Phone:"];
                    }
                    else
                    {
                        phoneCell.cellPhoneTextField.text = [self.phoneContentsDict objectForKey:@"cellPhoneText"];
                    }
                    if ([self.tableReturnableDictionary objectForKey:@"Work Phone:"])
                    {
                        phoneCell.workPhoneTextField.text = [self.tableReturnableDictionary objectForKey:@"Work Phone:"];
                    }
                    else
                    {
                        phoneCell.workPhoneTextField.text = [self.phoneContentsDict objectForKey:@"phoneWorkText"];
                    }
                    
                    [phoneCell setDelegate:self];
                    return phoneCell;
                    break;
                    
                default:
                    singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleTextCell" forIndexPath:indexPath];
                    [singleCell.titleLabel setText:[self.contactCellLabels objectAtIndex:indexPath.row]];
                    singleCell.inputTextField.placeholder = [self.contactCellReferenceText objectAtIndex:indexPath.row];
                    if ([self.tableReturnableDictionary objectForKey:singleCell.titleLabel.text])
                    {
                        [singleCell.inputTextField setText:[self.tableReturnableDictionary objectForKey:singleCell.titleLabel.text]];
                    }
                    else
                    {
                        [singleCell.inputTextField setText:[self.contactCellContents objectAtIndex:indexPath.row]];
                    }
                    [singleCell setDelegate:self];
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
                if ([self.tableReturnableDictionary objectForKey:largeTextCell.largeTextLabel.text])
                {
                    [largeTextCell.largeTextView setText:[self.tableReturnableDictionary objectForKey:largeTextCell.largeTextLabel.text]];
                }
                else
                {
                    [largeTextCell.largeTextView setText:[self.addCellContents objectAtIndex:indexPath.row]];
                }
                [largeTextCell setDelegate:self];
                return largeTextCell;
                break;
                
            default:
                singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleTextCell" forIndexPath:indexPath];
                [singleCell.titleLabel setText:[self.addCellLabels objectAtIndex:indexPath.row]];
                singleCell.inputTextField.placeholder = [self.addCellReferenceText objectAtIndex:indexPath.row];
                if ([self.tableReturnableDictionary objectForKey:singleCell.titleLabel.text])
                {
                    [singleCell.inputTextField setText:[self.tableReturnableDictionary objectForKey:singleCell.titleLabel.text]];
                }
                else
                {
                    [singleCell.inputTextField setText:[self.addCellContents objectAtIndex:indexPath.row]];
                }
                [singleCell setDelegate:self];
                return singleCell;
                break;
            }
            break;
            
        case 3: //section animal Info all single cells
            singleCell = [tableView dequeueReusableCellWithIdentifier:@"singleTextCell" forIndexPath:indexPath];
            [singleCell.titleLabel setText:[self.animalCellLabels objectAtIndex:indexPath.row]];
            singleCell.inputTextField.placeholder = [self.animalCellReferenceText objectAtIndex:indexPath.row];
            if ([self.tableReturnableDictionary objectForKey:singleCell.titleLabel.text])
            {
                [singleCell.inputTextField setText:[self.tableReturnableDictionary objectForKey:singleCell.titleLabel.text]];
            }
            else
            {
                [singleCell.inputTextField setText:[self.animalCellContents objectAtIndex:indexPath.row]];
            }
            [singleCell setDelegate:self];
            return singleCell;
            break;
            
        case 4: //section contact list
            contactListCell = [tableView dequeueReusableCellWithIdentifier:@"contactListCell" forIndexPath:indexPath];
            [contactListCell setDelegate:self];
            [contactListCell.nameTextField setText:[contactCellInfo objectForKey:@"nameText"]];
            [contactListCell.genderTextField setText:[contactCellInfo objectForKey:@"genderText"]];
            [contactListCell.relationshipTextField setText:[contactCellInfo objectForKey:@"relationshipText"]];
            [contactListCell.addressTextView setText:[contactCellInfo objectForKey:@"address"]];
            [contactListCell.phoneHomeTextField setText:[contactCellInfo objectForKey:@"homePhoneText"]];
            [contactListCell.phoneWorkTextField setText:[contactCellInfo objectForKey:@"workPhoneText"]];
            [contactListCell.phoneCellTextField setText:[contactCellInfo objectForKey:@"cellPhoneText"]];
            [contactListCell.faxTextField setText:[contactCellInfo objectForKey:@"faxText"]];
            [contactListCell.emailTextField setText:[contactCellInfo objectForKey:@"emailText"]];
            [contactListCell.organizationTextField setText:[contactCellInfo objectForKey:@"organizationText"]];
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
    //add code if needed
}

#pragma mark - protocol function

- (void)textFromTheCell:(NSDictionary *)dictionaryOfStringsTextFromCell
{
    for (NSString *key in dictionaryOfStringsTextFromCell)
    {
        [self.tableReturnableDictionary setObject:[dictionaryOfStringsTextFromCell objectForKey:key] forKey:key];
    }
    NSLog(@"DIct:%@",self.tableReturnableDictionary);
}

- (void)setValuesForAllCells
{
    [self.delegate valuesToPassBack:self.tableReturnableDictionary];
}

@end
