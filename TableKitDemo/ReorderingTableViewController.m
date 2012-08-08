//
//  ReorderingTableViewController.m
//  TableKitDemo
//
//  Created by cesar4 on 8/08/12.
//
//

#import "ReorderingTableViewController.h"

#import "TableKit.h"
#import "Item.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ReorderingTableViewController ()

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ReorderingTableViewController

@synthesize tableModel = _tableModel;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Editing table view";
    
    self.tableModel = [TKListTableModel tableModelForTableView:self.tableView];
    self.tableView.dataSource = self.tableModel;
    self.tableView.delegate = self.tableModel;
    
    [TKCellMapping mappingForObjectClass:[Item class] block:^(TKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        
        [cellMapping canMoveObjectWithBlock:^(id object, NSIndexPath *indexPath) {
            return YES;
        }];
        
        [cellMapping moveObjectWithBlock:^(id object, NSIndexPath *sourceIndexPath, NSIndexPath *toIndexPath) {
            NSLog(@"Did move sourceIndexPath: %@ toIndexPath %@", sourceIndexPath, toIndexPath);
        }];
        
        [self.tableModel registerMapping:cellMapping];
    }];
    
    NSArray *items = [NSArray arrayWithObjects:
                      [Item itemWithTitle:@"Book1" subtitle:nil],
                      [Item itemWithTitle:@"Book2" subtitle:nil],
                      [Item itemWithTitle:@"Book3" subtitle:nil],
                      [Item itemWithTitle:@"Book4" subtitle:nil],
                      [Item itemWithTitle:@"Book5" subtitle:nil],
                      [Item itemWithTitle:@"Book6" subtitle:nil],
                      nil];
    
    [self.tableModel loadTableItems:items];
    
    [self.tableView setEditing:YES animated:NO];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
}


@end
