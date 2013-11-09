//
//  SOSDetailViewController.h
//  SOSBaycrest
//
//  Created by Simon Bromberg on 11/9/2013.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SOSAppDelegate.h"
#import "SOSChecklistTableViewCell.h"

@interface SOSDetailViewController : UITableViewController

@end

@interface ConditionCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel* titleLabel;
@property (nonatomic,weak) IBOutlet UIImageView* leftImage;
@property (nonatomic,weak) IBOutlet UIButton* yesButton;
@property (nonatomic,weak) IBOutlet UIButton* noButton;



@end