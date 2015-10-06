//
//  AppDelegate.h
//  StansBNApp
//
//  Created by me on 6/10/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSMutableArray *beerlistArray;
@property (nonatomic, retain) NSMutableArray *specialsArray;
@property (nonatomic, retain) NSMutableArray *menuArray;
@property (nonatomic, retain) NSMutableArray *cocktailsArray;


@end
