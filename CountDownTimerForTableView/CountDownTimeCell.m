//
//  CountDownTimeCell.m
//  TableViewTimer
//
//  Created by YouXianMing on 15/7/9.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "CountDownTimeCell.h"
#import "TimeModel.h"

// 宽度
#define  Width                             [UIScreen mainScreen].bounds.size.width

// 高度
#define  Height                            [UIScreen mainScreen].bounds.size.height

@interface CountDownTimeCell ()

@property (nonatomic, strong) UIView      *backView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *countdownLabel;

@property (nonatomic, weak)   id           data;
@property (nonatomic, weak)   NSIndexPath *tmpIndexPath;

@end


@implementation CountDownTimeCell

- (void)defaultConfig {
    
    [self registerNSNotificationCenter];
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2f];
}

- (void)buildViews {

    self.backView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 99.5)];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.backView];
    
    {
        self.titleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, Width - 20, 30)];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font      = [UIFont fontWithName:@"Avenir-Light" size:20.f];
        [self.backView addSubview:self.titleLabel];
        
        self.countdownLabel               = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, Width - 20, 40)];
        self.countdownLabel.textColor     = [UIColor redColor];
        self.countdownLabel.textAlignment = NSTextAlignmentRight;
        self.countdownLabel.font          = [UIFont fontWithName:@"AvenirNext-UltraLight" size:30.f];
        [self.backView addSubview:self.countdownLabel];
    }
}

- (void)loadData:(id)data indexPath:(NSIndexPath *)indexPath {

    [self storeWeakValueWithData:data indexPath:indexPath];
    
    TimeModel *model         = data;
    self.titleLabel.text     = model.title;
    self.countdownLabel.text = [model currentTimeString];
}

- (void)storeWeakValueWithData:(id)data indexPath:(NSIndexPath *)indexPath {

    self.data         = data;
    self.tmpIndexPath = indexPath;
}

- (void)dealloc {

    [self removeNSNotificationCenter];
}

#pragma mark - 通知中心
- (void)registerNSNotificationCenter {

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationCenterEvent:)
                                                 name:NOTI_CountDownTimeCell
                                               object:nil];
}

- (void)removeNSNotificationCenter {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTI_CountDownTimeCell object:nil];
}

- (void)notificationCenterEvent:(id)sender {
    
    if (self.display) {
        [self loadData:self.data indexPath:self.tmpIndexPath];
    }
}

@end
