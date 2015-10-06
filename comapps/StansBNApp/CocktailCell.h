//
//  CocktailCell.h
//  StansBNApp
//
//  Created by me on 3/13/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CocktailCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *name;

@property (retain, nonatomic) IBOutlet UILabel *ingredients;
@property (retain, nonatomic) IBOutlet UILabel *price;


@property (retain, nonatomic) IBOutlet UIImageView *cocktailimage;

@end