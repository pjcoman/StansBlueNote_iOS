//
//  StaffTableViewController.h
//  StansBNApp
//
//  Created by me on 2/7/15.
//  Copyright (c) 2015 me. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>
#import "StaffCell.h"

@interface StaffTableViewController : UITableViewController<UITableViewDelegate>  {
    
    NSArray *staffDataArray;
}

@property (retain, nonatomic) IBOutlet UITableView *staffTableView;


@end
