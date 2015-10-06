//
//  CocktailTableViewController.h
//  StansBNApp
//
//  Created by me on 3/13/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CocktailCell.h"

@interface CocktailTableViewController : UITableViewController<UITableViewDelegate>  {
    
    NSArray *cocktailDataArray;
}

@property (retain, nonatomic) IBOutlet UITableView *cocktailTableView;


@end
