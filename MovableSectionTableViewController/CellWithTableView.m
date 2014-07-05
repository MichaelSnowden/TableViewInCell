//
//  CellWithTableView.m
//  MovableSectionTableViewController
//
//  Created by Michael Snowden on 7/5/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import "CellWithTableView.h"

@interface CellWithTableView()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CellWithTableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect frame = [_data[indexPath.row] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:[UIFont systemFontSize]]}
                                      context:nil];
    return frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    cell.textLabel.text = _data[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    return cell;
}

@end
