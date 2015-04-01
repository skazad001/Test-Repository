//
//  ViewController.h
//  TestBothSideScrollTableView
//
//  Created by Azad on 11/03/15.
//  Copyright (c) 2015 Azad. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableViewCellOne;
@class TableViewCellTwo;
@class TableViewCellThree;

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
}

@property (nonatomic, retain) IBOutlet TableViewCellOne *cellOne;
@property (nonatomic, retain) IBOutlet TableViewCellTwo *cellTwo;
@property (nonatomic, retain) IBOutlet TableViewCellThree *cellThree;

@end

