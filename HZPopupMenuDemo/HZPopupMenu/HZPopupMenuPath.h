//
//  HZPopupMenuPath.h
//  HZPopupMenuDemo
//
//  Created by 候志伟 on 2018/4/18.
//  Copyright © 2018年 bocweb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HZPopupMenuArrowDirection) {
    HZPopupMenuArrowDirectionTop = 0,  //箭头朝上
    HZPopupMenuArrowDirectionBottom,   //箭头朝下
    HZPopupMenuArrowDirectionLeft,     //箭头朝左
    HZPopupMenuArrowDirectionRight,    //箭头朝右
    HZPopupMenuArrowDirectionNone      //没有箭头
};

@interface HZPopupMenuPath : NSObject

+ (CAShapeLayer *)HZ_maskLayerWithRect:(CGRect)rect
                            rectCorner:(UIRectCorner)rectCorner
                          cornerRadius:(CGFloat)cornerRadius
                            arrowWidth:(CGFloat)arrowWidth
                           arrowHeight:(CGFloat)arrowHeight
                         arrowPosition:(CGFloat)arrowPosition
                        arrowDirection:(HZPopupMenuArrowDirection)arrowDirection;

+ (UIBezierPath *)HZ_bezierPathWithRect:(CGRect)rect
                             rectCorner:(UIRectCorner)rectCorner
                           cornerRadius:(CGFloat)cornerRadius
                            borderWidth:(CGFloat)borderWidth
                            borderColor:(UIColor *)borderColor
                        backgroundColor:(UIColor *)backgroundColor
                             arrowWidth:(CGFloat)arrowWidth
                            arrowHeight:(CGFloat)arrowHeight
                          arrowPosition:(CGFloat)arrowPosition
                         arrowDirection:(HZPopupMenuArrowDirection)arrowDirection;

@end
