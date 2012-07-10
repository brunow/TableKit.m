#import "Kiwi.h"
#import "Item.h"
#import "TKCellMapper.h"
#import "TableKit.h"

SPEC_BEGIN(TKCellMapperSpecs)

describe(@"cell mapping specs", ^{
    NSMutableArray *_dynamicCellMappings = [NSMutableArray array];
    TKCellMapping __block *_cellMapping;
    TKTableModel *_tableModel = [TKTableModel tableModelForTableView:[[UITableView alloc] init]];
    Item *_item = [Item itemWithTitle:@"title" subtitle:@"subtitle" type:@"dvd"];
    
    beforeAll(^{
        [TKCellMapping mappingForObjectClass:[NSString class] block:^(TKCellMapping *cellMapping) {
            [_tableModel registerMapping:cellMapping];
        }];
        
        [TKDynamicCellMapping mappingForObjectClass:[Item class] block:^(TKDynamicCellMapping *cellMapping) {
            [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
            
            [cellMapping onSelectRowWithBlock:^(UITableViewCell *cell, Item *item, NSIndexPath *indexPath) {
                
            }];
            
            [cellMapping mapObjectToCellClass:[UITableViewCell class] whenValueOfKeyPath:@"type" isEqualTo:@"book"];
            [_tableModel registerMapping:cellMapping];
            [_dynamicCellMappings addObject:cellMapping];
        }];
        
        [TKCellMapping mappingForObjectClass:[NSDictionary class] block:^(TKCellMapping *cellMapping) {
            [_tableModel registerMapping:cellMapping];
        }];
        
        [TKDynamicCellMapping mappingForObjectClass:[Item class] block:^(TKDynamicCellMapping *cellMapping) {
            [cellMapping mapKeyPath:@"title" toAttribute:@"textLabel.text"];
            [cellMapping mapKeyPath:@"subtitle" toAttribute:@"detailTextLabel.text"];
            
            [cellMapping onSelectRowWithBlock:^(UITableViewCell *cell, Item *item, NSIndexPath *indexPath) {
                
            }];
            
            [cellMapping mapObjectToCellClass:[UITableViewCell class] whenValueOfKeyPath:@"type" isEqualTo:@"dvd"];
            [_tableModel registerMapping:cellMapping];
            [_dynamicCellMappings addObject:cellMapping];
            _cellMapping = cellMapping;
        }];
        
        [TKCellMapping mappingForObjectClass:[NSSet class] block:^(TKCellMapping *cellMapping) {
            [_tableModel registerMapping:cellMapping];
        }];
    });
    
    it(@"should return right dynamic mappings set", ^{
        NSSet *mappings = [TKCellMapper cellMappingsForObject:_item mappings:_tableModel.objectMappings];
        [[mappings should] have:2];
        [[mappings should] containObjects:[_dynamicCellMappings objectAtIndex:0],
                                          [_dynamicCellMappings objectAtIndex:1], nil];
    });
    
    it(@"should return right mapping", ^{
        NSSet *mappings = [TKCellMapper cellMappingsForObject:_item mappings:_tableModel.objectMappings];
        TKCellMapping *cellMapping = [TKCellMapper cellMappingForObject:_item mappings:mappings];
        id expected = _cellMapping;
        [[theValue(cellMapping) should] equal:theValue(expected)];
    });
    
    it(@"should map right attributes values", ^{
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        [TKCellMapper mapCellAttributeWithMapping:_cellMapping object:_item cell:cell];
        [[cell.textLabel.text should] equal:_item.title];
        [[cell.detailTextLabel.text should] equal:_item.subtitle];
    });

});

SPEC_END