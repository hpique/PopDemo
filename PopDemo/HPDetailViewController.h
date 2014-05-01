//
//  HPDetailViewController.h
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (readonly, nonatomic) id animation;

#pragma mark Spring Animation

@property (assign, nonatomic) CGFloat springBounciness;

@property (assign, nonatomic) CGFloat springSpeed;

@end
