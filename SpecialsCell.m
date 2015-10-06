//
//  SpecialsCell.m
//  StansBNApp
//
//  Created by me on 3/3/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "SpecialsCell.h"

@implementation SpecialsCell

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
    [_day release];
    [_special release];
    [super dealloc];
}
@end
