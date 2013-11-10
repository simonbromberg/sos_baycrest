//
//  SOSEmergencyViewController.m
//  SOSBaycrest
//
//  Created by Simon Bromberg on 11/10/2013.
//

#import "SOSEmergencyViewController.h"
#import <MessageUI/MessageUI.h>

@implementation SOSEmergencyViewController
-(void) viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baycrestlogo"]];
}
- (IBAction)callPressed {
    //TODO: add phone number in settings?
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:4160000000"]];
}

- (IBAction)mailButtonPressed {
    if ([MFMailComposeViewController canSendMail]) {
        [self displayMailComposerSheet];
    }

}

- (void)displayMailComposerSheet
{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    
    [picker setSubject:@"Emergency!"]; //TODO: add details of message
    
    // Set up recipients
    NSArray *toRecipients = [NSArray arrayWithObject:@"first@example.com"];
    NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil];
    NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
    
    [picker setToRecipients:toRecipients];
    [picker setCcRecipients:ccRecipients];
    [picker setBccRecipients:bccRecipients];
    
    // Attach audio
    
    // Fill out the email body text
    NSString *emailBody = @"This is the emergency description";
    [picker setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
}
@end
