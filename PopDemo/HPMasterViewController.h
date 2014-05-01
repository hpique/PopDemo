//
//  HPMasterViewController.h
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HPDetailViewController;

@interface HPMasterViewController : UITableViewController

@property (strong, nonatomic) HPDetailViewController *detailViewController;

@end
