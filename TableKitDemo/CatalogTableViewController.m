//
//  FirstTableViewExample.m
//  CellMappingExample
//
//  Created by Bruno Wernimont on 7/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CatalogTableViewController.h"

#import "TableKit.h"
#import "Item.h"

#define DYNAMIC_MAPPING @"DynamicMappingTableViewController"
#define NIB_CELL @"NibCellTableViewController"
#define SIMPLE_MAPPING @"SimpleMappingTableViewController"
#define CUSTOM_ROW_HEIGHT @"CustomRowHeightTableViewController"
#define CUSTOM_DATASOURCE_AND_DELEGATE @"CustomDataSourceAndDelegateTableViewController"
#define EDITING @"EditingTableViewController"
#define WILL_DISPLAY_CELL @"WillDisplayCellExampleViewController"
#define FETCHED_RESULTS @"NSFetchedResultsViewController"
#define STRING_MAPPING @"NSStringMappingViewController"
#define SECTION_MODEL @"SectionedTableViewController"

@implementation CatalogTableViewController

@synthesize tableModel = _tableModel;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Catalog";
    
    self.tableModel = [TKListTableModel tableModelForTableView:self.tableView];
    self.tableView.dataSource = self.tableModel;
    self.tableView.delegate = self.tableModel;
    
    [TKCellMapping mappingForObjectClass:[Item class] block:^(TKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        
        [cellMapping onSelectRowWithBlock:^(UITableViewCell *cell, Item *item, NSIndexPath *indexPath) {
            UIViewController *vc = [[NSClassFromString(item.type) alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        [self.tableModel registerMapping:cellMapping];
    }];
    
    NSArray *items = [NSArray arrayWithObjects:
                      [Item itemWithTitle:@"NSString mapping" subtitle:nil type:STRING_MAPPING],
                      [Item itemWithTitle:@"Simple mapping" subtitle:nil type:SIMPLE_MAPPING],
                      [Item itemWithTitle:@"Nib cell example" subtitle:nil type:NIB_CELL],
                      [Item itemWithTitle:@"Dynamic Mapping example" subtitle:nil type:DYNAMIC_MAPPING],
                      [Item itemWithTitle:@"Custom row height example" subtitle:nil type:CUSTOM_ROW_HEIGHT],
                      [Item itemWithTitle:@"Custom dataSource and delegate" subtitle:nil type:CUSTOM_DATASOURCE_AND_DELEGATE],
                      [Item itemWithTitle:@"Editing table view" subtitle:nil type:EDITING],
                      [Item itemWithTitle:@"Will display cell block" subtitle:nil type:WILL_DISPLAY_CELL],
                      [Item itemWithTitle:@"Fetched results" subtitle:nil type:FETCHED_RESULTS],
                      [Item itemWithTitle:@"Section example" subtitle:nil type:SECTION_MODEL],
                      nil];
    
    [self.tableModel loadTableItems:items];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
}


@end
