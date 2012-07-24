## TableKit.m

Create table view with blocks based syntax. This library is extracted from [BaseKit](https://github.com/brunow/BaseKit).


## Installation

**Copy** **TableKit** dir into your project.

## Example code

	self.tableModel = [TKListTableModel tableModelForTableView:self.tableView];
	self.tableView.dataSource = self.tableModel;
	self.tableView.delegate = self.tableModel;

	[TKCellMapping mappingForObjectClass:[Item class] block:^(TKCellMapping *cellMapping) {
	    [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];

	    [cellMapping onSelectRowWithBlock:^(UITableViewCell *cell, Item *item, NSIndexPath *indexPath) {
     	      // Do something
	    }];

	    [cellMapping mapObjectToCellClass:[UITableViewCell class]];
	    [self.tableModel registerMapping:cellMapping];
	}];

	NSArray *items = [NSArray arrayWithObjects:
						[Item itemWithTitle:@"Simple mapping"],
						[Item itemWithTitle:@"Nib cell example"],
						nil];

	[self.tableModel loadTableItems:items];

## Models

TableKit provide many type of model that you can use.

### TKTableModel

Basic model that **doesn't handle** data **list**. You will need to create a block that return an object for an indexPath.

	[self.tableModel setObjectForRowAtIndexPathWithBlock:^id(NSIndexPath *indexPath) {
		return [self.items objectAtIndex:indexPath.row];
	}];

### TKListTableModel

Model that handle **flat list** of **items** without section support.

Loading items

	- (void)loadTableItems:(NSArray *)items;

### TKManagedTableModel

Model that **conform** to **NSFetchedResultsControllerDelegate**. All you need is to set a fetched result controller by using the methods below:

	- (void)setFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController

Or by using **block syntax**:

	- (void)setFetchedResultsControllerWithBlock:(TKManagedTableModelFetchedResultsControllerBlock)block

Load items

	- (void)loadItems

As you can see it's very simple to create a fetch controller.

## Create your model

After you've choosen which table model you want to use, you will need to initialize it.

	self.tableModel = [TKListTableModel tableModelForTableView:self.tableView];

If you don't want to handle UITableViewDataSource and UITableViewDelegate, let TableKit handle it.

	self.tableView.dataSource = self.tableModel;
	self.tableView.delegate = self.tableModel;

Otherwise you will need to call table model method at hand.

## Mapping

### Simple mapping

	[TKCellMapping mappingForObjectClass:[Item class] block:^(TKCellMapping *cellMapping) {
		[cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
		[cellMapping mapObjectToCellClass:[UITableViewCell class]];
		[self.tableModel registerMapping:cellMapping];
	}];

### Dynamic mapping

	[TKDynamicCellMapping mappingForObjectClass:[Item class] block:^(TKDynamicCellMapping *cellMapping) {
        [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
        [cellMapping mapObjectToCellClass:[MovieViewCell class] whenValueOfKeyPath:@"type" isEqualTo:@"movie"];
        [self.tableModel registerMapping:cellMapping];
    }];

## How does the mapping work ?

Take the example above. **Item** object contain a property named **title** and **MovieViewCell** contain a **UILabel** called **textLabel** that herself has a property **text** to changed the label text.

## Migrating from BaseKit CellMapping

Classes are now prefixed with TK instead of BK so just rename classes. The second change is that now you've different type of model described above.

## ARC

TableKit is ARC only and require IOS 5.

## Changelog

- Master branch

## Todo

Create sectioned model.

## Contact

Bruno Wernimont

- Twitter - [@brunowernimont](http://twitter.com/brunowernimont)
