//
//  HPSliderCell.h
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import "HPPropertyCell.h"

@interface HPSliderCell : HPPropertyCell

@property (readonly, nonatomic) UISlider *slider;

@property (assign, nonatomic) CGFloat maximumValue;

@property (assign, nonatomic) CGFloat minimumValue;

@end
