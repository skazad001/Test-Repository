//
//  TableViewCellOne.h
//  TestBothSideScrollTableView
//
//  Created by Azad on 11/03/15.
//  Copyright (c) 2015 Azad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellOne : UITableViewCell <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, retain) NSArray *arrayContents;

@end
