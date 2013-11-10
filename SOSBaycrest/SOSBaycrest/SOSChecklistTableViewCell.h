//
//  SOSChecklistTableViewCell.h
//  OSO
//
//  Created by Michael Matan on 2013-11-09.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOSChecklistTableViewCell : UITableViewCell

@property (nonatomic,strong) UIView* mainContentView;
@property (nonatomic,strong) UIView* sideContentView;
@property (nonatomic) bool isSlidOut;

//@property (weak, nonatomic) IBOutlet UIView *conditionIcon;
@property (weak, nonatomic) IBOutlet UIImageView *conditionIcon;

@property (nonatomic,assign) BOOL condition;
@property (nonatomic,assign) BOOL positiveState;
@property (nonatomic,assign) BOOL negativeState;

@property (weak, nonatomic) IBOutlet UILabel *conditionLabel;
@property (weak, nonatomic) IBOutlet UIButton *conditionPositiveButton;
@property (weak, nonatomic) IBOutlet UIButton *conditionNegativeButton;
@property (weak, nonatomic) IBOutlet UIButton *microphoneButton;

@end
