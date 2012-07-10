//
//  FirstTableViewExample.h
//  CellMappingExample
//
//  Created by Bruno Wernimont on 7/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKListTableModel;

@interface CatalogTableViewController : UITableViewController

@property (nonatomic, retain) TKListTableModel *tableModel;

@end
