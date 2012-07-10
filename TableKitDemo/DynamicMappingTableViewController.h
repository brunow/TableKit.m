//
//  TableViewControllerExample.h
//  CellMappingExample
//
//  Created by Bruno Wernimont on 5/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKListTableModel;

@interface DynamicMappingTableViewController : UITableViewController

@property (nonatomic, retain) TKListTableModel *tableModel;

@end
