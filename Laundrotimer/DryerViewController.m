//
//  DryerViewController.m
//  Laundrotimer
//
//  Created by Jatin Pandey on 9/7/15.
//  Copyright © 2015 Jatin Pandey. All rights reserved.
//

#import "DryerViewController.h"

@interface DryerViewController ()

@end

@implementation DryerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dryerPickerView.delegate = self;
    self.dryerPickerView.dataSource = self;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger presetVal = [defaults integerForKey:@"dryerMinutes"];
    if (presetVal == 0) {
        NSLog(@"Could not find Dryer timer");
    } else {
        NSLog(@"Found Dryer timer at: %ld minutes", presetVal);
    }
}

- (void)viewDidAppear:(BOOL)animated {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSInteger minValue = [defaults integerForKey:@"dryerMinutes"];
    [self.dryerPickerView selectRow:minValue inComponent:0 animated:YES];
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

- (IBAction)setDryerCycle:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger minutesValue = [self.dryerPickerView selectedRowInComponent:0];
    NSLog(@"Setting new preference: Dryer timer to: %ld minutes", minutesValue);
    [defaults setInteger:minutesValue forKey:@"dryerMinutes"];
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
