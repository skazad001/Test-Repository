//
// Utility.m

// Class created by XCoder001 on 23rd January,2015 at AMS Technologies....... :)
//


#import "Utility.h"

@implementation Utility

+ (NSUserDefaults *)getUserDefault
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    return userDefaults;
}

+ (void)syncUserDefault : (NSUserDefaults *)userDefaults
{
    [userDefaults synchronize];
}

+(NSString *)getDeviceID
{
    return @"";//[UIDevice currentDevice].uniqueIdentifier;
}

#pragma mark -
#pragma mark Get applicationDocumentsDirectory

+ (NSString *) applicationDocumentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

//returns Application document directory path
+ (NSString *) applicationLibraryDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

#pragma mark -
#pragma mark dateFromString

+ (NSDate*) dateFromString:(NSString*)aStr withDateFormat :(NSDateFormatter *)formatter
{
    if([aStr length] > 0)
    {
        [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
        //[dateFormatter setDateFormat:@"YY-MM-dd HH:mm:ss a"];
        [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];//[NSTimeZone localTimeZone]];//
        
        NSLog(@"%@", aStr);
        NSDate   *aDate = [formatter dateFromString:aStr];
        return aDate;
    }
    
    return [NSDate date];
}

#pragma mark -
#pragma mark StringFromDate

+ (NSString *)stringFromDate :(NSDate *)date withDateFormat :(NSDateFormatter *)formatter
{
    NSString *strDate;
    
    strDate = [formatter stringFromDate:date];
    
    return strDate;
}

#pragma mark
#pragma mark - appendStringWithSapce

+ (NSString *) appendStringWithSapce:(NSString*)str1 str2:(NSString *)str2
{
    return [NSString stringWithFormat:@"%@ %@", str1, str2];
}

#pragma mark 
#pragma mark - Show Alert message

+ (void)showAlertWithTitle:(NSString *)title msg:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    
    [alert show];
}

#pragma mark 
#pragma mark - isValidEmail

+ (BOOL) isValidEmail:(NSString *)emailString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailString];
}


#pragma mark -
#pragma mark getAppDelegate

+ (AppDelegate *)getAppDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma mark -
#pragma mark showSubViewAddAnimation

+ (void)showBottomToTopAnimation : (UIView *)view
{
    CGRect frame  = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    
    float y = [[UIScreen mainScreen] bounds].size.height;
    
    view.frame = CGRectMake(0, y, view.frame.size.width, view.frame.size.height);
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         view.frame = frame;
                     }];
}

#pragma mark -
#pragma mark showSubViewRemoveAnimation

+ (void)showTopToBottomAnimation : (UIView *)view
{
    float y = [[UIScreen mainScreen] bounds].size.height;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         view.frame = CGRectMake(0, y, view.frame.size.width, view.frame.size.height);
                     } completion:^(BOOL finished) {
                         [view removeFromSuperview];
                     }];
}

#pragma mark -
#pragma mark getRoundView

+ (void)getRoundView : (UIView *)view andBorderWidth : (int)borderWidth borderColor : (UIColor *)borderColor
{
    view.layer.cornerRadius = view.frame.size.width / 2;
    view.layer.masksToBounds = true;
    if (borderWidth > 0)
    {
        view.layer.borderWidth = borderWidth;
        view.layer.borderColor = borderColor.CGColor;
    }
}

#pragma mark - Color conversion
#pragma mark 

#pragma mark Color from RGB

+ (UIColor *)getColorWithRed : (float)r green : (float)g blue : (float)b andOpacity : (float)opacity
{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:opacity];
}

#pragma mark Color from HEX code

+ (UIColor *) getColorFromHexString:(NSString *)hexString
{
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

#pragma mark -
#pragma mark convertImageFromView

+ (UIImage *)convertImageFromView :(UIView *)view
{
    CGRect rect = [view bounds];
    UIGraphicsBeginImageContextWithOptions(rect.size, true, 1.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark -
#pragma mark getVCWithIdentifier

+ (UIViewController *)getVCWithIdentifier : (NSString *)identifier andStoryBoardName :
(NSString *)storyBoardName
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyBoardName
                                                         bundle:nil];
    
    UIViewController *viewController = (UIViewController *)[storyBoard instantiateViewControllerWithIdentifier:identifier];
    return viewController;
}

#pragma mark -
#pragma mark Increase font size for view

+ (void)setIncreasedFontSizeForView : (UIView *)view
{    
    // If it's a UILabel
    if ([view isKindOfClass:[UILabel class]])
    {
        UILabel *label = (UILabel *)view;
        int fontSize = label.font.pointSize * hRatio;
        [label setFont:[UIFont fontWithName:label.font.fontName size:fontSize]];
    }
    
    // If it's a UITextField
    if ([view isKindOfClass:[UITextField class]])
    {
        UITextField *textField = (UITextField *)view;
        int fontSize = textField.font.pointSize * hRatio;
        [textField setFont:[UIFont fontWithName:textField.font.fontName size:fontSize]];
    }
    
    // If it's a UITextView
    if ([view isKindOfClass:[UITextView class]])
    {
        UITextView *textView = (UITextView *)view;
        int fontSize = textView.font.pointSize * hRatio;
        [textView setFont:[UIFont fontWithName:textView.font.fontName size:fontSize]];
    }
    
    //If it's UIButton
    if ([view isKindOfClass:[UIButton class]])
    {
        UIButton *button = (UIButton *)view;
        int fontSize = button.titleLabel.font.pointSize * hRatio;
        [button.titleLabel setFont:[UIFont fontWithName:button.titleLabel.font.fontName size:fontSize]];
    }
}

#pragma mark -
#pragma mark Resize the View To fit various Screen Size

+ (UIView *)getViewAfterResize : (UIView *)baseView
{
    baseView.frame = CGRectMake(baseView.frame.origin.x * wRatio, baseView.frame.origin.y * hRatio, baseView.frame.size.width * wRatio, baseView.frame.size.height * hRatio);
    
    for (UIView *view in baseView.subviews)
    {
        view.frame = CGRectMake(view.frame.origin.x * wRatio, view.frame.origin.y * hRatio, view.frame.size.width * wRatio, view.frame.size.height * hRatio);
        
        for (UIView *view1 in view.subviews)
        {
            view1.frame = CGRectMake(view1.frame.origin.x * wRatio, view1.frame.origin.y *
                                     hRatio, view1.frame.size.width * wRatio, view1.frame.size.height * hRatio);
            
            for (UIView *view2 in view1.subviews)
            {
                view2.frame = CGRectMake(view2.frame.origin.x * wRatio, view2.frame.origin.y *
                                         hRatio, view2.frame.size.width * wRatio, view2.frame.size.height * hRatio);
            }
            
        }
    }
    
    return baseView;
}

+ (void)transformTableToHorizontal :(UITableView *)tableView andSuperView :(UIView *)superView rowHeight :(int)rowH
{
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.transform = CGAffineTransformMakeRotation(-M_PI * 0.5);
    [tableView setFrame:CGRectMake(0, 0, superView.frame.size.width, superView.frame.size.height)];
    
    tableView.rowHeight = rowH * hRatio;
}

@end
