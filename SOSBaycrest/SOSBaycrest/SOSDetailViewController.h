//
//  SOSDetailViewController.h
//  SOSBaycrest
//
//  Created by Simon Bromberg on 11/9/2013.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SOSAppDelegate.h"

#import <AVFoundation/AVFoundation.h>

@class SOSChecklistTableViewCell;
@protocol SOSDetailViewControllerDelegate;

@interface SOSDetailViewController : UITableViewController<AVAudioRecorderDelegate>

@property (nonatomic,strong) NSString* systemTitle;
@property (nonatomic,strong) UIColor* headerColor;
@property (nonatomic,assign) NSInteger systemIndex; //save the index of the system on the previous view so when it submits it knows which one is being submitted

@property (nonatomic,weak) IBOutlet UILabel* headerLabel;
@property (nonatomic,strong) AVAudioRecorder* audioRecorder;
@property (nonatomic) bool recording;

@property (nonatomic, strong) AVAudioPlayer* player;
@property (nonatomic,unsafe_unretained) id <SOSDetailViewControllerDelegate> delegate;

@property (nonatomic, strong) UIView* recordingModalBlockingView;
@property (nonatomic, strong) SOSChecklistTableViewCell* checklistCellHavingNoteRecorded;

-(void) checklistCellEntryUpdated: (SOSChecklistTableViewCell*) cell;
@end


@protocol SOSDetailViewControllerDelegate <NSObject>

@required
-(void) detailViewControllerDidComplete: (SOSDetailViewController*) viewController;
@end
