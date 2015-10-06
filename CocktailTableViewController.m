//
//  CocktailTableViewController.m
//  StansBNApp
//
//  Created by me on 3/13/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "CocktailTableViewController.h"
#import "CocktailCell.h"
#import "Reachability.h"







@interface CocktailTableViewController ()

@end



@implementation CocktailTableViewController
@synthesize cocktailTableView;




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
    
    self.cocktailTableView.backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"stansbackground600_600.jpg"]];
}

- (void) retrieveFromParse {
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable)  {
        
        NSLog(@"No Internet.");
        
        PFQuery *retrieveCocktailData = [PFQuery queryWithClassName:@"stanscocktails"];
        [retrieveCocktailData fromLocalDatastore];
        
        
        
        
        
        
        
        
        [retrieveCocktailData orderByAscending:@"name"];
        
        
        [retrieveCocktailData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            //       NSLog(@"%@",objects);
            
            if (!error)  {
                cocktailDataArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [cocktailTableView reloadData];
        }];
        
        
        
        
        
    } else {
        
        NSLog(@"Internet is up.");
        
        PFQuery *retrieveCocktailData = [PFQuery queryWithClassName:@"stanscocktails"];
        
        NSArray *cocktailObjects = [retrieveCocktailData findObjects];
        [PFObject pinAllInBackground:cocktailObjects];
        
        
        
        
        
        
        
        
        
        
        
        
        
        [retrieveCocktailData orderByAscending:@"names"];
        
        
        [retrieveCocktailData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            //       NSLog(@"%@",objects);
            
            if (!error)  {
                cocktailDataArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [cocktailTableView reloadData];
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
    return cocktailDataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CocktailCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[CocktailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    PFObject *tempObject = [cocktailDataArray objectAtIndex:indexPath.row];
    
    
    cell.name.text = [tempObject objectForKey:@"name"];
    cell.ingredients.text = [tempObject objectForKey:@"ingredients"];
    cell.price.text = [tempObject objectForKey:@"price"];
    
    PFFile *image = [tempObject objectForKey:@"image"];
    NSData *imagedata = [image getData];
    UIImage *cocktailimage = [UIImage imageWithData:imagedata];
    
    UIGraphicsBeginImageContext(CGSizeMake(100,100));
    [cocktailimage drawInRect: CGRectMake(0,0,100,100)];
    
   
    
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
    
    [cocktailTableView release];
    [super dealloc];
}
@end
