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
    
    dispatch_queue_t downloadQueue = dispatch_queue_create("patient downloader", NULL);
    dispatch_async(downloadQueue, ^{
        [self grabFromServer:@"1-5"];
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
        self.patientSearchBar.delegate = self;
        
    }
    return self;
}

- (void)grabFromServer:(NSString *)searchIDRange
{
    //turn range into a string
    NSNumber *minID;
    NSNumber *maxID;
    NSMutableArray *rangesToSearch = [[NSMutableArray alloc] init];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [self.patientArray removeAllObjects];
    
    if ([searchIDRange rangeOfString:@","].length > 0) //multiple string ranges found
    {
        NSArray *allRanges = [searchIDRange componentsSeparatedByString:@","];
        
        for (int k = 0; k < [allRanges count]; k++)
        {
            if ([[allRanges objectAtIndex:k] rangeOfString:@"-"].location) //if a range within the ranges
            {
                NSArray *grabMinAndMax = [searchIDRange componentsSeparatedByString:@"-"];
                minID = [formatter numberFromString:[grabMinAndMax objectAtIndex:0]];
                maxID = [formatter numberFromString:[grabMinAndMax objectAtIndex:1]];
                
                
            }
        }
    }
    else if ([searchIDRange rangeOfString:@"-"].length > 0) //string range min to max seperated by "-"
    {
        NSArray *grabMinAndMax = [searchIDRange componentsSeparatedByString:@"-"];
        minID = [formatter numberFromString:[grabMinAndMax objectAtIndex:0]];
        maxID = [formatter numberFromString:[grabMinAndMax objectAtIndex:1]];
        
        [rangesToSearch addObject:minID];
        [rangesToSearch addObject:maxID];
    }
    
    else if ([formatter numberFromString:searchIDRange])//only one id
    {
        minID = [formatter numberFromString:searchIDRange];
        maxID = minID;
        
        [rangesToSearch addObject:minID];
        [rangesToSearch addObject:maxID];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please use only Patient ID's in the search field. (digits, '-', and ',')"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    NSObject *patientJSON = [[NSObject alloc] init];
    BOOL missedFiles = false;
    self.patientArray = [[NSMutableArray alloc] init];
    NSInteger currentObjectIndex = 0;
    NSMutableString *missingFilesAlert = [[NSMutableString alloc] initWithString:@"Paitient ID(s) "];
    for (int j = 1; j <= ([rangesToSearch count]/2); j++)
    {
        for (int i = [[rangesToSearch objectAtIndex:currentObjectIndex] intValue]; i <= [[rangesToSearch objectAtIndex:currentObjectIndex+1] intValue]; i ++)
        {
            JSONToDict *jsonDict = [[JSONToDict alloc] init];
            NSMutableString *urlString = [[NSMutableString alloc] initWithString:[NSMutableString stringWithFormat:@"http://hl7connect.healthintersections.com.au/svc/fhir/patient/@%d", i]];
            NSString *tempURLString = [urlString stringByAppendingString:@"/history/@1?_format=json"];
        
            //check if file exists at path
            NSURL *tempUrl = [[NSURL alloc] initWithString:tempURLString];
            NSString *jsonString = [NSString stringWithContentsOfURL:tempUrl encoding:NSASCIIStringEncoding error:nil];
            if (jsonString)
            {
                NSLog(@"%@",tempURLString);
                patientJSON = [jsonDict convertJsonToDictionary:tempURLString];
                [self.patientArray addObject:patientJSON];
            }
            else
            {
                [missingFilesAlert stringByAppendingString:[NSString stringWithFormat:@"%d, ", i]];
                missedFiles = true;
            }
        }
    }
    
    if (missedFiles)
    {
    [missingFilesAlert stringByAppendingString:@"do(es) not exist."];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                    message:missingFilesAlert
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    }
    [self.tableView reloadData];
    NSLog(@"%@",self.patientArray);
}
/*
- (void)searchBarTextDidEndEditing:(UISearchBar *)aSearchBar
{
    NSLog(@"HERE?");
    [self grabFromServer:self.aSearchBar.text];
}
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //searchbar addon start
    //self.aSearchBar.delegate = self;
    
    [self grabFromServer:@"1-10"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Search Bar delegate code

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
    self.tableView.allowsSelection = NO;
    self.tableView.scrollEnabled = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text=@"";
    
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.tableView.allowsSelection = YES;
    self.tableView.scrollEnabled = YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self grabFromServer:searchBar.text];
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
    /*
    Demographics *tempPatient = [[Demographics alloc] init];
    tempPatient = [[self.patientArray objectAtIndex:indexPath.row] details];
    NSDictionary *getNamePatientDict1 = [[NSDictionary alloc] initWithDictionary:[tempPatient generateAndReturnDictionary]]; //holds a demographics object
    NSDictionary *getNamePatientDict2 = [[NSDictionary alloc] initWithDictionary:[[getNamePatientDict1 objectForKey:@"name"] objectAtIndex:0]]; //holds a humanname object
    NSDictionary *firstNameDict = [[NSDictionary alloc] initWithDictionary:[[getNamePatientDict2 objectForKey:@"given"] objectAtIndex:0]]; //holds first given name
    NSString *firstNameString = [firstNameDict objectForKey:@"value"];
    NSDictionary *lastNameDict = [[NSDictionary alloc] initWithDictionary:[[getNamePatientDict2 objectForKey:@"family"] objectAtIndex:0]]; //holds first family name
    NSString *lastNameString = [lastNameDict objectForKey:@"value"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",lastNameString, firstNameString];
    */
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
