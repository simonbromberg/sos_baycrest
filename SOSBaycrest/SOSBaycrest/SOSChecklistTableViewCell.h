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


@end
