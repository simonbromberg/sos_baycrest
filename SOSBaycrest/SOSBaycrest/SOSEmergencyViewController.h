//
//  SOSEmergencyViewController.h
//  SOSBaycrest
//
//  Created by Simon Bromberg on 11/10/2013.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface SOSEmergencyViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)callPressed;
- (IBAction)mailButtonPressed;

@end
