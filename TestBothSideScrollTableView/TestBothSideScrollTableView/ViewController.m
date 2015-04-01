//
//  ViewController.m
//  TestBothSideScrollTableView
//
//  Created by Azad on 11/03/15.
//  Copyright (c) 2015 Azad. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCellOne.h"
#import "TableViewCellTwo.h"
#import "TableViewCellThree.h"

@interface ViewController ()
{
    NSArray *arr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arr = @[@[@"A1", @"A2", @"A3"],
            @[@"B1", @"B2", @"B3", @"B4"],
            @[@"C1", @"C2"],
            @[@"D1"],
            @[@"E1", @"E2", @"E3", @"E4", @"E5"],
            @[@"F1", @"F2"],
            @[@"G1", @"G2", @"G3"],
            @[@"H1"],
            @[@"I1", @"I2"],
            @[@"J1", @"J2", @"J3"]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Change by Azad
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return arr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section % 3 == 0) 
    {
        TableViewCellOne *cell = (TableViewCellOne *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) 
        {
            [[NSBundle mainBundle] loadNibNamed:@"TableViewCellOne" owner:self options:nil];
            [Utility getViewAfterResize:_cellOne];
            [Utility transformTableToHorizontal:_cellOne.table andSuperView:_cellOne rowHeight:107];
            
//            tableViewCell.contentArray = [arrays objectAtIndex:indexPath.section];
            _cellOne.arrayContents = arr[indexPath.section];
            _cellOne.table.allowsSelection = YES;
            cell = _cellOne;
        }
        
        return cell;
    }
    else if (indexPath.section % 3 == 1) 
    {
        TableViewCellTwo *cell = (TableViewCellTwo *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) 
        {
            [[NSBundle mainBundle] loadNibNamed:@"TableViewCellTwo" owner:self options:nil];
            [Utility getViewAfterResize:_cellTwo];
            [Utility transformTableToHorizontal:_cellTwo.table andSuperView:_cellTwo rowHeight:160];
            
            //            tableViewCell.contentArray = [arrays objectAtIndex:indexPath.section];
            _cellTwo.arrayContents = arr[indexPath.section];
            _cellTwo.table.allowsSelection = YES;
            cell = _cellTwo;
        }
        
        return cell;
    }
    else if (indexPath.section % 3 == 2) 
    {
        TableViewCellThree *cell = (TableViewCellThree *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) 
        {
            [[NSBundle mainBundle] loadNibNamed:@"TableViewCellThree" owner:self options:nil];
            [Utility getViewAfterResize:_cellThree];
            [Utility transformTableToHorizontal:_cellThree.table andSuperView:_cellThree rowHeight:160];
            
            //            tableViewCell.contentArray = [arrays objectAtIndex:indexPath.section];
            _cellThree.arrayContents = arr[indexPath.section];
            _cellThree.table.allowsSelection = YES;
            cell = _cellThree;
        }
        
        return cell;
    }
    
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section % 3 == 0) 
    {
        _cellOne.arrayContents = arr[indexPath.section];
    }
    else if (indexPath.section % 3 == 1) 
    {
        _cellTwo.arrayContents = arr[indexPath.section];
    }
    else if (indexPath.section % 3 == 2) 
    {
        _cellThree.arrayContents = arr[indexPath.section];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section % 3 == 0) 
    {
        return  120 * hRatio;
    }
    else if (indexPath.section % 3 == 1) 
    {
        return 87 * hRatio;
    }
    else if (indexPath.section % 3 == 2) 
    {
        return 120 * hRatio;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 24 * hRatio;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *viewHeader = [Utility getViewAfterResize:[[NSBundle mainBundle] loadNibNamed:@"SectionHeaderView" owner:self options:nil][0]];
    UILabel *lblTitle = (UILabel *)[viewHeader viewWithTag:112];
    lblTitle.text = arr[section][0];
    return viewHeader;
}

@end
