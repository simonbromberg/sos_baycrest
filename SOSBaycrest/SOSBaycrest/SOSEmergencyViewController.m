//
//  SOSEmergencyViewController.m
//  SOSBaycrest
//
//  Created by Simon Bromberg on 11/10/2013.
//

#import "SOSEmergencyViewController.h"
#import <MessageUI/MessageUI.h>

@implementation SOSEmergencyViewController

- (IBAction)callPressed {
    //TODO: add phone number in settings?
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:4160000000"]];
}

- (IBAction)mailButtonPressed {
    [self displayMailComposerSheet];
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
    
    // Attach an image to the email
    NSString *path = [[NSBundle mainBundle] pathForResource:@"rainy" ofType:@"jpg"];
    NSData *myData = [NSData dataWithContentsOfFile:path];
    [picker addAttachmentData:myData mimeType:@"image/jpeg" fileName:@"rainy"];
    
    // Fill out the email body text
    NSString *emailBody = @"It is raining in sunny California!";
    [picker setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:picker animated:YES completion:NULL];
}
@end
