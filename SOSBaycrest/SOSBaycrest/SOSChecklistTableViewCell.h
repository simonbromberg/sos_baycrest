//
//  SOSChecklistTableViewCell.h
//  OSO
//
//  Created by Michael Matan on 2013-11-09.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SOSDetailViewController;
@interface SOSChecklistTableViewCell : UITableViewCell

@property (nonatomic,strong) UIView* mainContentView;
@property (nonatomic,strong) UIView* sideContentView;
@property (nonatomic) bool isSlidOut;
@property (nonatomic,assign) NSInteger rowIndex;

@property (nonatomic,weak) SOSDetailViewController* dvc; //hack

//@property (weak, nonatomic) IBOutlet UIView *conditionIcon;
@property (weak, nonatomic) IBOutlet UIImageView *conditionIcon;


@property (nonatomic,assign) BOOL changeButtonIsActive;
@property (nonatomic,assign) BOOL noChangeButtonIsActive;

@property (nonatomic,assign) BOOL positiveState;
@property (nonatomic,assign) BOOL negativeState;

@property (nonatomic,strong) NSMutableDictionary* checklistEntry;

@property (weak, nonatomic) IBOutlet UILabel *conditionLabel;

@property (weak, nonatomic) IBOutlet UIButton *changeButton;
@property (weak, nonatomic) IBOutlet UIButton *noChangeButton;

@property (weak, nonatomic) IBOutlet UIButton *microphoneButton;

@end
