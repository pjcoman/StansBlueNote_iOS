//
//  TableViewController.m
//  StansBNApp
//
//  Created by me on 3/1/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "TableViewController.h"
#import "CustomCell.h"
#import "Reachability.h"

@interface TableViewController ()





@end

@implementation TableViewController
@synthesize beerTableView;

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
    
    
    
    

   
}

- (void) retrieveFromParse {
    
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable)  {
        
        NSLog(@"No Internet.");
        
        PFQuery *retrieveBeerData = [PFQuery queryWithClassName:@"stansbeers"];
        [retrieveBeerData fromLocalDatastore];
        
        
        
        
        
        
        
        
        [retrieveBeerData orderByAscending:@"name"];
        
        
        [retrieveBeerData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            //       NSLog(@"%@",objects);
            
            if (!error)  {
                beerDataArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [beerTableView reloadData];
        }];
        
        
        
        
        
    } else {
        
        NSLog(@"Internet is up.");
        
        PFQuery *retrieveBeerData = [PFQuery queryWithClassName:@"stansbeers"];
        
        NSArray *BeerObjects = [retrieveBeerData findObjects];
        [PFObject pinAllInBackground:BeerObjects];
        
        
        
        
        
        
        
        
        
        
        
        
        
        [retrieveBeerData orderByAscending:@"name"];
        
        
        [retrieveBeerData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            //       NSLog(@"%@",objects);
            
            if (!error)  {
                beerDataArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [beerTableView reloadData];
        }];
        
    }

    
 /*   PFQuery *retrieveBeerData = [PFQuery queryWithClassName:@"stansbeers"];
    [retrieveBeerData orderByAscending:@"name"];
    
    
    
    
    [retrieveBeerData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSLog(@"%@",objects);
        
        
        if (!error)  {
            beerDataArray = [[NSArray alloc] initWithArray:objects];
        }
    
        [myTableView reloadData];
    }];
  
  */
    
    
        
    
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
    return beerDataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                        

    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    PFObject *tempObject = [beerDataArray objectAtIndex:indexPath.row];
    
    
    cell.beername.text = [tempObject objectForKey:@"name"];
    cell.beerwherefrom.text = [tempObject objectForKey:@"wherefrom"];
    cell.beertype.text = [tempObject objectForKey:@"type"];
    cell.beerabv.text = [tempObject objectForKey:@"abv"];
    
    PFFile *image = [tempObject objectForKey:@"image"];
    NSData *imagedata = [image getData];
    UIImage *beerimage = [UIImage imageWithData:imagedata];
    
    UIGraphicsBeginImageContext(CGSizeMake(100,100));
    [beerimage drawInRect: CGRectMake(0,0,100,100)];
    UIImage *loadimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
    cell.imageView.image = loadimage;
    
    
    return cell;
}
- (IBAction)sortByType:(id)sender {
    
    PFQuery *retrieveBeerData = [PFQuery queryWithClassName:@"stansbeers"];
    [retrieveBeerData orderByAscending:@"type"];
    
    
    
    
    [retrieveBeerData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSLog(@"%@",objects);
        
        
        if (!error)  {
            beerDataArray = [[NSArray alloc] initWithArray:objects];
        }
        
        [beerTableView reloadData];
    }];
}


- (IBAction)sortByName:(id)sender {
    
    PFQuery *retrieveBeerData = [PFQuery queryWithClassName:@"stansbeers"];
    [retrieveBeerData orderByAscending:@"name"];
    
    
    
    
    [retrieveBeerData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSLog(@"%@",objects);
        
        
        if (!error)  {
            beerDataArray = [[NSArray alloc] initWithArray:objects];
        }
        
        [beerTableView reloadData];
    }];

}

- (IBAction)sortByCountry:(id)sender {
    
    PFQuery *retrieveBeerData = [PFQuery queryWithClassName:@"stansbeers"];
    [retrieveBeerData orderByAscending:@"wherefrom"];
    
    
    
    
    [retrieveBeerData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSLog(@"%@",objects);
        
        
        if (!error)  {
            beerDataArray = [[NSArray alloc] initWithArray:objects];
        }
        
        [beerTableView reloadData];
    }];

}


- (IBAction)sortByABV:(id)sender {
    
    PFQuery *retrieveBeerData = [PFQuery queryWithClassName:@"stansbeers"];
    [retrieveBeerData orderByDescending:@"abv"];
    
    
    
    
    [retrieveBeerData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSLog(@"%@",objects);
        
        
        if (!error)  {
            beerDataArray = [[NSArray alloc] initWithArray:objects];
        }
        
        [beerTableView reloadData];
    }];

}


- (void)dealloc {
    [beerTableView release];
    [_sortByTypeButton release];
    [_sortByTypeButton release];
    [_sortByTypeButton release];
    [_sortByNameButton release];
    [_sortByCountryButton release];
    [_sortByABVButton release];
    [super dealloc];
}
@end
