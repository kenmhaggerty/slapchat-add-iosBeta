//
//  FISTableViewController.m
//  slapChat
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISTableViewController.h"
#import "FISDataStore.h"

@interface FISTableViewController ()
@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) FISDataStore *store;
- (IBAction)sort:(id)sender;
@end

@implementation FISTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setStore:[FISDataStore sharedDataStore]];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.store fetchData];
    [self setMessages:self.store.messages];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];

    FISMessage *message = [self.messages objectAtIndex:indexPath.row];
    [cell.textLabel setText:message.content];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@", message.createdAt]];
    
    return cell;
}

- (IBAction)sort:(id)sender {
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:NSStringFromSelector(@selector(createdAt)) ascending:NO];
    NSArray *sortedArray = [self.messages sortedArrayUsingDescriptors:@[sortDescriptor]];
    [self setMessages:sortedArray];
    [self.tableView reloadData];
}

@end
