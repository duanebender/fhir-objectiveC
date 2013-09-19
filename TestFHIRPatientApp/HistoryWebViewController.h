//
//  HistoryWebViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-09-16.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryWebViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *historyWebView;

@property (nonatomic, strong) NSURL *urlToDisplay;

@end
