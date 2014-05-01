//
//  HPMasterViewController.m
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import "HPMasterViewController.h"
#import "HPDetailViewController.h"
#import "HPAnimationConfigViewController.h"
#import <pop/POP.h>

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    HPAnimationConfigViewController *destinationViewController = segue.destinationViewController;
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:selectedIndexPath];
    
    destinationViewController.title = selectedCell.textLabel.text;
    NSString *identifier = segue.identifier;
    destinationViewController.configKey = identifier;
    
    HPDetailViewController *detailViewController = self.detailViewController;
    if ([identifier isEqualToString:@"spring"])
    {
        detailViewController.animation = [self springAnimation];
    }
    else if ([identifier isEqualToString:@"decay"])
    {
        detailViewController.animation = [self decayAnimation];
    }
    [detailViewController animate];
}

- (POPAnimation*)springAnimation
{
    HPDetailViewController *detailViewController = self.detailViewController;
    UIView *animationView = detailViewController.animationView;
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBounds];
    const CGRect toRect = CGRectApplyAffineTransform(animationView.bounds, CGAffineTransformMakeScale(2, 2));
    animation.toValue = [NSValue valueWithCGRect:toRect];
    return animation;
}

- (POPAnimation*)decayAnimation
{
    HPDetailViewController *detailViewController = self.detailViewController;
    UIView *animationView = detailViewController.animationView;
    POPDecayAnimation *animation = [POPDecayAnimation animationWithPropertyNamed:kPOPViewBounds];
    const CGRect fromRect = CGRectApplyAffineTransform(animationView.bounds, CGAffineTransformMakeScale(2, 2));
    animation.fromValue = [NSValue valueWithCGRect:fromRect];
    return animation;
}


@end
