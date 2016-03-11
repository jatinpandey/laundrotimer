//
//  DryerViewController.h
//  Laundrotimer
//
//  Created by Jatin Pandey on 9/7/15.
//  Copyright © 2015 Jatin Pandey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DryerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *dryerPickerView;

@end
