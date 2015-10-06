//
//  SpecialsViewController.m
//  StansBNApp
//
//  Created by me on 8/23/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "SpecialsViewController.h"

@interface SpecialsViewController ()

@end

@implementation SpecialsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [specialsScroller setScrollEnabled:YES];
    [specialsScroller setContentSize:CGSizeMake(320, 1000)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
