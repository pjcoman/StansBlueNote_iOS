//
//  SpecialsTableViewController.h
//  StansBNApp
//
//  Created by me on 3/3/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SpecialsCell.h"

@interface SpecialsTableViewController : UITableViewController<UITableViewDelegate>  {
    
    NSArray *specialsDataArray;
}
@property (retain, nonatomic) IBOutlet UITableView *specialsTableView;

@end
