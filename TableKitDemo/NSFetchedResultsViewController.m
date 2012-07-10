//
//  NSFetchedResultsViewController.m
//  CellMappingExample
//
//  Created by Bruno Wernimont on 31/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSFetchedResultsViewController.h"

#import "TableKit.h"
#import "CoreDataItem.h"
#import "CoreData+MagicalRecord.h"

@interface NSFetchedResultsViewController ()

@end

@implementation NSFetchedResultsViewController

@synthesize tableModel = _tableModel;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Catalog";
    
    self.tableModel = [TKManagedTableModel tableModelForTableView:self.tableView];
    self.tableView.dataSource = self.tableModel;
    self.tableView.delegate = self.tableModel;
    
    [TKCellMapping mappingForObjectClass:[CoreDataItem class] block:^(TKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        [self.tableModel registerMapping:cellMapping];
    }];
    
    [self.tableModel setFetchedResultsControllerWithBlock:^NSFetchedResultsController *{
        return [CoreDataItem MR_fetchAllGroupedBy:nil withPredicate:nil sortedBy:@"title" ascending:YES];;
    }];
    
    if ([[CoreDataItem MR_numberOfEntities] intValue] == 0) {
        [self addItems];
    }
    
    [self.tableModel loadItems];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)addItems {
    for (int number = 0; number < 10; number++) {
        CoreDataItem *item = [CoreDataItem MR_createEntity];
        item.title = [NSString stringWithFormat:@"title%d", number];
        [item.managedObjectContext save:nil];
    }
}


@end
