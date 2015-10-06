//
//  TableViewController.h
//  StansBNApp
//
//  Created by me on 3/1/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CustomCell.h"

@interface TableViewController : UITableViewController<UITableViewDelegate>  {
    
    
    
    NSArray *beerDataArray;
    NSArray *beerDataArrayByType;
}
@property (retain, nonatomic) IBOutlet UITableView *beerTableView;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *sortByNameButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *sortByTypeButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *sortByCountryButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *sortByABVButton;


@end
