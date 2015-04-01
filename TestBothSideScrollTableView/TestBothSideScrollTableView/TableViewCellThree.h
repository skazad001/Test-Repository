//
//  TableViewCellThree.h
//  TestBothSideScrollTableView
//
//  Created by Azad on 11/03/15.
//  Copyright (c) 2015 Azad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utility.h"

@interface TableViewCellThree : UITableViewCell <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, retain) NSArray *arrayContents;

@end
