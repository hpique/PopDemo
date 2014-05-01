//
//  HPAnimationConfigViewController.m
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import "HPAnimationConfigViewController.h"
#import <pop/POP.h>
@interface HPAnimationConfigViewController ()

@property (readonly, nonatomic) NSArray *items;

@end

@implementation HPAnimationConfigViewController

@synthesize items = _items;

#pragma mark Private

- (NSArray*)items
{
    if (!_items)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Forms" ofType: @"plist"];
        NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
        _items = dictionary[self.configKey];
    }
    return _items;
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *cellDictionary = self.items[indexPath.row];
    [cell setValuesForKeysWithDictionary:cellDictionary];
    return cell;
}

@end
