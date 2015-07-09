//
//  UITableView+Style.m
//  TableViewTimer
//
//  Created by YouXianMing on 15/7/9.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "UITableView+Style.h"

@implementation UITableView (Style)

- (void)noneline {

    self.backgroundColor = [UIColor whiteColor];
    self.separatorStyle  = UITableViewCellSeparatorStyleNone;
}

@end
