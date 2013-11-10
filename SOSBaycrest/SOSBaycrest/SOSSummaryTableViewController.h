//
//  SOSSummaryTableViewController.h
//  SOSBaycrest
//
//  Created by Michael Matan on 2013-11-10.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SOSSummaryTableViewCell.h"

@interface SOSSummaryTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray* _issueItems;
    NSMutableArray* _issueSectionNames;
}

@property (nonatomic, strong) NSArray* issueItems;

@end
