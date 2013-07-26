//
//  SectionHeaderView.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "SectionHeaderView.h"

@implementation SectionHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle:(NSString *)titleString
{
    self = [super init];
    if (self) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SectionHeader" bundle:nil];
        
        self = (SectionHeaderView *)[[storyboard instantiateViewControllerWithIdentifier:@"SectionHeaderView"] view];
        [self.title setText:titleString];
        
    }
    return self;
}

@end
