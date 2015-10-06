//
//  SpecialsTableViewController.m
//  StansBNApp
//
//  Created by me on 3/3/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "SpecialsTableViewController.h"
#import "SpecialsCell.h"
#import "Reachability.h"


@interface SpecialsTableViewController ()

@end



@implementation SpecialsTableViewController
@synthesize specialsTableView;



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
    
    self.specialsTableView.backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"stansbackground600_600.jpg"]];
}

- (void) retrieveFromParse {
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable)  {
        
        NSLog(@"No Internet.");
        
        PFQuery *retrieveSpecialsData = [PFQuery queryWithClassName:@"specials"];
        [retrieveSpecialsData fromLocalDatastore];
        
        
        
        
        
        
        
        
        [retrieveSpecialsData orderByAscending:@"x"];
        
        
        [retrieveSpecialsData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            //       NSLog(@"%@",objects);
            
            if (!error)  {
                specialsDataArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [specialsTableView reloadData];
        }];
        
        
        
        
        
    } else {
        
        NSLog(@"Internet is up.");
        
        PFQuery *retrieveSpecialsData = [PFQuery queryWithClassName:@"specials"];
        
        NSArray *specialsObjects = [retrieveSpecialsData findObjects];
        [PFObject pinAllInBackground:specialsObjects];
        
        
        
        
        
        
        
        
        
        
        
        
        
        [retrieveSpecialsData orderByAscending:@"x"];
        
        
        [retrieveSpecialsData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            //       NSLog(@"%@",objects);
            
            if (!error)  {
                specialsDataArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [specialsTableView reloadData];
        }];
        
    }
       
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return specialsDataArray.count;
    
    NSLog(@"specials count = %lu", (unsigned long)specialsDataArray.count);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SpecialsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[SpecialsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    PFObject *tempObject = [specialsDataArray objectAtIndex:indexPath.row];
    
    
    cell.day.text = [tempObject objectForKey:@"dayofweek"];
    cell.special.text = [tempObject objectForKey:@"data"];
    
    
        
    return cell;
}


- (void)dealloc {
    [specialsTableView release];
    [super dealloc];
}
@end
