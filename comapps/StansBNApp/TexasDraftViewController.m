//
//  TexasDraftViewController.m
//  StansBNApp
//
//  Created by me on 7/19/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "TexasDraftViewController.h"

@interface TexasDraftViewController ()

@end

@implementation TexasDraftViewController
@synthesize imageView;

int imageIndex1 = 1;


- (IBAction)handleSwipe:(id)sender {
    
    
    NSLog( @"swiped");
    
    NSArray *images=[[NSArray alloc] initWithObjects:
                     
                     
                     @"dallasblonde.jpg",
                     @"firemans4.jpg",
                     @"franconia_lager.png",
                     @"lonestar.png",
                     @"rahrsummertimewheat.png",
                     @"realale4squared.png",
                     @"shinerbock.jpg",
                     @"strnold_lawnmower.jpg",
                     @"starnoldssummerpils.jpg",
                     @"velvethammer.jpg",
                     @"ziegenbock_amber.jpg", nil];
    
    
    UISwipeGestureRecognizerDirection direction =
    [(UISwipeGestureRecognizer *) sender direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            imageIndex1++;
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
            imageIndex1--;
            break;
        default:
            break;
    }
    imageIndex1 = (imageIndex1 < 0) ? ([images count] -1):
    imageIndex1 % [images count];
    imageView.image = [UIImage imageNamed:[images objectAtIndex:imageIndex1]];
    
    
    
    
    
    
    
    
    
    
}






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
    
    UIAlertView *swipe = [[UIAlertView alloc]
                          initWithTitle:@"Instructions"
                          message:@"Swipe to see selections."
                          delegate:nil
                          cancelButtonTitle:@"Okay"
                          otherButtonTitles:nil];
    
    [swipe show];
    [swipe release];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [imageView release];
    [super dealloc];
}


@end
