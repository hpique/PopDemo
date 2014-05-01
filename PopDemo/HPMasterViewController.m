//
//  HPMasterViewController.m
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import "HPMasterViewController.h"

#import "HPDetailViewController.h"

@interface HPMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation HPMasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailViewController = (HPDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

@end
