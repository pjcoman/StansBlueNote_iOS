//
//  TipCalcViewController.h
//  TipCalculator
//
//  Created by me on 6/12/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TIP 0
#define PEOPLE 1

@interface TipCalcViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>


{
    
    
    IBOutlet UITextField *billTotal;
  
    IBOutlet UIPickerView * tipAndPeoplePicker;
    
    NSMutableArray * tipArray;
    
    
    NSMutableArray * numberOfPeopleArray;
    
}
- (IBAction)textFieldDidEndEditing:(id)sender;

@property (strong,nonatomic) IBOutlet UILabel *tipAmount;
@property (strong, nonatomic) IBOutlet UILabel *totalToPay;
@property (strong, nonatomic) IBOutlet UILabel *totalPerPerson;







@end