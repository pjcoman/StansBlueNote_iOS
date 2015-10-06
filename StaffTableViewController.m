//
//  StaffTableViewController.m
//  StansBNApp
//
//  Created by me on 2/7/15.
//  Copyright (c) 2015 me. All rights reserved.
//

#import "StaffTableViewController.h"
#import "StaffCell.h"
#import "Reachability.h"


@interface StaffTableViewController ()

@end



@implementation StaffTableViewController
@synthesize staffTableView;



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
    
    self.staffTableView.backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"stansbackground600_600.jpg"]];
    
}

- (void) retrieveFromParse {
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable)  {
        
        NSLog(@"No Internet.");
        
        PFQuery *retrieveStaffData = [PFQuery queryWithClassName:@"stansstaff"];
        [retrieveStaffData fromLocalDatastore];
        
        
        
        
        
        
        
        
        [retrieveStaffData orderByAscending:@"name"];
        
        
        [retrieveStaffData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            //       NSLog(@"%@",objects);
            
            if (!error)  {
                staffDataArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [staffTableView reloadData];
        }];
        

        
        
        
    } else {
        
        NSLog(@"Internet is up.");
        
        PFQuery *retrieveStaffData = [PFQuery queryWithClassName:@"stansstaff"];
        
        NSArray *staffObjects = [retrieveStaffData findObjects];
        [PFObject pinAllInBackground:staffObjects];
        
        
        
        
        
        
        
        
        
        
        
        
        
        [retrieveStaffData orderByAscending:@"names"];
        
        
        [retrieveStaffData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            //       NSLog(@"%@",objects);
            
            if (!error)  {
                staffDataArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [staffTableView reloadData];
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
    return staffDataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    StaffCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[StaffCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    PFObject *tempObject = [staffDataArray objectAtIndex:indexPath.row];
    
    
    cell.name.text = [tempObject objectForKey:@"name"];
    cell.other.text = [tempObject objectForKey:@"other"];
    
    
    PFFile *image = [tempObject objectForKey:@"image"];
    NSData *imagedata = [image getData];
    UIImage *staffimage = [UIImage imageWithData:imagedata];
    
    UIGraphicsBeginImageContext(CGSizeMake(100,100));
    [staffimage drawInRect: CGRectMake(0,0,100,100)];
    UIImage *loadimage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    cell.imageView.image = loadimage;
    
    CALayer *layer = [cell.imageView layer];
    [layer setCornerRadius:10.0];
    [layer setBorderWidth:2.0];
    [layer setBorderColor:[[UIColor blueColor] CGColor]];
    
    layer.masksToBounds = YES;

    
    
    
    
    return cell;
}


- (void)dealloc {
    
    [staffTableView release];
    [super dealloc];
}
@end
