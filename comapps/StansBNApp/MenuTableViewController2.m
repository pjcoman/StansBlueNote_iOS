//
//  MenuTableViewController2.m
//  StansBNApp
//
//  Created by me on 3/14/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "MenuTableViewController2.h"
#import "MenuCell.h"


@interface MenuTableViewController2 ()

@end



@implementation MenuTableViewController2
@synthesize menuTableView2;



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
    
    PFQuery *retrieveMenu = [PFQuery queryWithClassName:@"stansmenu"];
    [retrieveMenu orderByAscending:@"type"];
    
    
    
    
    [retrieveMenu findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSLog(@"%@",objects);
        
        if (!error)  {
            menuDataArray2 = [[NSArray alloc] initWithArray:objects];
        }
        
        [menuTableView2 reloadData];
    }];
    
    
    
    
    
    
    
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
    return menuDataArray2.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    // Configure the cell...
    
    
    
    if (cell == nil) {
        cell = [[MenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];}
    PFObject *tempObject = [menuDataArray2 objectAtIndex:indexPath.row];
    cell.item.text = [tempObject objectForKey:@"item"];
    cell.price.text = [tempObject objectForKey:@"price"];
    return cell;
    
    
    
}





- (void)dealloc {
    
    [menuTableView2 release];
    [super dealloc];
}
@end
