//
//  UIView+HandyConstraints.h
//  AnjukeHD
//
//  Created by casa on 14-1-7.
//  Copyright (c) 2014年 Anjuke Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HandyConstraints)

/* 根据给定数字设置长宽 */
- (NSLayoutConstraint *)constraintWidth:(CGFloat)width;
- (NSLayoutConstraint *)constraintHeight:(CGFloat)height;
- (NSArray *)constraintArrayWithSize:(CGSize)size;

/* 根据其它view的长宽来设置长宽 */
- (NSLayoutConstraint *)constraintHeightEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintWidthEqualToView:(UIView *)view;
- (NSArray *)constraintArraySizeEqualToView:(UIView *)view;

/* 上下左右与其它view对齐 */
- (NSLayoutConstraint *)constraintTopEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintBottomEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintLeftEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintRightEqualToView:(UIView *)view;

/* 横向或纵向填充整个屏幕 */
- (NSArray *)constraintArrayFillHeightInSuperview;
- (NSArray *)constraintArrayFillWidthInSuperview;
- (NSArray *)constraintArrayFillInSuperview;

/* 设置中心位置 */
- (NSLayoutConstraint *)constraintCenterYEqualToView:(UIView *)view;
- (NSLayoutConstraint *)constraintCenterXEqualToView:(UIView *)view;

@end
