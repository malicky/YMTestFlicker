//
//  YMFeedViewController.m
//  YMTestFlicker
//
//  Created by Malick Youla on 2014-06-14.
//  Copyright (c) 2014 Malick Youla. All rights reserved.
//

#import "YMFeedViewController.h"
#import "YMFullScreenViewController.h"
#import "YMSettingsViewController.h"

@interface YMFeedViewController ()

@end

@implementation YMFeedViewController

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
    
    // Nav Bar buttons setup.
    UIBarButtonItem* b =
    [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"List", nil)
                                     style:UIBarButtonItemStylePlain
                                    target:self action:@selector(doList:)];
    self.navigationItem.rightBarButtonItem = b;
    b = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Setting", nil)
                                         style:UIBarButtonItemStylePlain
                                        target:self action:@selector(doSetting:)];
    self.navigationItem.leftBarButtonItem = b;

    // Setup the UIView
    UIView* v = self.view;
    v.backgroundColor = [UIColor grayColor];
    UILabel* label = [UILabel new];
    [v addSubview:label];
    
    label.text = @"Feeds";
    
    label.autoresizingMask = (
                              UIViewAutoresizingFlexibleTopMargin |
                              UIViewAutoresizingFlexibleLeftMargin |
                              UIViewAutoresizingFlexibleBottomMargin |
                              UIViewAutoresizingFlexibleRightMargin
                              );
    [label sizeToFit];
    label.center = CGPointMake(CGRectGetMidX(v.bounds),
                               CGRectGetMidY(v.bounds));
    label.frame = CGRectIntegral(label.frame);

    // Setup the tap gesture
    UITapGestureRecognizer* t = [[UITapGestureRecognizer alloc]
                                 initWithTarget:self
                                 action:@selector(singleTap)];
    [v addGestureRecognizer:t];
}

 - (void) singleTap {
     // present the full screen o the tapped image
     YMFullScreenViewController *fullScreenVC = [YMFullScreenViewController new];
     [self.navigationController pushViewController:fullScreenVC animated:YES];
     self.navigationItem.title = @"";
}

// the use tapped on tight nav bar button item to select the grid mode
- (IBAction)doList:(id)sender {
    UIBarButtonItem* b = self.navigationItem.rightBarButtonItem;
    b.title = NSLocalizedString(@"Grid", nil);
    b.action = @selector(doGrid:);
    //TODO Grid

}

// the use tapped on tight nav bar button item to select the list mode
- (IBAction)doGrid:(id)sender {
    UIBarButtonItem* b = self.navigationItem.rightBarButtonItem;
    b.title = NSLocalizedString(@"List", nil);
    b.action = @selector(doList:);
    //TODO List

}

// present the setting view
- (IBAction)doSetting:(id)sender {
        YMSettingsViewController *settingsVC = [YMSettingsViewController new];
    [self.navigationController pushViewController:settingsVC animated:YES];
    self.navigationItem.title = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
