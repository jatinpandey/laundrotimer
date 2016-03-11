//
//  StartViewController.m
//  Laundrotimer
//
//  Created by Jatin Pandey on 9/7/15.
//  Copyright © 2015 Jatin Pandey. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onStartWasher:(id)sender {
    UILocalNotification * notification = [[UILocalNotification alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger washerMinutes = [defaults integerForKey:@"washerMinutes"];
    NSTimeInterval washerTimeinSecs = washerMinutes;// * 60;
    notification.fireDate = [[NSDate alloc] initWithTimeIntervalSinceNow:washerTimeinSecs];
    notification.alertBody = @"Washer done - Get clothes in dryer";
    notification.soundName = @"0564.aiff";
    notification.userInfo = @{@"component": @"washer"};
    notification.applicationIconBadgeNumber = 1;

    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    NSLog(@"Started timer for washer");
}

- (IBAction)onStartDryer:(id)sender {
    UILocalNotification * notification = [[UILocalNotification alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger dryerMinutes = [defaults integerForKey:@"dryerMinutes"];
    NSTimeInterval dryerTimeinSecs = dryerMinutes;// * 60;

    notification.fireDate = [[NSDate alloc] initWithTimeIntervalSinceNow:dryerTimeinSecs];
    notification.alertBody = @"Dryer done - Pick up laundry";
    notification.soundName = @"0564.aiff";
    notification.userInfo = @{@"component": @"dryer"};
    notification.applicationIconBadgeNumber = 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    NSLog(@"Started timer for dryer");
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
