//
//  BaseTableViewCell.h
//  TableViewTimer
//
//  Created by YouXianMing on 15/7/9.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

/**
 *  获取tableView的indexPath
 */
@property (nonatomic, weak) NSIndexPath  *indexPath;

/**
 *  当前cell是否显示出来了,在子类中重写setter,getter方法来判断
 *  
 *  -- 在tableView的代理方法中进行设置 --
 *  tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
 *  tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
 *
 */
@property (nonatomic)       BOOL          display;

/**
 *  == [子类可以重写] ==
 *
 *  配置cell的默认属性
 */
- (void)defaultConfig;

/**
 *  == [子类可以重写] ==
 *
 *  在cell上面构建view
 */
- (void)buildViews;

/**
 *  == [子类可以重写] ==
 *
 *  加载数据
 *
 *  @param data 数据
 *  @param path 数据编号
 */
- (void)loadData:(id)data indexPath:(NSIndexPath *)indexPath;

@end
