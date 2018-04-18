//
//  HZPopupMenuPath.m
//  HZPopupMenuDemo
//
//  Created by 候志伟 on 2018/4/18.
//  Copyright © 2018年 bocweb. All rights reserved.
//

#import "HZPopupMenuPath.h"
#import "HZRectConst.h"

@implementation HZPopupMenuPath

+ (CAShapeLayer *)HZ_maskLayerWithRect:(CGRect)rect
                            rectCorner:(UIRectCorner)rectCorner
                          cornerRadius:(CGFloat)cornerRadius
                            arrowWidth:(CGFloat)arrowWidth
                           arrowHeight:(CGFloat)arrowHeight
                         arrowPosition:(CGFloat)arrowPosition
                        arrowDirection:(HZPopupMenuArrowDirection)arrowDirection
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [self HZ_bezierPathWithRect:rect rectCorner:rectCorner cornerRadius:cornerRadius borderWidth:0 borderColor:nil backgroundColor:nil arrowWidth:arrowWidth arrowHeight:arrowHeight arrowPosition:arrowPosition arrowDirection:arrowDirection].CGPath;
    return shapeLayer;
}


+ (UIBezierPath *)HZ_bezierPathWithRect:(CGRect)rect
                             rectCorner:(UIRectCorner)rectCorner
                           cornerRadius:(CGFloat)cornerRadius
                            borderWidth:(CGFloat)borderWidth
                            borderColor:(UIColor *)borderColor
                        backgroundColor:(UIColor *)backgroundColor
                             arrowWidth:(CGFloat)arrowWidth
                            arrowHeight:(CGFloat)arrowHeight
                          arrowPosition:(CGFloat)arrowPosition
                         arrowDirection:(HZPopupMenuArrowDirection)arrowDirection
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    if (borderColor) {
        [borderColor setStroke];
    }
    if (backgroundColor) {
        [backgroundColor setFill];
    }
    bezierPath.lineWidth = borderWidth;
    rect = CGRectMake(borderWidth / 2, borderWidth / 2, HZRectWidth(rect) - borderWidth, HZRectHeight(rect) - borderWidth);
    CGFloat topRightRadius = 0,topLeftRadius = 0,bottomRightRadius = 0,bottomLeftRadius = 0;
    CGPoint topRightArcCenter,topLeftArcCenter,bottomRightArcCenter,bottomLeftArcCenter;
    
    if (rectCorner & UIRectCornerTopLeft) {
        topLeftRadius = cornerRadius;
    }
    if (rectCorner & UIRectCornerTopRight) {
        topRightRadius = cornerRadius;
    }
    if (rectCorner & UIRectCornerBottomLeft) {
        bottomLeftRadius = cornerRadius;
    }
    if (rectCorner & UIRectCornerBottomRight) {
        bottomRightRadius = cornerRadius;
    }
    
    if (arrowDirection == HZPopupMenuArrowDirectionTop) {
        topLeftArcCenter = CGPointMake(topLeftRadius + HZRectX(rect), arrowHeight + topLeftRadius + HZRectX(rect));
        topRightArcCenter = CGPointMake(HZRectWidth(rect) - topRightRadius + HZRectX(rect), arrowHeight + topRightRadius + HZRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + HZRectX(rect), HZRectHeight(rect) - bottomLeftRadius + HZRectX(rect));
        bottomRightArcCenter = CGPointMake(HZRectWidth(rect) - bottomRightRadius + HZRectX(rect), HZRectHeight(rect) - bottomRightRadius + HZRectX(rect));
        if (arrowPosition < topLeftRadius + arrowWidth / 2) {
            arrowPosition = topLeftRadius + arrowWidth / 2;
        }else if (arrowPosition > HZRectWidth(rect) - topRightRadius - arrowWidth / 2) {
            arrowPosition = HZRectWidth(rect) - topRightRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(arrowPosition - arrowWidth / 2, arrowHeight + HZRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition, HZRectTop(rect) + HZRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition + arrowWidth / 2, arrowHeight + HZRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) - topRightRadius, arrowHeight + HZRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) + HZRectX(rect), HZRectHeight(rect) - bottomRightRadius - HZRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + HZRectX(rect), HZRectHeight(rect) + HZRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectX(rect), arrowHeight + topLeftRadius + HZRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        
    }else if (arrowDirection == HZPopupMenuArrowDirectionBottom) {
        topLeftArcCenter = CGPointMake(topLeftRadius + HZRectX(rect),topLeftRadius + HZRectX(rect));
        topRightArcCenter = CGPointMake(HZRectWidth(rect) - topRightRadius + HZRectX(rect), topRightRadius + HZRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + HZRectX(rect), HZRectHeight(rect) - bottomLeftRadius + HZRectX(rect) - arrowHeight);
        bottomRightArcCenter = CGPointMake(HZRectWidth(rect) - bottomRightRadius + HZRectX(rect), HZRectHeight(rect) - bottomRightRadius + HZRectX(rect) - arrowHeight);
        if (arrowPosition < bottomLeftRadius + arrowWidth / 2) {
            arrowPosition = bottomLeftRadius + arrowWidth / 2;
        }else if (arrowPosition > HZRectWidth(rect) - bottomRightRadius - arrowWidth / 2) {
            arrowPosition = HZRectWidth(rect) - bottomRightRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(arrowPosition + arrowWidth / 2, HZRectHeight(rect) - arrowHeight + HZRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition, HZRectHeight(rect) + HZRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(arrowPosition - arrowWidth / 2, HZRectHeight(rect) - arrowHeight + HZRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + HZRectX(rect), HZRectHeight(rect) - arrowHeight + HZRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectX(rect), topLeftRadius + HZRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) - topRightRadius + HZRectX(rect), HZRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) + HZRectX(rect), HZRectHeight(rect) - bottomRightRadius - HZRectX(rect) - arrowHeight)];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        
    }else if (arrowDirection == HZPopupMenuArrowDirectionLeft) {
        topLeftArcCenter = CGPointMake(topLeftRadius + HZRectX(rect) + arrowHeight,topLeftRadius + HZRectX(rect));
        topRightArcCenter = CGPointMake(HZRectWidth(rect) - topRightRadius + HZRectX(rect), topRightRadius + HZRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + HZRectX(rect) + arrowHeight, HZRectHeight(rect) - bottomLeftRadius + HZRectX(rect));
        bottomRightArcCenter = CGPointMake(HZRectWidth(rect) - bottomRightRadius + HZRectX(rect), HZRectHeight(rect) - bottomRightRadius + HZRectX(rect));
        if (arrowPosition < topLeftRadius + arrowWidth / 2) {
            arrowPosition = topLeftRadius + arrowWidth / 2;
        }else if (arrowPosition > HZRectHeight(rect) - bottomLeftRadius - arrowWidth / 2) {
            arrowPosition = HZRectHeight(rect) - bottomLeftRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(arrowHeight + HZRectX(rect), arrowPosition + arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(HZRectX(rect), arrowPosition)];
        [bezierPath addLineToPoint:CGPointMake(arrowHeight + HZRectX(rect), arrowPosition - arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(arrowHeight + HZRectX(rect), topLeftRadius + HZRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) - topRightRadius, HZRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) + HZRectX(rect), HZRectHeight(rect) - bottomRightRadius - HZRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(arrowHeight + bottomLeftRadius + HZRectX(rect), HZRectHeight(rect) + HZRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        
    }else if (arrowDirection == HZPopupMenuArrowDirectionRight) {
        topLeftArcCenter = CGPointMake(topLeftRadius + HZRectX(rect),topLeftRadius + HZRectX(rect));
        topRightArcCenter = CGPointMake(HZRectWidth(rect) - topRightRadius + HZRectX(rect) - arrowHeight, topRightRadius + HZRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + HZRectX(rect), HZRectHeight(rect) - bottomLeftRadius + HZRectX(rect));
        bottomRightArcCenter = CGPointMake(HZRectWidth(rect) - bottomRightRadius + HZRectX(rect) - arrowHeight, HZRectHeight(rect) - bottomRightRadius + HZRectX(rect));
        if (arrowPosition < topRightRadius + arrowWidth / 2) {
            arrowPosition = topRightRadius + arrowWidth / 2;
        }else if (arrowPosition > HZRectHeight(rect) - bottomRightRadius - arrowWidth / 2) {
            arrowPosition = HZRectHeight(rect) - bottomRightRadius - arrowWidth / 2;
        }
        [bezierPath moveToPoint:CGPointMake(HZRectWidth(rect) - arrowHeight + HZRectX(rect), arrowPosition - arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) + HZRectX(rect), arrowPosition)];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) - arrowHeight + HZRectX(rect), arrowPosition + arrowWidth / 2)];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) - arrowHeight + HZRectX(rect), HZRectHeight(rect) - bottomRightRadius - HZRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + HZRectX(rect), HZRectHeight(rect) + HZRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectX(rect), arrowHeight + topLeftRadius + HZRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) - topRightRadius + HZRectX(rect) - arrowHeight, HZRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        
    }else if (arrowDirection == HZPopupMenuArrowDirectionNone) {
        topLeftArcCenter = CGPointMake(topLeftRadius + HZRectX(rect),  topLeftRadius + HZRectX(rect));
        topRightArcCenter = CGPointMake(HZRectWidth(rect) - topRightRadius + HZRectX(rect),  topRightRadius + HZRectX(rect));
        bottomLeftArcCenter = CGPointMake(bottomLeftRadius + HZRectX(rect), HZRectHeight(rect) - bottomLeftRadius + HZRectX(rect));
        bottomRightArcCenter = CGPointMake(HZRectWidth(rect) - bottomRightRadius + HZRectX(rect), HZRectHeight(rect) - bottomRightRadius + HZRectX(rect));
        [bezierPath moveToPoint:CGPointMake(topLeftRadius + HZRectX(rect), HZRectX(rect))];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) - topRightRadius, HZRectX(rect))];
        [bezierPath addArcWithCenter:topRightArcCenter radius:topRightRadius startAngle:M_PI * 3 / 2 endAngle:2 * M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectWidth(rect) + HZRectX(rect), HZRectHeight(rect) - bottomRightRadius - HZRectX(rect))];
        [bezierPath addArcWithCenter:bottomRightArcCenter radius:bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(bottomLeftRadius + HZRectX(rect), HZRectHeight(rect) + HZRectX(rect))];
        [bezierPath addArcWithCenter:bottomLeftArcCenter radius:bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(HZRectX(rect), arrowHeight + topLeftRadius + HZRectX(rect))];
        [bezierPath addArcWithCenter:topLeftArcCenter radius:topLeftRadius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
    }
    
    [bezierPath closePath];
    return bezierPath;
}

@end
