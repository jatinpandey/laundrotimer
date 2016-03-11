//
//  WasherPickerViewController.m
//  Laundrotimer
//
//  Created by Jatin Pandey on 9/6/15.
//  Copyright © 2015 Jatin Pandey. All rights reserved.
//

#import "WasherPickerViewController.h"

@interface WasherPickerViewController ()

@end

@implementation WasherPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.washerPickerView.delegate = self;
    self.washerPickerView.dataSource = self;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     NSInteger presetVal = [defaults integerForKey:@"washerMinutes"];
    if (presetVal == 0) {
        NSLog(@"Could not find Washer timer");
    } else {
        NSLog(@"Found Washer timer at: %ld minutes", presetVal);
    }
}

- (void)viewDidAppear:(BOOL)animated {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSInteger minValue = [defaults integerForKey:@"washerMinutes"];
    [self.washerPickerView selectRow:minValue inComponent:0 animated:YES];
    self.minuteLabel.text = [NSString stringWithFormat:@"%ld", minValue];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.minuteLabel.text = [NSString stringWithFormat:@"%ld", row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 120;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%ld", row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    NSLog(@"%f", self.view.bounds.size.width / 2);
    return self.view.bounds.size.width / 2;
}

- (IBAction)setWasherCycle:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger minutesValue = [self.washerPickerView selectedRowInComponent:0];
    NSLog(@"Setting new preference: Washer timer to: %ld minutes", minutesValue);
    [defaults setInteger:minutesValue forKey:@"washerMinutes"];
    [defaults synchronize];
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
