//
//  HistoryWebViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-09-16.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "HistoryWebViewController.h"

@interface HistoryWebViewController ()

@end

@implementation HistoryWebViewController

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
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:self.urlToDisplay];
    [self.historyWebView loadRequest:requestObj];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
