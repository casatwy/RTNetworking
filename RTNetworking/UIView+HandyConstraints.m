//
//  UIView+HandyConstraints.m
//  AnjukeHD
//
//  Created by casa on 14-1-7.
//  Copyright (c) 2014年 Anjuke Inc. All rights reserved.
//

#import "UIView+HandyConstraints.h"

@implementation UIView (HandyConstraints)

- (NSLayoutConstraint *)constraintWidth:(CGFloat)width
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:0
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0f
                                         constant:width];
}

- (NSLayoutConstraint *)constraintHeight:(CGFloat)height
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:0
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0f
                                         constant:height];
}

- (NSArray *)constraintArrayWithSize:(CGSize)size
{
    NSLayoutConstraint *widthConstraint = [self constraintWidth:size.width];
    NSLayoutConstraint *heightConstraint = [self constraintHeight:size.height];
    return @[widthConstraint, heightConstraint];
}


- (NSLayoutConstraint *)constraintHeightEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeHeight
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintWidthEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeWidth
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintCenterYEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeCenterY
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeCenterY
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintCenterXEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeCenterX
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeCenterX
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSArray *)constraintArrayFillHeightInSuperview
{
    UIView *view = self;
    return [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|"
                                                   options:0
                                                   metrics:nil
                                                     views:NSDictionaryOfVariableBindings(view)];
}

- (NSArray *)constraintArrayFillWidthInSuperview
{
    UIView *view = self;
    return [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|"
                                                   options:0
                                                   metrics:nil
                                                     views:NSDictionaryOfVariableBindings(view)];
}

- (NSLayoutConstraint *)constraintTopEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeTop
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeTop
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintBottomEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintLeftEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeLeft
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeLeft
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)constraintRightEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeRight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view
                                        attribute:NSLayoutAttributeRight
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSArray *)constraintArraySizeEqualToView:(UIView *)view
{
    return [self constraintArrayWithSize:view.frame.size];
}

- (NSArray *)constraintArrayFillInSuperview
{
    NSMutableArray *constraints = [[NSMutableArray alloc] initWithArray:[self constraintArrayFillWidthInSuperview]];
    [constraints addObjectsFromArray:[self constraintArrayFillHeightInSuperview]];
    return constraints;
}

@end
