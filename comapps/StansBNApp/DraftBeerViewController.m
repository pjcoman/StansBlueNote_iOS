//
//  DraftBeerViewController.m
//  StansBNApp
//
//  Created by me on 6/19/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "DraftBeerViewController.h"

@interface DraftBeerViewController ()

@end

@implementation DraftBeerViewController
@synthesize imageView;

int imageIndex = 0;


- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender {
    
    
    NSLog( @"swiped");
    
    NSArray *images=[[NSArray alloc] initWithObjects:
                
                     @"agavewheat.png",
                     @"alaskanamber.jpg",
                     @"anchorsteam.png",
                     @"angryorchardcider.jpg",
                     @"blackcrown.jpg",
                     @"bluemoon.jpg",
                     @"budlight.jpg",
                     @"budselect.jpg",
                     @"budweiser.png",
                     @"carlsberg.jpg",
                     @"coors_batch19.jpg",
                     @"coorslight.png",
                     @"deschutes_chainbreakeripa.jpg",
                     @"dogfish_60minute.jpg",
                     @"dosequis_amber.jpg",
                     @"fat_tire.jpg",
                     @"gooseisland312.jpg",
                     @"gooseislandhonkersale.png",
                     @"guinness.jpg",
                     @"heineken.jpg",
                     @"hoegaarden.jpg",
                     @"killiansstout.png",
                     @"kronenbourg_1664.png",
                     @"magichat9.png",
                     @"millerlite.png",
                     @"modeloespecial.jpg",
                     @"murphysred.jpg",
                     @"pacifico.jpg",
                     @"paulanerhefv.png",
                     @"pbr.png",
                     @"racer5.jpg",
                     @"samadams.png",
                     @"samadamsseasonal.png",
                     @"sierranevadapaleale.jpg",
                     @"spaten.png",
                     @"spatenoktoberfest.png",
                     @"stella.png",
                     @"stone_ipa.jpg",
                     @"summershandy.jpg",
                     @"trumerpils.png",
                     @"woodchuck_cider.png", nil];
    
    
    UISwipeGestureRecognizerDirection direction =
    [(UISwipeGestureRecognizer *) sender direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            imageIndex++;
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
            imageIndex--;
            break;
        default:
            break;
    }
    imageIndex = (imageIndex < 0) ? ([images count] -1):
    imageIndex % [images count];
    imageView.image = [UIImage imageNamed:[images objectAtIndex:imageIndex]];










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
