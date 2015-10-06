//
//  DraftBeerViewController.h
//  StansBNApp
//
//  Created by me on 6/19/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DraftBeerViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender;

@end
