//
//  CustomDataSourceAndDelegateTableViewController.h
//  CellMappingExample
//
//  Created by Bruno Wernimont on 26/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKTableModel;

@interface CustomDataSourceAndDelegateTableViewController : UITableViewController

@property (nonatomic, retain) TKTableModel *tableModel;
@property (nonatomic, retain) NSArray *items;

@end
