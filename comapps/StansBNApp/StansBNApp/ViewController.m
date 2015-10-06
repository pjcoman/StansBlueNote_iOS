//
//  ViewController.m
//  StansBNApp
//
//  Created by me on 6/10/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)stansGmaps:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://maps.google.com/maps?q=Stan's+Blue+Note,+2908+Greenville+Avenue,+Dallas,+TX&hl=en&sll=32.820665,-96.731542&sspn=0.805539,1.546326&oq=sta&hq=Stan's+Blue+Note,+2908+Greenville+Avenue,+Dallas,+TX&t=m&z=15"];
    [[UIApplication sharedApplication] openURL:url];
}



 
-(IBAction)emailStans:(id)sender  {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:stansbluenote@gmail.com"]]];
}







- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter setDateFormat:@"HH"];
    
    NSDateFormatter *dateFormatter2 = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter2 setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter2 setDateFormat:@"mm"];
    
    NSString *hoursString = [dateFormatter stringFromDate:date];
    NSString *minutesString = [dateFormatter2 stringFromDate:date];
    
    NSLog(@"hours = %@", hoursString);
    NSLog(@"minutes = %@", minutesString);
    
    NSInteger hours = [hoursString intValue];
    NSInteger minutes = [minutesString intValue];
    
    NSInteger lastCallHours = 25 - hours;
    NSInteger lastCallMinutes = 60 - minutes;
    
    if (lastCallHours > 23) {lastCallHours = 1 - hours;}
    
    if ((lastCallHours >= 15) && (lastCallHours <= 23))  {
        
        
        self.timeleftonscreen.text = @"Go home.";
        
    }
    else                               {
        
        
        
        NSString *timeleftonmainscreen = [NSString stringWithFormat: @"%ld hrs and %ld min till last call", (long)lastCallHours, (long)lastCallMinutes];
        
        self.timeleftonscreen.text = timeleftonmainscreen;
        
        
        
        
    }
    
    

    
    
    
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(IBAction)MakePhoneCall:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt:2148271977"]];
}

-(IBAction)CallCab:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt:2144266262"]];
}







- (void)dealloc {
    
    [super dealloc];
}
@end
