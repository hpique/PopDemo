//
//  HPPropertyCell.m
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import "HPPropertyCell.h"
#import "HPDetailViewController.h"
#import "Lyt.h"

@implementation HPPropertyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initHelper];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initHelper];
    }
    return self;
}

- (void)initHelper
{
    _propertyLabel = [UILabel new];
    _propertyLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_propertyLabel];
    
    [_propertyLabel lyt_centerYInParent];
    [_propertyLabel lyt_alignLeftToParentWithMargin:12];
}

- (void)didChangeValue:(id)value
{
    if (!self.binding) return;
    
    id animation = [self currentAnimation];
    [animation setValue:value forKey:self.binding];
}

#pragma mark Properties

- (void)setProperty:(NSString *)property
{
    _propertyLabel.text = property;
}

- (NSString*)property
{
    return _propertyLabel.text;
}

#pragma mark Private

- (id)currentAnimation
{
    UISplitViewController *rootViewController = (UISplitViewController*) self.window.rootViewController;
    UINavigationController *navigationController = (UINavigationController*)rootViewController.viewControllers[1];
    HPDetailViewController *detailViewController = (HPDetailViewController*)navigationController.topViewController;
    return detailViewController.animation;
}

@end
