//
//  SOSSummaryTableViewCell.h
//  SOSBaycrest
//
//  Created by Michael Matan on 2013-11-10.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SOSSummaryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (strong, nonatomic) NSURL* audioNote;
@property (nonatomic, strong) AVAudioPlayer* player;
@property (weak, nonatomic) IBOutlet UIButton *playAudioNoteButton;

@end
