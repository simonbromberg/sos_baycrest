//
//  SOSDetailViewController.m
//  SOSBaycrest
//
//  Created by Simon Bromberg on 11/9/2013.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import "SOSDetailViewController.h"

@interface SOSDetailViewController ()

@end

@implementation SOSDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baycrestlogo"]];
    self.headerLabel.text = self.systemTitle;
    self.tableView.tableHeaderView.backgroundColor = self.headerColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
//    return 4;
    NSDictionary* ci = [[SOSAppDelegate sharedInstance] checklistDict];
    NSLog(@"%d entries",[ci[@"Defs"][0][@"entries"] count]);
    return [ci[@"SensorySystem"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SOSChecklistTableViewCell *cell = (SOSChecklistTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    NSLog(@"icon test %@",    [cell conditionPositiveButton]);
    
    // Configure the cell...
    
    NSDictionary* ci = [[SOSAppDelegate sharedInstance] checklistDict];
    
//    ci = ci[@"entries"][0];
//    NSArray* entries = ci[@"Defs"][0][@"entries"];
//    
//    NSDictionary* entry = entries[[indexPath item]];
//    [[cell conditionLabel] setText:entry[@"label"]];
//    
//    [[cell conditionIcon] setImage:[UIImage imageNamed:entry[@"imageResource"]]];
    

    ci = ci[@"SensorySystem"][[indexPath item] ];
    
    [[cell conditionLabel] setText:ci[@"Question"]];
    
    [[cell conditionIcon] setImage:[UIImage imageNamed:ci[@"Image"]]];
    
    
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

-(void) startRecording {
    
    //TODO audit this method, source:  http://stackoverflow.com/questions/1010343/how-do-i-record-audio-on-iphone-with-avaudiorecorder
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *err = nil;
    [audioSession setCategory :AVAudioSessionCategoryPlayAndRecord error:&err];
    if(err){
        NSLog(@"audioSession: %@ %d %@", [err domain], [err code], [[err userInfo] description]);
        return;
    }
    [audioSession setActive:YES error:&err];
    err = nil;
    if(err){
        NSLog(@"audioSession: %@ %d %@", [err domain], [err code], [[err userInfo] description]);
        return;
    }
    
    NSDictionary* recordSetting = [[NSMutableDictionary alloc] init];
    
    
    bool makeWav = true;
    makeWav = false;
    
    
    if (makeWav) {
        [recordSetting setValue :[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
        [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
        [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
        
        [recordSetting setValue :[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
        [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
        [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
    }
    else {
        //    [recordSetting setValue :[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
        [recordSetting setValue :[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
        [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
        [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
        
//        [recordSetting setValue:[NSNumber numberWithInt: 16] forKey:AVEncoderBitRateKey];
//        [recordSetting setValue:[NSNumber numberWithInt: AVAudioQualityMin] forKey:AVEncoderAudioQualityKey];
        [recordSetting setValue:[NSNumber numberWithInt: AVAudioQualityMin] forKey:AVEncoderAudioQualityKey];
        
        //    [recordSetting setValue :[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
        //    [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
        //    [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];

    }

    
    
    
    // Create a new dated file
    NSDate *now = [NSDate dateWithTimeIntervalSinceNow:0];
    NSString *caldate = [now description];
    //    recorderFilePath = [[NSString stringWithFormat:@"%@/%@.caf", DOCUMENTS_FOLDER, caldate] retain];
    
    NSString *prefixString = @"AudioNote";
    
    NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString] ;
//    NSString *uniqueFileName = [NSString stringWithFormat:@"%@_%@.mp3", prefixString, guid];
    NSString *uniqueFileName = [NSString stringWithFormat:@"%@_%@.m4a", prefixString, guid];
//    NSString *uniqueFileName = [NSString stringWithFormat:@"%@_%@.wav", prefixString, guid];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *previewImagePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:uniqueFileName];
    
    NSURL* imageFileURL = [NSURL fileURLWithPath:previewImagePath];
    
    
    //        NSString* audioOutputPath = [NSString pathWithComponents:@[basePath,wavRecordingFileName]];
    NSString* audioOutputPath = [imageFileURL path];
    NSLog(@"audio recording file path is %@",audioOutputPath);
    NSURL* audioOutputURL = [[NSURL alloc] initFileURLWithPath:audioOutputPath];
    
    NSURL* url = [[NSURL alloc] initFileURLWithPath:audioOutputPath];
    
    err = nil;
    AVAudioRecorder* recorder = [[ AVAudioRecorder alloc] initWithURL:url settings:recordSetting error:&err];
    if(!recorder){
        NSLog(@"recorder: %@ %d %@", [err domain], [err code], [[err userInfo] description]);
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle: @"Error"
                                   message: @"Failed to initialize recording session."
                                  delegate: nil
                         cancelButtonTitle:@"OK"
                         otherButtonTitles:nil];
        [alert show];
        //        [alert release];
        return;
    }
    [self setAudioRecorder:recorder];
    //prepare to record
    [recorder setDelegate:self];
    [recorder prepareToRecord];
    recorder.meteringEnabled = YES;
    
    BOOL audioHWAvailable = audioSession.inputIsAvailable;
    if (! audioHWAvailable) {
        UIAlertView *cantRecordAlert =
        [[UIAlertView alloc] initWithTitle: @"Warning"
                                   message: @"Audio input hardware not available.  Cannot record."
                                  delegate: nil
                         cancelButtonTitle:@"OK"
                         otherButtonTitles:nil];
        [cantRecordAlert show];
        //        [cantRecordAlert release];
        return;
    }
    
    
    // start recording
    //    [recorder recordForDuration:(NSTimeInterval) 10];
    [recorder record];
    [self setRecording:true];
    
}

- (IBAction)stopRecording:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        // do work here
        if ([self audioRecorder]) {
            [[self audioRecorder] stop];
            NSLog(@"stopping recording");
        }
        else {
            NSLog(@"error: no audio recorder to stop");
        }    });
}

#pragma mark AVAudioRecorderDelegate methods

/* audioRecorderDidFinishRecording:successfully: is called when a recording has been finished or stopped. This method is NOT called if the recorder is stopped due to an interruption. */
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    bool playWaveAfterRecording = true;
    
    if (playWaveAfterRecording) {
        AVAudioPlayer* player = [[AVAudioPlayer alloc] initWithContentsOfURL:[recorder url] error:nil];
        [self setPlayer:player];
//        [player setDelegate:self];
        [player play];
    }
    [self setRecording:false];
}

/* if an error occurs while encoding it will be reported to the delegate. */
- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error {
    NSLog(@"Failed to record note");
    [self setRecording:false];
}
- (IBAction)microphoneAction:(id)sender {
    if ([self recording]) {
        [self stopRecording:nil];
    }
    else {
        [self startRecording];
    }
    
}


-(IBAction) submit {
    [self.delegate detailViewControllerDidComplete:self];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
