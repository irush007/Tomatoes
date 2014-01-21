//
//  MovieDetailCell.h
//  Tomatoes
//
//  Created by Hua Wu on 1/21/14.
//  Copyright (c) 2014 zynga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *summaryContentLabel;
@property (nonatomic, weak) IBOutlet UILabel *castLabel;
@property (nonatomic, weak) IBOutlet UIImageView *picArea;

@end
