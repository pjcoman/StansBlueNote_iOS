//
//  StaffCell.m
//  StansBNApp
//
//  Created by me on 2/7/15.
//  Copyright (c) 2015 me. All rights reserved.
//

#import "StaffCell.h"

@implementation StaffCell


@synthesize image;

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
    [image release];
    [_name release];
    [_other release];
    [super dealloc];

}

@end

