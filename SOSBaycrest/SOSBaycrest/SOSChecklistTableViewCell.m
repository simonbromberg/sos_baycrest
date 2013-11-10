//
//  SOSChecklistTableViewCell.m
//  OSO
//
//  Created by Michael Matan on 2013-11-09.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import "SOSChecklistTableViewCell.h"
#import "SOSAppDelegate.h"

@implementation SOSChecklistTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        NSLog(@"creating sos checklist cell");
    }
    return self;
}

-(void) awakeFromNib {
    self.condition = FALSE;
}
- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        NSLog(@"creating sos checklist cell from coder");
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        
        
        CGFloat cellHeight = self.frame.size.height;
        
        _mainContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, cellHeight)];
        [_mainContentView setBackgroundColor:[UIColor blueColor]];
        _sideContentView = [[UIView alloc] initWithFrame:CGRectMake(screenWidth, 0, screenWidth*0.8, cellHeight)];
        [_sideContentView setBackgroundColor:[UIColor redColor]];
        
//        [self addSubview:_mainContentView];
//        [self addSubview:_sideContentView];
        
//        UITapGestureRecognizer *singleFingerTap =
//        [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                action:@selector(slideInOut)];
//        [self addGestureRecognizer:singleFingerTap];
        
    }
    return self;
    
}

-(void) slideInOut {
//    NSLog(@"slideinout pressed");
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    CGRect mf = [[self mainContentView] frame];
    CGRect sf = [[self sideContentView] frame];
    
    CGFloat frameHeight = self.frame.size.height;
    
    bool useCA = true;
    
    CGRect tf = [self frame];
    
    CGFloat pixelMoveDistance = 100;
    
    if (useCA) {
        if ([self isSlidOut]) {
            [UIView animateWithDuration:0.5 animations:^{
//                [[self mainContentView] setFrame:CGRectMake(mf.origin.x+pixelMoveDistance, mf.origin.y, mf.size.width, mf.size.height)];
//                [[self sideContentView] setFrame:CGRectMake(sf.origin.x+pixelMoveDistance, sf.origin.y, sf.size.width, sf.size.height)];
                [self  setFrame:CGRectMake(tf.origin.x+pixelMoveDistance, tf.origin.y, tf.size.width-pixelMoveDistance, frameHeight)];
            }];

        }
        else {
            [UIView animateWithDuration:0.5 animations:^{
                
//                [[self mainContentView] setFrame:CGRectMake(mf.origin.x-pixelMoveDistance, mf.origin.y, mf.size.width, mf.size.height)];
//                [[self sideContentView] setFrame:CGRectMake(sf.origin.x-pixelMoveDistance, sf.origin.y, sf.size.width, sf.size.height)];
                [self  setFrame:CGRectMake(tf.origin.x-pixelMoveDistance, tf.origin.y, tf.size.width+pixelMoveDistance, frameHeight)];
            }];
            
            
//            NSLog(@"Frame dim: %f,%f,%f,%f",);

        }
    }
    else {
        if ([self isSlidOut]) {
            [[self mainContentView] setFrame:CGRectMake(mf.origin.x+40, mf.origin.y, mf.size.width, mf.size.height)];
            [[self sideContentView] setFrame:CGRectMake(sf.origin.x+40, sf.origin.y, sf.size.width, sf.size.height)];
        }
        else {
            [[self mainContentView] setFrame:CGRectMake(mf.origin.x-40, mf.origin.y, mf.size.width, mf.size.height)];
            [[self sideContentView] setFrame:CGRectMake(sf.origin.x-40, sf.origin.y, sf.size.width, sf.size.height)];
        }

    }

    [self setIsSlidOut:![self isSlidOut]];
    

//    [self sideContentView].frame.origin.x = screenWidth-40;
//    _mainContentView
//    CATransition *transition = [CATransition animation];
//    [transition setType:kCATransitionMoveIn];
//    [transition setSubtype:kCATransitionFromRight];
//    return transition;
}

