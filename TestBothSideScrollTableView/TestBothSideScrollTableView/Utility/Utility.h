//
//  Utility.h

//Class created by XCoder001 on 23rd January,2015 at AMS Technologies....... :)
//
#import "AppDelegate.h"
#import "Constants.h"

@interface Utility : NSObject

+ (NSUserDefaults *)getUserDefault;

+ (void)syncUserDefault : (NSUserDefaults *)userDefaults;

+ (NSString *) applicationDocumentsDirectory;
+ (NSString *) applicationLibraryDirectory;

+ (NSString *)getDeviceID;

+ (NSDate*) dateFromString:(NSString*)aStr withDateFormat :(NSDateFormatter *)formatter;
+ (NSString *)stringFromDate :(NSDate *)date withDateFormat :(NSDateFormatter *)formatter;

+ (NSString *) appendStringWithSapce:(NSString*)str1 str2:(NSString *)str2;

+ (void)showAlertWithTitle:(NSString *)title msg:(NSString *)msg;

+ (BOOL) isValidEmail:(NSString *)emailString;

+ (AppDelegate *)getAppDelegate;

+ (void)showBottomToTopAnimation : (UIView *)view;
+ (void)showTopToBottomAnimation : (UIView *)view;

+ (void)getRoundView : (UIView *)view andBorderWidth : (int)borderWidth borderColor : (UIColor *)borderColor;

+ (UIColor *)getColorWithRed : (float)r green : (float)g blue : (float)b andOpacity : (float)opacity;

+ (UIColor *) getColorFromHexString:(NSString *)hexString;

+ (UIImage *)convertImageFromView :(UIView *)view;

+ (UIView *)getViewAfterResize : (UIView *)baseView;

+ (UIViewController *)getVCWithIdentifier : (NSString *)identifier andStoryBoardName :
(NSString *)storyBoardName;

+ (void)setIncreasedFontSizeForView : (UIView *)view;
+ (void)transformTableToHorizontal :(UITableView *)tableView andSuperView :(UIView *)superView rowHeight :(int)rowH;

@end
