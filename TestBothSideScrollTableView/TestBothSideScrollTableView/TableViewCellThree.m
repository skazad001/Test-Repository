//
//  TableViewCellThree.m
//  TestBothSideScrollTableView
//
//  Created by Azad on 11/03/15.
//  Copyright (c) 2015 Azad. All rights reserved.
//

#import "TableViewCellThree.h"

@implementation TableViewCellThree
@synthesize arrayContents;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayContents.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UIView *cellView = [Utility getViewAfterResize:[[NSBundle mainBundle] loadNibNamed:@"NewsCellView" owner:self options:nil][2]];
        
        [cell.contentView addSubview:cellView];
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    }
    
    [self setValuesToTheTableView:tableView withCell:cell andIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Cell selected => %@",arrayContents[indexPath.row]);
}

- (void)setValuesToTheTableView :(UITableView *)tableView withCell :(UITableViewCell *)cell andIndexPath :(NSIndexPath *)indexPath
{
    UIImageView *imageVNews = (UIImageView *)[cell.contentView viewWithTag:11];
    UILabel *lblNewsTitle = (UILabel *)[cell.contentView viewWithTag:12];
    UILabel *lblNewsDetails = (UILabel *)[cell.contentView viewWithTag:13];
    
    lblNewsTitle.text = arrayContents[indexPath.row];
    lblNewsDetails.text = @"Details text changed from update cell contain function";
}

@end
