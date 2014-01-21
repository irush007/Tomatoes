//
//  MovieCell.h
//  Tomatoes
//
//  Created by Hua Wu on 1/20/14.
//  Copyright (c) 2014 zynga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *synopsisLabel;
@property (nonatomic, weak) IBOutlet UILabel *castLabel;
@property (nonatomic, weak) IBOutlet UIImageView *posterArea;

@end
