//
//  AppetizersViewController.m
//  StansBNApp
//
//  Created by me on 8/23/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "AppetizersViewController.h"

@interface AppetizersViewController ()

@end

@implementation AppetizersViewController

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
    
    [appetizersScroller setScrollEnabled:YES];
    [appetizersScroller setContentSize:CGSizeMake(320, 800)];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
