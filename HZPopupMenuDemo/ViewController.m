//
//  ViewController.m
//  HZPopupMenuDemo
//
//  Created by 候志伟 on 2018/4/18.
//  Copyright © 2018年 bocweb. All rights reserved.
//

#import "ViewController.h"
#import "HZPopupMenu.h"

#define TITLES @[@"修改", @"删除", @"扫一扫",@"付款"]
#define ICONS  @[@"motify",@"delete",@"saoyisao",@"pay"]

@interface ViewController ()<HZPopupMenuDelegate,UITextFieldDelegate>

@property (nonatomic, strong) HZPopupMenu *popupMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)onPopupClick:(UIButton *)sender {
    [HZPopupMenu showRelyOnView:sender titles:TITLES icons:ICONS menuWidth:120 delegate:self];
}

- (IBAction)onTestClick:(UIButton *)sender {
    [HZPopupMenu showRelyOnView:sender titles:@[@"111",@"222",@"333",@"444",@"555",@"666",@"777",@"888"] icons:nil menuWidth:100 otherSettings:^(HZPopupMenu *popupMenu) {
        popupMenu.priorityDirection = HZPopupMenuPriorityDirectionLeft;
        popupMenu.borderWidth = 1;
        popupMenu.borderColor = [UIColor redColor];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView: self.view];
    
    //推荐用这种写法
    [HZPopupMenu showAtPoint:p titles:TITLES icons:nil menuWidth:110 otherSettings:^(HZPopupMenu *popupMenu) {
        popupMenu.dismissOnSelected = NO;
        popupMenu.isShowShadow = YES;
        popupMenu.delegate = self;
        popupMenu.offset = 10;
        popupMenu.type = HZPopupMenuTypeDark;
        popupMenu.rectCorner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
    }];
}

#pragma mark - HZPopupMenuDelegate
- (void)HZPopupMenuDidSelectedAtIndex:(NSInteger)index HZPopupMenu:(HZPopupMenu *)HZPopupMenu
{
    NSLog(@"点击了 %@ 选项",TITLES[index]);
}


@end
