//
//  HPDetailViewController.m
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import "HPDetailViewController.h"
#import <pop/POP.h>

@interface HPDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (weak, nonatomic) IBOutlet UIView *animationView;
@end

@implementation HPDetailViewController

#pragma mark - Managing the detail item

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self animate];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Animations", @"Bar Button Title");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark Spring

- (void)animate
{
    if (![_animation isKindOfClass:POPSpringAnimation.class])
    {
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBounds];
        CGRect toRect = CGRectApplyAffineTransform(self.animationView.bounds, CGAffineTransformMakeScale(2, 2));
        springAnimation.toValue = [NSValue valueWithCGRect:toRect];
        _animation = springAnimation;
    }
    ((POPAnimation*)_animation).delegate = self;
    [self.animationView pop_addAnimation:_animation forKey:@"animation"];
}

- (void)setSpringBounciness:(CGFloat)springBounciness
{
    _springBounciness = springBounciness;
    if ([_animation isKindOfClass:POPSpringAnimation.class])
    {
        POPSpringAnimation *springAnimation = (POPSpringAnimation*)_animation;
        springAnimation.springBounciness = self.springBounciness;
    }
}

- (void)setSpringSpeed:(CGFloat)springSpeed
{
    _springSpeed = springSpeed;
    if ([_animation isKindOfClass:POPSpringAnimation.class])
    {
        POPSpringAnimation *springAnimation = (POPSpringAnimation*)_animation;
        springAnimation.springSpeed = self.springSpeed;
    }
}

#pragma mark POPAnimationDelegate

- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished
{
    [self animate];
}


@end
