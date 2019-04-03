//
//  LhCategoryView.h
//  CategoryDemo
//
//  Created by saber on 2019/3/28.
//  Copyright © 2019 saber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LhCategoryModel.h"
#import "CategoryItem.h"
@class LhCategoryView;
@protocol LhCategoryDelegate <NSObject>

/**show more*/
- (void)showAllCategories;
/**item click*/
- (void)itemClick:(NSArray<CategoryItem *>* )arrayItems categoryView:(LhCategoryView*)categoryView;

@end
@interface LhCategoryView : UIScrollView

/**更多按钮*/
@property (nonatomic, strong) UIButton *buttonMore;
/**更多按钮尺寸*/
@property (nonatomic, assign) CGSize sizeMore;
/**是否展示更多按钮 默认不展示*/
@property (nonatomic, assign) BOOL isShowMoreButton;
/**标题数组*/
@property (nonatomic, strong) NSArray *arrayTitle;
/**最大行数哦 默认不做限制*/
@property (nonatomic, assign) NSInteger maxLine;
/**尺寸*/
@property (nonatomic, assign) CGFloat fontSize;
/**字体颜色 默认黑色*/
@property (nonatomic, strong) UIColor * titleColor;
/**按钮背景色*/
@property (nonatomic, strong) UIColor * buttonBackGroundColor;
/**选中的背景色*/
@property (nonatomic, strong) UIColor * buttonHeightLightedBackGroundColor;
/**内边距*/
@property (nonatomic, assign) UIEdgeInsets contentInsets;
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
/**高度*/
@property (nonatomic, assign) CGFloat height;
/**最大宽度*/
@property (nonatomic, assign) CGFloat maxWidth;
/**最大高度*/
@property (nonatomic, assign) CGFloat maxHeight;
/**LineStyle*/
@property (nonatomic, assign) LineStyle lineStyle;
/**model*/
@property (nonatomic, strong) LhCategoryModel * model;
/**列数 ：针对等分情况*/
@property (nonatomic, assign) NSInteger column;
/**每个按钮的高度 针对等分情况*/
@property (nonatomic, assign) CGFloat itemHeight;
/**单选或多选*/
@property (nonatomic, assign) SelectStyle selectStyle;
/**保存选中的item （单选唯一）*/
@property (nonatomic, strong) NSMutableArray *arrayItems;
/**delegate*/
@property (nonatomic, weak) id<LhCategoryDelegate> categoryDelegate;
/**参数：frame 最大宽度 最大高度 不等分 单选或多选*/
- (instancetype)initWithFrame:(CGRect)frame
                        maxWidth:(CGFloat)maxWidth
                        maxHeight:(CGFloat)maxHeight
                        lineStyle:(LineStyle)linstyle
                        selectStyle:(SelectStyle)selectstyle;
/**参数：frame 最大宽度 最大高度 等分 单选或多选 高度*/
- (instancetype)initWithFrame:(CGRect)frame
                     maxWidth:(CGFloat)maxWidth
                    maxHeight:(CGFloat)maxHeight
                    lineStyle:(LineStyle)linstyle
                  selectStyle:(SelectStyle)selectstyle column:(NSInteger)column itemHeight:(CGFloat)itemHeight;
/**reload data*/
- (void)reloadData:(LhCategoryModel*)model;

@end
