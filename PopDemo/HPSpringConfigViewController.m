//
//  HPSpringConfigViewController.m
//  PopDemo
//
//  Created by Hermés Piqué on 30/04/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

#import "HPSpringConfigViewController.h"
#import <pop/POP.h>
@interface HPSpringConfigViewController ()

@end

@implementation HPSpringConfigViewController

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *path = [[NSBundle mainBundle] pathForResource: @"Forms" ofType: @"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *cells = dictionary[@"spring"];
    NSDictionary *config = cells[indexPath.row];
    [cell setValuesForKeysWithDictionary:config];
    return cell;
}

@end
