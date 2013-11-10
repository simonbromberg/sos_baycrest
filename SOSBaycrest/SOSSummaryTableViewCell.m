//
//  SOSSummaryTableViewCell.m
//  SOSBaycrest
//
//  Created by Michael Matan on 2013-11-10.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import "SOSSummaryTableViewCell.h"

@implementation SOSSummaryTableViewCell

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
- (IBAction)playAudioNote:(id)sender {
    if ([self audioNote]) {
        
    }
//    if (playWaveAfterRecording) {
        AVAudioPlayer* player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self audioNote] error:nil];
        [self setPlayer:player];
        //        [player setDelegate:self];
        [player play];
//    }
//    [self setRecording:false];
    
}
- (IBAction)shareIssue:(id)sender {
}

@end
