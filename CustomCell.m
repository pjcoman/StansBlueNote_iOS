//
//  CustomCell.m
//  StansBNApp
//
//  Created by me on 3/1/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize beerimage;

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
    [_beername release];
    [_beerwherefrom release];
    [_beerabv release];
    [_beertype release];
    [beerimage release];
    

    [super dealloc];
}
@end
