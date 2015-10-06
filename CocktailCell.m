//
//  CocktailCell.m
//  StansBNApp
//
//  Created by me on 3/13/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "CocktailCell.h"

@implementation CocktailCell
@synthesize cocktailimage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
       
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    
    

    // Configure the view for the selected state
}

- (void)dealloc {
    [cocktailimage release];
    [_name release];
    [_ingredients release];
    [_price release];
    [super dealloc];
}
@end
