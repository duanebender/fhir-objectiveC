//
//  NameListTableViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "NameListTableViewController.h"

@interface NameListTableViewController ()

@property (nonatomic, weak) NSMutableArray *nameArray;
@property (nonatomic, weak) NSMutableArray *sectionArray;
@property (nonatomic, weak) NSMutableArray *typeArray;

@end

@implementation NameListTableViewController

- (IBAction)refreshButton:(id)sender
{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner startAnimating];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
    
    dispatch_queue_t downloadQueue = dispatch_queue_create("flickr downloader", NULL);
    dispatch_async(downloadQueue, ^{
        [self setUpNamesForTable];
        [self reloadInputViews];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.navigationItem.rightBarButtonItem = sender;
            //self.patientArray = patients;
        });
    });
}

- (IBAction)saveButton:(id)sender
{
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.patientToListNames = [[FHIRPatient alloc] init];
        self.nameArray = [[NSMutableArray alloc] init];
        self.sectionArray = [[NSMutableArray alloc] init];
        self.typeArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setUpNamesForTable
{
    //NSLog(@"%@",self.patientToListNames.details.name);
    /*
    for (int i = 0; i < [self.patientToListNames.details.name count]; i++)
    {
#warning - does not addObject?
        NSLog(@"%d",i+1);
        [self.sectionArray addObject:[NSString stringWithFormat:@"Name %d",i+1]];
        NSLog(@"Here: %@",self.sectionArray);
        HumanName *tempName = [self.patientToListNames.details.name objectAtIndex:i];
        NSLog(@"TEMPNAME: %@",tempName);
        NSDictionary *tempNameDict = [[NSDictionary alloc] initWithDictionary:[tempName generateAndReturnDictionary]];
        for (NSString *key in tempNameDict)
        {
            [self.nameArray addObject:[tempNameDict objectForKey:key]];
            [self.typeArray addObject:key];
        }
    }
     */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpNamesForTable];
    NSLog(@"%d", [self.sectionArray count]);
    NSLog(@"%@", self.nameArray);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.typeArray count];
}
     
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    
    sectionName = [self.sectionArray objectAtIndex:section];
    
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"nameCells";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.nameArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.typeArray objectAtIndex:indexPath.row];
    
    return cell;
}

@end
