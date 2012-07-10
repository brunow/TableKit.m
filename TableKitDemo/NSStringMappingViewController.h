//
//  NSStringMappingViewController.h
//  TableKitDemo
//
//  Created by Bruno Wernimont on 9/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TKListTableModel;

@interface NSStringMappingViewController : UITableViewController

@property (nonatomic, retain) TKListTableModel *tableModel;

@end
