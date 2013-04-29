//
//  PatientLoaderTableViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-16.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "PatientLoaderTableViewController.h"
#import "FHIR.h"
#import "PatientViewController.h"

@implementation PatientLoaderTableViewController

- (IBAction)refresh:(id)sender
{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner startAnimating];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
    
    dispatch_queue_t downloadQueue = dispatch_queue_create("flickr downloader", NULL);
    dispatch_async(downloadQueue, ^{
        [self grabFromServer];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.navigationItem.rightBarButtonItem = sender;
            //self.patientArray = patients;
        });
    });
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)grabFromServer
{
    NSObject *patientJSON = [[NSObject alloc] init];
    self.patientArray = [[NSMutableArray alloc] init];
    for (int i = 1; i < 10; i ++)
    {
        
        JSONToDict *jsonDict = [[JSONToDict alloc] init];
        NSMutableString *urlString = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"http://hl7connect.healthintersections.com.au/svc/fhir/patient/@%d", i]];
        patientJSON = [jsonDict convertJsonToDictionary:[urlString stringByAppendingString:@"/history/@1?_format=json"]];
        
        [self.patientArray addObject:patientJSON];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self grabFromServer];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.patientArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Patient Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //configure cell...
    Demographics *tempPatient = [[Demographics alloc] init];
    tempPatient = [[self.patientArray objectAtIndex:indexPath.row] details];
    NSDictionary *getNamePatientDict1 = [[NSDictionary alloc] initWithDictionary:[tempPatient generateAndReturnDictionary]]; //holds a demographics object
    NSDictionary *getNamePatientDict2 = [[NSDictionary alloc] initWithDictionary:[[getNamePatientDict1 objectForKey:@"name"] objectAtIndex:0]]; //holds a humanname object
    NSDictionary *firstNameDict = [[NSDictionary alloc] initWithDictionary:[[getNamePatientDict2 objectForKey:@"given"] objectAtIndex:0]]; //holds first given name
    NSString *firstNameString = [firstNameDict objectForKey:@"value"];
    NSDictionary *lastNameDict = [[NSDictionary alloc] initWithDictionary:[[getNamePatientDict2 objectForKey:@"family"] objectAtIndex:0]]; //holds first family name
    NSString *lastNameString = [lastNameDict objectForKey:@"value"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",lastNameString, firstNameString];
    
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueToPatientView"])
    {
        PatientViewController *target = (PatientViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        target.patient = [self.patientArray objectAtIndex:indexPath.row];
        target.title = [[[self.tableView cellForRowAtIndexPath:indexPath] textLabel] text];
    }
    else
    {
        
        NSIndexPath *indexPath = nil;
        if ([sender isKindOfClass:[NSIndexPath class]])
        {
            indexPath = (NSIndexPath *)sender;
        }
        else if ([sender isKindOfClass:[UITableViewCell class]])
        {
            indexPath = [self.tableView indexPathForCell:sender];
        }
        else if (!sender || (sender == self.tableView))
        {
            indexPath = [self.tableView indexPathForSelectedRow];
        }
    }
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
