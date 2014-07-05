//
//  ViewController2.m
//  MovableSectionTableViewController
//
//  Created by Michael Snowden on 7/5/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import "TableViewControllerWithEditableSections.h"
#import "CellWithTableView.h"

@interface TableViewControllerWithEditableSections()

@property (nonatomic, strong) NSMutableDictionary *data;

@end

@implementation TableViewControllerWithEditableSections

- (void)viewDidLoad
{
    [super viewDidLoad];

    _data = [@{[NSIndexPath indexPathForRow:0 inSection:0] : @[@"One", @"Two", @"Three"],
               [NSIndexPath indexPathForRow:1 inSection:0] : @[@"Red", @"Yellow", @"Green", @"Blue"],
               [NSIndexPath indexPathForRow:2 inSection:0] : @[@"On", @"Off"]}
             mutableCopy];

    self.tableView.editing = YES;
}

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
    NSArray *innerData = _data[indexPath];
    CGRect frame = [@"A" boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:[UIFont systemFontSize]]}
                                      context:nil];
    return (innerData.count + 1) * frame.size.height;   // the one is for the label
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"reuseIdentifier";
    CellWithTableView *cell = (CellWithTableView *)[tableView dequeueReusableCellWithIdentifier:identifier];
    cell.data = _data[indexPath];
    NSString *headerText;
    switch (indexPath.row) {
        case 0:
            headerText = @"Numbers";
            break;
        case 1:
            headerText = @"Colors";
            break;
        case 2:
            headerText = @"Switches";
            break;
        default:
            break;
    }
    CGRect frame = [headerText boundingRectWithSize:CGSizeMake(self.view.frame.size.width, MAXFLOAT)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:[UIFont systemFontSize]]}
                                            context:nil];
    cell.label.text = headerText;
    cell.label.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    cell.label.frame = frame;
    cell.label.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSArray *temp = _data[sourceIndexPath];
    _data[sourceIndexPath] = _data[destinationIndexPath];
    _data[destinationIndexPath] = temp;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

@end
