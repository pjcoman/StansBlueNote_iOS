//
//  MenuTableViewController.m
//  StansBNApp
//
//  Created by me on 3/13/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuCell.h" 
#import "Reachability.h"


@interface MenuTableViewController ()

@end



@implementation MenuTableViewController
@synthesize menuTableView;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self performSelector:@selector(retrieveFromParse)];
    
    self.menuTableView.backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"stansbackground600_600.jpg"]];
}

- (void) retrieveFromParse {
    
  /*  PFQuery *retrieveMenu = [PFQuery queryWithClassName:@"stansmenu"];
    [retrieveMenu orderByAscending:@"type"];
 
    
    
    
    [retrieveMenu findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSLog(@"%@",objects);
        
        if (!error)  {
            menuDataArray = [[NSArray alloc] initWithArray:objects];
        }
        
        [menuTableView reloadData];
    }];
   
   */
    
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable)  {
        
        NSLog(@"No Internet.");
        
        PFQuery *retrieveMenuData = [PFQuery queryWithClassName:@"stansmenu"];
        [retrieveMenuData fromLocalDatastore];
        
        
        
        
        
        
        
        
        [retrieveMenuData orderByAscending:@"type"];
        
        
        [retrieveMenuData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            //       NSLog(@"%@",objects);
            
            if (!error)  {
                menuDataArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [menuTableView reloadData];
        }];
        
        
        
        
        
    } else {
        
        NSLog(@"Internet is up.");
        
        PFQuery *retrieveMenuData = [PFQuery queryWithClassName:@"stansmenu"];
        
        NSArray *menuObjects = [retrieveMenuData findObjects];
        [PFObject pinAllInBackground:menuObjects];
        
        
        
        
        
        
        
        
        
        
        
        
        
        [retrieveMenuData orderByAscending:@"type"];
        
        
        [retrieveMenuData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            //       NSLog(@"%@",objects);
            
            if (!error)  {
                menuDataArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [menuTableView reloadData];
        }];
        
    }

    
 
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return menuDataArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    // Configure the cell...
    
 
    
            if (cell == nil) {
                    cell = [[MenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];}
                    PFObject *tempObject = [menuDataArray objectAtIndex:indexPath.row];
                    cell.item.text = [tempObject objectForKey:@"item"];
                    cell.price.text = [tempObject objectForKey:@"price"];
    return cell;
    
    
    
}





- (void)dealloc {
    
    [menuTableView release];
    [super dealloc];
}
@end
