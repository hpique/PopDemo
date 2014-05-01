//
//  HPSliderCell.m
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import "HPSliderCell.h"
#import "Lyt.h"

@implementation HPSliderCell {
    UILabel *_valueLabel;
}

- (void)initHelper
{
    [super initHelper];
    
    _valueLabel = [UILabel new];
    _valueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _valueLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_valueLabel];
    
    [_valueLabel lyt_alignRightToParentWithMargin:-12];
    [_valueLabel lyt_centerYInParent];
    [_valueLabel lyt_setWidth:50];
    
    _slider = [UISlider new];
    _slider.translatesAutoresizingMaskIntoConstraints = NO;
    _slider.minimumValue = CGFLOAT_MIN; // Allows to set value before minimumValue
    _slider.maximumValue = CGFLOAT_MAX; // Allows to set value before maximumValue
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:_slider];
    
    [_slider lyt_centerYInParent];
    [_slider lyt_placeLeftOfView:_valueLabel margin:-12];
    [_slider lyt_setWidth:120];
}

- (void)setValue:(id)value
{
    CGFloat floatValue = [value floatValue];
    _valueLabel.text = [NSString stringWithFormat:@"%.2f", floatValue];
    self.slider.value = floatValue;
}

- (id)value
{
    return @(self.slider.value);
}

- (void)sliderValueChanged:(UISlider*)slider
{
    const CGFloat value = slider.value;
    _valueLabel.text = [NSString stringWithFormat:@"%.2f", value];
    [self didChangeValue:self.value];
}

#pragma mark Properties

- (void)setMaximumValue:(CGFloat)maximumValue
{
    self.slider.maximumValue = maximumValue;
}

- (CGFloat)maximumValue
{
    return self.slider.maximumValue;
}

- (void)setMinimumValue:(CGFloat)minimumValue
{
    self.slider.minimumValue = minimumValue;
}

- (CGFloat)minimumValue
{
    return self.slider.minimumValue;
}

@end
