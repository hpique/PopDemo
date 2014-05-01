//
//  HPDetailViewController.h
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id animation;

@property (weak, nonatomic) IBOutlet UIView *animationView;

- (void)animate;

@end
