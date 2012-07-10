//
//  NSStringMappingViewController.m
//  TableKitDemo
//
//  Created by Bruno Wernimont on 9/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSStringMappingViewController.h"

#import "TableKit.h"

@interface NSStringMappingViewController ()

@end

@implementation NSStringMappingViewController

@synthesize tableModel = _tableModel;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Simple mapping";
    
    self.tableModel = [TKListTableModel tableModelForTableView:self.tableView];
    self.tableView.dataSource = self.tableModel;
    self.tableView.delegate = self.tableModel;
    
    [TKCellMapping mappingForObjectClass:[NSString class] block:^(TKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"description" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        [self.tableModel registerMapping:cellMapping];
    }];
    
    NSArray *items = [NSArray arrayWithObjects:
                      @"Book1",
                      @"Book1",
                      @"Book1",
                      @"Book1",
                      @"Book1",
                      @"Book1",
                      nil];
    
    [self.tableModel loadTableItems:items];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
}


@end
