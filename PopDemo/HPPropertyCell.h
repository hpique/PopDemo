//
//  HPPropertyCell.h
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPPropertyCell : UITableViewCell

@property (readonly, nonatomic) UILabel *propertyLabel;

@property (copy, nonatomic) NSString *property;

@property (copy, nonatomic) NSString *binding;

#pragma mark Subclassing

- (void)initHelper NS_REQUIRES_SUPER;

@property (copy, nonatomic) id value;

- (void)didChangeValue:(id)value;

@end
