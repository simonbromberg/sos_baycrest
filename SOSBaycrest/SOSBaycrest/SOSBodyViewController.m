//
//  SOSBodyViewController.m
//  SOSBaycrest
//
//  Created by Simon Bromberg on 11/9/2013.
//  Copyright (c) 2013 Michael Matan. All rights reserved.
//

#import "SOSBodyViewController.h"

@interface SOSBodyViewController ()
@property (nonatomic,strong) NSArray* labels;
@end

@implementation SOSBodyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.labels = [NSArray arrayWithObjects:@"Neurological",@"Sensory", @"Respiratory", @"Cardiovascular", @"Intergumentary", @"Gastrointestinal", @"Genitourinary", @"Musculoskeletal", @"Function", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.labels objectAtIndex: indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}



@end

