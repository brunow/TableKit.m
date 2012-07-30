//
//  SectionedTableViewController.m
//  TableKitDemo
//
//  Created by cesar4 on 30/07/12.
//
//

#import "SectionedTableViewController.h"

#import "TableKit.h"
#import "Item.h"

@interface SectionedTableViewController ()

@end

@implementation SectionedTableViewController

@synthesize tableModel = _tableModel;


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Section example";
    
    self.tableModel = [TKSectionedTableModel tableModelForTableView:self.tableView];
    self.tableView.dataSource = self.tableModel;
    self.tableView.delegate = self.tableModel;
    
    [TKCellMapping mappingForObjectClass:[Item class] block:^(TKCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[UITableViewCell class]];
        
        [self.tableModel registerMapping:cellMapping];
    }];
    
    [self.tableModel setViewForHeaderInSectionWithBlock:^UIView *(UITableView *tableView, NSInteger section, NSString *title) {
        UIView *sectionView = [[UIView alloc] initWithFrame:CGRectZero];
        sectionView.backgroundColor = [UIColor redColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 21)];
        titleLabel.text = title;
        titleLabel.backgroundColor = [UIColor clearColor];
        [sectionView addSubview:titleLabel];
        return sectionView;
    }];
    
    NSArray *items1 = [NSArray arrayWithObjects:
                       [Item itemWithTitle:@"Book1" subtitle:nil],
                       [Item itemWithTitle:@"Book2" subtitle:nil],
                       [Item itemWithTitle:@"Book3" subtitle:nil],
                       [Item itemWithTitle:@"Book4" subtitle:nil],
                       [Item itemWithTitle:@"Book5" subtitle:nil],
                       [Item itemWithTitle:@"Book6" subtitle:nil],
                      nil];
    
    NSArray *items2 = [NSArray arrayWithObjects:
                       [Item itemWithTitle:@"Book7" subtitle:nil],
                       [Item itemWithTitle:@"Book8" subtitle:nil],
                       nil];
    
    [self.tableModel loadTableItems:@[items1, items2]
                       withSections:@[@"Section1", @"Section2"]];
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.tableModel = nil;
}


@end
