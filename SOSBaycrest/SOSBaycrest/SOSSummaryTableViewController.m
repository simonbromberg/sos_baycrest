//
//  SOSSummaryTableViewController.m
//  SOSBaycrest
//
//  Created by Michael Matan on 2013-11-10.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import "SOSSummaryTableViewController.h"
#import "SOSAppDelegate.h"

@interface SOSSummaryTableViewController ()

@end

@implementation SOSSummaryTableViewController

-(NSArray*) issueItems {
    if(!_issueItems) {
        _issueItems = [[NSMutableArray alloc] init];
        NSDictionary* ci = [[SOSAppDelegate sharedInstance] checklistDict];
        _issueSectionNames = [[NSMutableArray alloc] init];
        bool groupItems = false;
        groupItems = true;
        if (groupItems) {
            for(NSString* systemName in [ci keyEnumerator]) {
                NSMutableArray* checkedSystemItems = [[NSMutableArray alloc] init];
                NSArray* systemItems = [ci objectForKey:systemName];
                for(NSDictionary* item in systemItems) {
                    if ([item objectForKey:@"Condition"] && [[item objectForKey:@"Condition"]  isEqual: @YES]) {
                        NSLog(@"Condition item is true");
                        [checkedSystemItems addObject:item];
                    }
                }
                if ([checkedSystemItems count]>0) {
                    [_issueSectionNames addObject:systemName];
                    [_issueItems addObject:checkedSystemItems];
                    
                }
                
            }
        }
        else {
            for(NSString* systemName in [ci keyEnumerator]) {
                NSMutableArray* checkedSystemItems = [[NSMutableArray alloc] init];
                NSArray* systemItems = [ci objectForKey:systemName];
                for(NSDictionary* item in systemItems) {
                    if ([item objectForKey:@"Condition"] && [[item objectForKey:@"Condition"]  isEqual: @YES]) {
                        NSLog(@"Condition item is true");
                        [checkedSystemItems addObject:item];
                    }
                }
                if ([checkedSystemItems count]>0) {
//                    [_issueItems addObject:checkedSystemItems];
                    [_issueItems addObjectsFromArray:checkedSystemItems];
                }
                
            }
        }
    }
    
    
    
    
    return _issueItems;
    
}

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self issueItems] count];
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
//    NSLog(@"number of issue items %u",[[se lf issueItems] count]);
        return [[[self issueItems] objectAtIndex:section] count];
    
    return [[self issueItems] count];
    
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SOSSummaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
//    NSDictionary* itemInfo = [[self issueItems] objectAtIndex:[indexPath item]];
    NSDictionary* itemInfo = [[[self issueItems] objectAtIndex:[indexPath section]] objectAtIndex:[indexPath item]];
    
    NSString* question = [itemInfo objectForKey:@"Question"];
    
//    [cell setItemName:question];
    
    [[cell itemName] setText:question];
    if ([itemInfo objectForKey:@"AudioNote"]) {
        [cell setAudioNote:[itemInfo objectForKey:@"AudioNote"]];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [_issueSectionNames objectAtIndex:section];
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

@end
