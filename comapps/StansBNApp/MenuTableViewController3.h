//
//  MenuTableViewController3.h
//  StansBNApp
//
//  Created by me on 3/14/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MenuCell.h"

@interface MenuTableViewController : UITableViewController<UITableViewDelegate>  {
    
    NSArray *menuDataArray3;
    
}

@property (retain, nonatomic) IBOutlet UITableView *menuTableView3;


@end