-(void) prepareForReuse {
    [self setIsSlidOut:false];//TODO actually slide back the views
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark custom methods

- (IBAction)conditionPositiveAction:(id)sender {
    if (self.positiveState) {
        [self.conditionPositiveButton setImage:[UIImage imageNamed:@"changedefault"] forState:UIControlStateNormal];
    }
    else {
        [self.conditionPositiveButton setImage:[UIImage imageNamed:@"changeactive"] forState:UIControlStateNormal];
    }
    [self slideInOut];
    self.positiveState = !self.positiveState;
    
    if (self.negativeState) {
        [self.conditionNegativeButton setImage:[UIImage imageNamed:@"nochangedefault"] forState:UIControlStateNormal];
        self.negativeState = !self.negativeState;
    }
    
    NSLog(@"Checklist entry value is now %@",[[self checklistEntry] objectForKey:@"Condition" ]);
    
    
    if (self.positiveState) {
        [[self checklistEntry] setObject:@TRUE forKey:@"Condition"];
        if ([[self checklistEntry] objectForKey:@"Urgent"]) {
            NSLog(@"class of superview: %@",[[[[self superview] superview] superview] class]);
        }
        
    }
    NSLog(@"Checklist entry value is now %@",[[self checklistEntry] objectForKey:@"Condition" ]);
    
    
    
}


-(void) toggleChangeButton {
    self.changeButtonIsActive = !self.changeButtonIsActive;
    NSString* buttonImage = self.changeButtonIsActive ? @"changeactive" : @"changedefault";
    [self.changeButton setImage:[UIImage imageNamed:buttonImage] forState:UIControlStateNormal];
    
}

-(void) toggleNoChangeButton {
    NSString* buttonImage = self.changeButtonIsActive ? @"changeactive" : @"changedefault";
    [self.noChangeButton setImage:[UIImage imageNamed:buttonImage] forState:UIControlStateNormal];
    
    
}

-(void) updateChecklistEntry {
    if (!self.changeButtonIsActive && !self.noChangeButtonIsActive) {
        [[self checklistEntry] setObject:[NSNull null] forKey:@"Condition"];
    }
    else {
        [[self checklistEntry] setObject:[NSNumber numberWithBool:self.changeButtonIsActive] forKey:@"Condition"];
    }
}
-(IBAction) tappedChangeButton {
    [self toggleChangeButton];
    if (self.noChangeButtonIsActive) {
        [self toggleNoChangeButton];
    }
    
    [self updateChecklistEntry];
    
}

-(IBAction) tappedNoChangeButton {
    [self toggleNoChangeButton];
    if (self.changeButtonIsActive) {
        [self toggleChangeButton];
    }
}

- (IBAction)conditionNegativeAction:(id)sender {
    if (self.negativeState) {
        [self.conditionNegativeButton setImage:[UIImage imageNamed:@"nochangedefault"] forState:UIControlStateNormal];
    }
    else [self.conditionNegativeButton setImage:[UIImage imageNamed:@"nochangeactive"] forState:UIControlStateNormal];
    self.negativeState = !self.negativeState;
    
    if (self.positiveState) {
        [self.conditionPositiveButton setImage:[UIImage imageNamed:@"changedefault"] forState:UIControlStateNormal];
        self.positiveState = !self.positiveState;
    }
    NSLog(@"Checklist entry value is now %@",[[self checklistEntry] objectForKey:@"Condition" ]);

    [[self checklistEntry] setObject:[NSNumber numberWithBool:self.positiveState] forKey:@"Condition"];
    
    NSLog(@"Checklist entry value is now %@",[[self checklistEntry] objectForKey:@"Condition" ]);
    
}
- (IBAction)microphoneAction:(id)sender {
    //Not really used, button action connected to detail view controller, which launched the recorder; one recorder per checklist that way.
}
- (IBAction)infoAction:(id)sender {
    if ([[self checklistEntry] objectForKey:@"Info"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Descripton of \"%@\"",[[self checklistEntry] objectForKey:@"Question"]]
                                                        message:[[self checklistEntry] objectForKey:@"Info"]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    bool showInfo = true;
    if (showInfo) {
        NSDictionary* fc = [[SOSAppDelegate sharedInstance] checklistDict];
        for(NSString* systemName in [fc keyEnumerator]) {
            NSLog(@"System name is %@",systemName);
            for(NSDictionary* entry in [fc objectForKey:systemName]) {
                NSLog(@"Entry: %@; status: %@",[entry objectForKey:@"Question"],[entry objectForKey:@"Condition"]);
            }
        }
    }
    
}


@end
