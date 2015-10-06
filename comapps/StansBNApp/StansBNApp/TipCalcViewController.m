//
//  TipCalcViewController.m
//  TipCalculator
//
//  Created by me on 6/12/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "TipCalcViewController.h"



@interface TipCalcViewController ()

@end

@implementation TipCalcViewController

@synthesize tipAmount;
@synthesize totalToPay;
@synthesize totalPerPerson;





- (NSInteger)numberOfComponentsInPickerView :(UIPickerView *)thePickerView {
    
    // This method needs to be used. It asks how many columns will be used in the UIPickerView
	return 2;
    
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == TIP)
        return [tipArray count];
    
    if (component == PEOPLE)
        return [numberOfPeopleArray count];
    
    return 0;
    
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == TIP)
        return [tipArray objectAtIndex:row];
    
    if (component == PEOPLE)
        return [numberOfPeopleArray objectAtIndex:row];
    
    return 0;
    
    
    
    
}



- (void)viewDidLoad { // When the view loads, run this action.
	[super viewDidLoad]; // This NEEDS to be here or the application will not work!
	
    billTotal.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
	
	tipArray = [[NSMutableArray alloc] init]; // This will allocate tableViewArray.
	for(int i = 1; i <= 100; i ++) { // Set 'i' to every number from 1 and 20.
		NSString *myString = [NSString stringWithFormat:@"%d%%", i]; // Create a new string that will display the number 'i' followed by a percent sign.
		[tipArray addObject:myString]; // Add the string to the tableViewArray.
	}
    
    numberOfPeopleArray = [[NSMutableArray alloc] init]; // This will allocate tableViewArray.
	for(int i = 1; i <= 10; i ++) { // Set 'i' to every number from 1 and 20.
		NSString *myString = [NSString stringWithFormat:@"%i", i]; // Create a new string that will display the number 'i' followed by a percent sign.
		[numberOfPeopleArray addObject:myString]; // Add the string to the tableViewArray.
	}
    
    [tipAndPeoplePicker selectRow:14 inComponent:0 animated:YES];
    
    
}














- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    
    
    
    
    NSString *tipSelected;
    NSString *numberOfPeopleSelected;
    NSString *billTotalString = [billTotal text];
    
    
    tipSelected = [tipArray objectAtIndex:[pickerView selectedRowInComponent:0]];
    
    numberOfPeopleSelected = [numberOfPeopleArray objectAtIndex:[pickerView selectedRowInComponent:1]];
    
    float numberOfPeopleFloat = [numberOfPeopleSelected floatValue];
    float percentage = [tipSelected floatValue];
    float billTotalFloat = [billTotalString floatValue];
    
    
    
    
    float tip = ((billTotalFloat * percentage) / 100);
    
    float totalToPayFloat = (billTotalFloat + tip);
    float tipPerPerson = (totalToPayFloat / numberOfPeopleFloat  );
    
    tipAmount.text = [NSString stringWithFormat:@"$ %.02f", tip];
    totalToPay.text = [NSString stringWithFormat:@"$ %.02f", totalToPayFloat];
    totalPerPerson.text = [NSString stringWithFormat:@"$ %.02f", tipPerPerson];
    
    //  tipAmount.hidden = !tipAmount.hidden;
    //  totalToPay.hidden = !totalToPay.hidden;
    //  totalPerPerson.hidden = !totalPerPerson.hidden;
    
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [totalToPay release];
    [totalPerPerson release];
    [tipAmount release];
    
    [billTotal release];
    [billTotal release];
    [super dealloc];
}
- (IBAction)textFieldDidEndEditing:(id)sender {
    [sender resignFirstResponder];
}
@end
