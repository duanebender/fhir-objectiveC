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
    
    if (self.imageOfPatient)
    {
        self.editPatientImage.image = self.imageOfPatient;
    }
    else
    {
        self.editPatientImage.image = [UIImage imageNamed:@"profile_male.png"];
    }
	// Do any additional setup after loading the view.
}

#pragma mark - personal array generation for table, code below

- (NSMutableArray *)generatePersonalCellContentsArray:(NSMutableArray *)arraySizeCheck
{
    NSMutableArray *cellContentsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [arraySizeCheck count]; i++)
    {
        if ([self.personalInfoContents count] != 0)
        {
            if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Name:"] && [self.personalInfoContents objectForKey:@"Name:"])
            {
                [cellContentsArray addObject:[self.personalInfoContents objectForKey:@"Name:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Date Of Birth:"] && [self.personalInfoContents objectForKey:@"Date Of Birth:"])
            {
                [cellContentsArray addObject:[self.personalInfoContents objectForKey:@"Date of Birth:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Gender:"] && [self.personalInfoContents objectForKey:@"Gender:"])
            {
                [cellContentsArray addObject:[self.personalInfoContents objectForKey:@"Gender:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Marital Status:"] && [self.personalInfoContents objectForKey:@"Marital Status:"])
            {
                [cellContentsArray addObject:[self.personalInfoContents objectForKey:@"Marital Status:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Deceased:"] && [self.personalInfoContents objectForKey:@"Deceased:"])
            {
                [cellContentsArray addObject:[self.personalInfoContents objectForKey:@"Deceased:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Language:"] && [self.personalInfoContents objectForKey:@"Language:"])
            {
                [cellContentsArray addObject:[self.personalInfoContents objectForKey:@"Language:"]];
            }
            else
            {
                [cellContentsArray addObject:@""];
            }
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

- (NSMutableDictionary *)generateContactCellContentsDictionary:(NSMutableArray *)arraySizeCheck
{
    NSMutableArray *cellContentsArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *dictToReturn = [[NSMutableDictionary alloc] init];
   
    for (int i = 0; i < [arraySizeCheck count]; i++)
    {
        if ([self.contactInfoContents count] != 0)
        {
            if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Fax:"] && [self.contactInfoContents objectForKey:@"Fax:"])
            {
                [cellContentsArray addObject:[self.contactInfoContents objectForKey:@"Fax:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Email:"] && [self.contactInfoContents objectForKey:@"Email:"])
            {
                [cellContentsArray addObject:[self.contactInfoContents objectForKey:@"Email:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Address:"] && [self.contactInfoContents objectForKey:@"Address:"])
            {
                [dictToReturn setObject:[self.contactInfoContents objectForKey:@"Address:"] forKey:@"addressCellString"];
                [cellContentsArray addObject:@""];
                NSLog(@"%@",self.contactInfoContents);
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Phone:"] && [self.contactInfoContents objectForKey:@"Phone:"])
            {
                [dictToReturn setObject:[self.contactInfoContents objectForKey:@"Phone:"] forKey:@"phoneCellDictionary"];
                [cellContentsArray addObject:@""];
            }
            else
            {
                [cellContentsArray addObject:@""];
            }
        }
        else
        {
            [cellContentsArray addObject:@""];
        }
    }
    
    [dictToReturn setObject:cellContentsArray forKey:@"singleCellContentsArray"];
    
    return dictToReturn;
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
        if ([self.addInfoContents count] != 0)
        {
            if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Siblings:"] && [self.addInfoContents objectForKey:@"Siblings:"])
            {
                [cellContentsArray addObject:[self.addInfoContents objectForKey:@"Siblings:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Active Status:"] && [self.addInfoContents objectForKey:@"Active Status:"])
            {
                [cellContentsArray addObject:[self.addInfoContents objectForKey:@"Active Status:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Provider:"] && [self.addInfoContents objectForKey:@"Provider:"])
            {
                [cellContentsArray addObject:[self.addInfoContents objectForKey:@"Provider:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Linked Patients:"] && [self.addInfoContents objectForKey:@"Linked Patients:"])
            {
                [cellContentsArray addObject:[self.addInfoContents objectForKey:@"Linked Patients:"]];
            }
            else
            {
                [cellContentsArray addObject:@""];
            }
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
        if ([self.animalInfoContents count] != 0)
        {
            if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Species:"] && [self.animalInfoContents objectForKey:@"Species:"])
            {
                [cellContentsArray addObject:[self.animalInfoContents objectForKey:@"Species:"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Breed:"] && [self.animalInfoContents objectForKey:@"Breed"])
            {
                [cellContentsArray addObject:[self.animalInfoContents objectForKey:@"Breed"]];
            }
            else if ([[arraySizeCheck objectAtIndex:i] isEqualToString:@"Gender Status:"] && [self.animalInfoContents objectForKey:@"Gender Status:"])
            {
                [cellContentsArray addObject:[self.animalInfoContents objectForKey:@"Gender Status:"]];
            }
            else
            {
                [cellContentsArray addObject:@""];
            }
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
        NSDictionary *forPassingCellInfo = [[NSDictionary alloc] initWithDictionary:[self generateContactCellContentsDictionary:childViewController.contactCellLabels]];
        childViewController.contactCellContents = [[NSMutableArray alloc] initWithArray:[forPassingCellInfo objectForKey:@"singleCellContentsArray"]];
        childViewController.addressContentsString = [[NSMutableString alloc] initWithString:[forPassingCellInfo objectForKey:@"addressCellString"]];
        childViewController.phoneContentsDict = [[NSMutableDictionary alloc] initWithDictionary:[forPassingCellInfo objectForKey:@"phoneCellDictionary"]];
        
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
