//
//  LhCategoryModel.h
//  CategoryDemo
//
//  Created by saber on 2019/3/28.
//  Copyright © 2019 saber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, RadiusType) {
    RadiusStyleCommon,              //五个Radius的圆角
    RadiusStyleHalfCircle,          //半圆圆角
    RectangleStyle,                 //矩形
};
/**排列样式 等分 不等分*/
typedef NS_ENUM(NSUInteger, LineStyle) {
    LineStyleEqual,                  //等分
    LineStyleUnEqual,                //不等分
};
/**选择样式 单选 多选*/
typedef NS_ENUM(NSUInteger, SelectStyle) {
    SelectStyleSingle,                  //单选
    SelectStyleMultiple,                //多选
};

@interface LhCategoryModel : NSObject

/**标题数组*/
@property (nonatomic, strong) NSArray *arrayTitle;
/**尺寸*/
@property (nonatomic, assign) CGFloat fontSize;
/**内边距*/
@property (nonatomic, assign) UIEdgeInsets contentInsets;
/**是否展示更多按钮 默认不展示*/
@property (nonatomic, assign) BOOL isShowMoreButton;
/**最大行数哦 默认不做限制*/
@property (nonatomic, assign) NSInteger maxLine;
/**字体颜色 默认黑色*/
@property (nonatomic, strong) UIColor * titleColor;
/**边框颜色*/
@property (nonatomic, strong) UIColor * borderColor;
/**边框宽度*/
@property (nonatomic, assign) CGFloat borderWidth;
/**边框 layer 圆角*/
@property (nonatomic, assign) CGFloat layerRadius;
/**是否需要圆角*/
@property (nonatomic, assign) BOOL isNeedRadius;
/**圆角style*/
@property (nonatomic, assign) RadiusType radiusType;
/**左右间距 common*/
@property (nonatomic, assign) CGFloat commonMargin;
/**上下间距*/
@property (nonatomic, assign) CGFloat lineMargin;
/**按钮背景色*/
@property (nonatomic, strong) UIColor * buttonBackGroundColor;
/**选中的背景色*/
@property (nonatomic, strong) UIColor * buttonHeightLightedBackGroundColor;

//
@property (nonatomic, copy, readonly) LhCategoryModel *(^arrayTitleParameter)(NSArray *arrayTitle);
@property (nonatomic, copy, readonly) LhCategoryModel *(^fontSizeParameter)(CGFloat fontSize);
@property (nonatomic, copy, readonly) LhCategoryModel *(^contentInsetsParameter)(UIEdgeInsets contentInsets);
@property (nonatomic, copy, readonly) LhCategoryModel *(^isShowMoreButtonParameter)(BOOL isShowMoreButton);
@property (nonatomic, copy, readonly) LhCategoryModel *(^maxLineParameter)(NSInteger maxLine);
@property (nonatomic, copy, readonly) LhCategoryModel *(^titleColorParameter)(UIColor *titleColor);
@property (nonatomic, copy, readonly) LhCategoryModel *(^borderColorParameter)(UIColor *borderColor);
@property (nonatomic, copy, readonly) LhCategoryModel *(^borderWidthParameter)(CGFloat borderWidth);
@property (nonatomic, copy, readonly) LhCategoryModel *(^layerRadiusParameter)(CGFloat layerRadius);
@property (nonatomic, copy, readonly) LhCategoryModel *(^isNeedRadiusParameter)(BOOL isNeedRadius);
@property (nonatomic, copy, readonly) LhCategoryModel *(^radiusTypeParameter)(RadiusType radiusType);
@property (nonatomic, copy, readonly) LhCategoryModel *(^commonMarginParameter)(CGFloat commonMargin);
@property (nonatomic, copy, readonly) LhCategoryModel *(^lineMarginParameter)(CGFloat lineMargin);
@property (nonatomic, copy, readonly) LhCategoryModel *(^buttonBackGroundColorParameter)(UIColor *buttonBackGroundColor);
@property (nonatomic, copy, readonly) LhCategoryModel *(^buttonHeightLightedBackGroundColorParameter)(UIColor *buttonHeightLightedBackGroundColor);


@end
