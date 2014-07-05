//
//  CellWithTableView.h
//  MovableSectionTableViewController
//
//  Created by Michael Snowden on 7/5/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellWithTableView : UITableViewCell <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *data;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
