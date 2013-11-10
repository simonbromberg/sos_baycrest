//
//  SOSSummaryTableViewController.h
//  SOSBaycrest
//
//  Created by Michael Matan on 2013-11-10.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOSSummaryTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray* _issueItems;
}

@property (nonatomic, strong) NSArray* issueItems;

@end
