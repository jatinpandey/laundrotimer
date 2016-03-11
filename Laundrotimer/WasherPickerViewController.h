//
//  WasherPickerViewController.h
//  Laundrotimer
//
//  Created by Jatin Pandey on 9/6/15.
//  Copyright © 2015 Jatin Pandey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WasherPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *washerPickerView;
@property (strong, nonatomic) IBOutlet UILabel *minuteLabel;

@end
