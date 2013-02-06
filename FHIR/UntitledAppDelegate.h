//
//  UntitledAppDelegate.h
//  Untitled
//
//  Created by Geoffrey Pamerleau on 4/16/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UntitledAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

