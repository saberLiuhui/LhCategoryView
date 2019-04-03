//
//  LhCategoryModel.m
//  CategoryDemo
//
//  Created by saber on 2019/3/28.
//  Copyright © 2019 saber. All rights reserved.
//

#import "LhCategoryModel.h"

@implementation LhCategoryModel

- (instancetype)init{
    if (self = [super init]) {
        [self initializeParameter];
    }
    return self;
}
//初始化一些参数
- (void)initializeParameter{
    self.isShowMoreButton = YES;
    self.maxLine = NSIntegerMax;
    self.layerRadius = 5.0;
    self.isNeedRadius = YES;
    self.borderColor = [UIColor redColor];
    self.borderWidth = 1.0f;
    self.contentInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    self.titleColor = [UIColor blackColor];
    self.fontSize = 14.0;
    self.radiusType = RadiusStyleHalfCircle;
    self.commonMargin = 16;
    self.lineMargin = 16;
    self.buttonBackGroundColor = [UIColor clearColor];
    self.buttonHeightLightedBackGroundColor = self.borderColor;
}
/**属性*/
- (LhCategoryModel *(^)(NSArray *))arrayTitleParameter
{
    return ^(NSArray *arrayTitle) {
        self.arrayTitle = arrayTitle;
        return self;
    };
}
- (LhCategoryModel *(^)(CGFloat))fontSizeParameter
{
    return ^(CGFloat fontSize) {
        self.fontSize = fontSize;
        return self;
    };
}
- (LhCategoryModel *(^)(UIEdgeInsets))contentInsetsParameter
{
    return ^(UIEdgeInsets contentInsets) {
        self.contentInsets = contentInsets;
        return self;
    };
}
- (LhCategoryModel *(^)(BOOL))isShowMoreButtonParameter
{
    return ^(BOOL isShowMoreButton) {
        self.isShowMoreButton = isShowMoreButton;
        return self;
    };
}
- (LhCategoryModel *(^)(NSInteger))maxLineParameter
{
    return ^(NSInteger maxLine) {
        self.maxLine = maxLine;
        return self;
    };
}
- (LhCategoryModel *(^)(UIColor *))titleColorParameter
{
    return ^(UIColor *titleColor) {
        self.titleColor = titleColor;
        return self;
    };
}
- (LhCategoryModel *(^)(UIColor *))borderColorParameter
{
    return ^(UIColor *borderColor) {
        self.borderColor = borderColor;
        return self;
    };
}
- (LhCategoryModel *(^)(CGFloat))borderWidthParameter
{
    return ^(CGFloat borderWidth) {
        self.borderWidth = borderWidth;
        return self;
    };
}
- (LhCategoryModel *(^)(CGFloat))layerRadiusParameter
{
    return ^(CGFloat layerRadius) {
        self.layerRadius = layerRadius;
        return self;
    };
}
- (LhCategoryModel *(^)(BOOL))isNeedRadiusParameter
{
    return ^(BOOL isNeedRadius) {
        self.isNeedRadius = isNeedRadius;
        return self;
    };
}
- (LhCategoryModel *(^)(RadiusType))radiusTypeParameter
{
    return ^(RadiusType radiusType) {
        self.radiusType = radiusType;
        return self;
    };
}
- (LhCategoryModel *(^)(CGFloat))commonMarginParameter
{
    return ^(CGFloat commonMargin) {
        self.commonMargin = commonMargin;
        return self;
    };
}
- (LhCategoryModel *(^)(CGFloat))lineMarginParameter
{
    return ^(CGFloat lineMargin) {
        self.lineMargin = lineMargin;
        return self;
    };
}
- (LhCategoryModel *(^)(UIColor *))buttonBackGroundColorParameter
{
    return ^(UIColor *buttonBackGroundColor) {
        self.buttonBackGroundColor = buttonBackGroundColor;
        return self;
    };
}
- (LhCategoryModel *(^)(UIColor *))buttonHeightLightedBackGroundColorParameter
{
    return ^(UIColor *buttonHeightLightedBackGroundColor) {
        self.buttonHeightLightedBackGroundColor = buttonHeightLightedBackGroundColor;
        return self;
    };
}


@end
