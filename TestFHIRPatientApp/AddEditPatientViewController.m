//
//  AddEditPatientViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-17.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "AddEditPatientViewController.h"
#import "AddEditPatientTableViewController.h"

@interface AddEditPatientViewController ()

@end

@implementation AddEditPatientViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark - personal array generation for table, code below

- (NSMutableArray *)generatePersonalCellContentsArray:(NSMutableArray *)arraySizeCheck
{
    NSMutableArray *cellContentsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [arraySizeCheck count]; i++)
    {
        if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Name:"])
        {
            [cellContentsArray addObject:@"Adam Sippel"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Date Of Birth:"])
        {
            [cellContentsArray addObject:@"07/02/1992"];
        }
        else
        {
            [cellContentsArray addObject:@""];
        }
    }
    
    return cellContentsArray;
}

- (NSMutableArray *)generatePersonalCellReferencesArray:(NSMutableArray *)arraySizeCheck
{
    NSMutableArray *cellReferencesArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [arraySizeCheck count]; i++)
    {
        if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Name:"])
        {
            [cellReferencesArray addObject:@"John Smith"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Date Of Birth:"])
        {
            [cellReferencesArray addObject:@"dd/MM/yyyy"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Gender:"])
        {
            [cellReferencesArray addObject:@"male/female"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Marital Status:"])
        {
            [cellReferencesArray addObject:@"single, married, widow, etc."];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Deceased:"])
        {
            [cellReferencesArray addObject:@"Yes/No, or dd/MM/yyyy"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Language:"])
        {
            [cellReferencesArray addObject:@"English"];
        }
        else
        {
            [cellReferencesArray addObject:@""];
        }
    }
    
    return cellReferencesArray;
}

#pragma mark - contents array generation for table, code below

- (NSMutableArray *)generateContactCellReferencesArray:(NSMutableArray *)arraySizeCheck
{
    NSMutableArray *cellReferencesArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [arraySizeCheck count]; i++)
    {
        if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Fax:"])
        {
            [cellReferencesArray addObject:@"Fax: (555) 555-5555"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Email:"])
        {
            [cellReferencesArray addObject:@"emailaddress@hotmail.com"];
        }
        else
        {
            [cellReferencesArray addObject:@""];
        }
    }
    
    return cellReferencesArray;
}

- (NSMutableArray *)generateContactCellContentsArray:(NSMutableArray *)arraySizeCheck
{
    NSMutableArray *cellContentsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [arraySizeCheck count]; i++)
    {
        if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Fax:"])
        {
            [cellContentsArray addObject:@"(123) 456-7890"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Email:"])
        {
            [cellContentsArray addObject:@""];
        }
        else
        {
            [cellContentsArray addObject:@""];
        }
    }
    
    return cellContentsArray;
}

#pragma mark - additional info array generation for table, code below

- (NSMutableArray *)generateAdditionalInfoCellReferencesArray:(NSMutableArray *)arraySizeCheck
{
    NSMutableArray *cellReferencesArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [arraySizeCheck count]; i++)
    {
        if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Siblings:"])
        {
            [cellReferencesArray addObject:@"Yes/No or number of siblings"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Active Status:"])
        {
            [cellReferencesArray addObject:@"Yes/No"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Provider:"])
        {
            [cellReferencesArray addObject:@"link to provider"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Linked Patients:"])
        {
            [cellReferencesArray addObject:@"link, link, link..."];
        }
        else
        {
            [cellReferencesArray addObject:@""];
        }
    }
    
    return cellReferencesArray;
}

- (NSMutableArray *)generateAdditionalInfoCellContentsArray:(NSMutableArray *)arraySizeCheck
{
    NSMutableArray *cellContentsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [arraySizeCheck count]; i++)
    {
        if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Siblings:"])
        {
            [cellContentsArray addObject:@"50"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Active Status:"])
        {
            [cellContentsArray addObject:@""];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Provider:"])
        {
            [cellContentsArray addObject:@""];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Linked Patients:"])
        {
            [cellContentsArray addObject:@""];
        }
        else
        {
            [cellContentsArray addObject:@""];
        }
    }
    
    return cellContentsArray;
}

#pragma mark - animal info array generation for table, code below

- (NSMutableArray *)generateAnimalInfoCellReferencesArray:(NSMutableArray *)arraySizeCheck
{
    NSMutableArray *cellReferencesArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [arraySizeCheck count]; i++)
    {
        if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Species:"])
        {
            [cellReferencesArray addObject:@"dog, cat, etc."];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Breed:"])
        {
            [cellReferencesArray addObject:@"Pug, Siamese, etc."];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Gender Status:"])
        {
            [cellReferencesArray addObject:@"Neutered or Intact"];
        }
        else
        {
            [cellReferencesArray addObject:@""];
        }
    }
    
    return cellReferencesArray;
}

- (NSMutableArray *)generateAnimalInfoCellContentsArray:(NSMutableArray *)arraySizeCheck
{
    NSMutableArray *cellContentsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [arraySizeCheck count]; i++)
    {
        if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Species:"])
        {
            [cellContentsArray addObject:@"Dog"];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Breed:"])
        {
            [cellContentsArray addObject:@""];
        }
        else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Gender Status:"])
        {
            [cellContentsArray addObject:@""];
        }
        else
        {
            [cellContentsArray addObject:@""];
        }
    }
    
    return cellContentsArray;
}

#pragma mark - segue methods

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"containerSegue"])
    {
        AddEditPatientTableViewController * childViewController = (AddEditPatientTableViewController *) [segue destinationViewController];
        
        //personal info array information
        childViewController.personalCellsLabels = [[NSMutableArray alloc] initWithObjects:@"Name:", @"Date Of Birth:", @"Gender:", @"Marital Status:", @"Deceased:", @"Language:", nil];
        childViewController.personalCellsContents = [[NSMutableArray alloc] initWithArray:[self generatePersonalCellContentsArray:childViewController.personalCellsLabels]];
        childViewController.personalCellsReferenceText = [[NSMutableArray alloc] initWithArray:[self generatePersonalCellReferencesArray:childViewController.personalCellsLabels]];
        
        //contact info array information
        childViewController.contactCellLabels = [[NSMutableArray alloc] initWithObjects:@"Address:", @"Phone:", @"Fax:", @"Email:", nil];
        childViewController.contactCellReferenceText = [[NSMutableArray alloc] initWithArray:[self generateContactCellReferencesArray:childViewController.contactCellLabels]];
        childViewController.contactCellContents = [[NSMutableArray alloc] initWithArray:[self generateContactCellContentsArray:childViewController.contactCellLabels]];
        
        //additional info array information
        childViewController.addCellLabels = [[NSMutableArray alloc] initWithObjects:@"Siblings:", @"Active Status:", @"Provider:", @"Linked Patients:", nil];
        childViewController.addCellReferenceText = [[NSMutableArray alloc] initWithArray:[self generateAdditionalInfoCellReferencesArray:childViewController.addCellLabels]];
        childViewController.addCellContents = [[NSMutableArray alloc] initWithArray:[self generateAdditionalInfoCellContentsArray:childViewController.addCellLabels]];
        
        //animal info array information
        childViewController.animalCellLabels = [[NSMutableArray alloc] initWithObjects:@"Species:", @"Breed:", @"Gender Status:", nil];
        childViewController.animalCellReferenceText = [[NSMutableArray alloc] initWithArray:[self generateAnimalInfoCellReferencesArray:childViewController.animalCellLabels]];
        childViewController.animalCellContents = [[NSMutableArray alloc] initWithArray:[self generateAnimalInfoCellContentsArray:childViewController.animalCellLabels]];
        
    }
}

@end
