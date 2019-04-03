//
//  LhCategoryView.m
//  CategoryDemo
//
//  Created by saber on 2019/3/28.
//  Copyright © 2019 saber. All rights reserved.
//

#import "LhCategoryView.h"

@implementation LhCategoryView

//lazy load
- (UIButton *)buttonMore{
    if (!_buttonMore) {
        _buttonMore = [[UIButton alloc]init];
        [_buttonMore setTitle:@"更多" forState:UIControlStateNormal];
        [_buttonMore setTitleColor:self.titleColor forState:UIControlStateNormal];
        _buttonMore.titleLabel.font = [UIFont systemFontOfSize:self.fontSize];
        [_buttonMore setTag:520];
        self.sizeMore = [self fitSizeWithViewMaxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) text:_buttonMore.titleLabel.text];
        [_buttonMore addTarget:self action:@selector(showAllCategories) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonMore;
}

- (instancetype)initWithFrame:(CGRect)frame
                     maxWidth:(CGFloat)maxWidth
                    maxHeight:(CGFloat)maxHeight
                    lineStyle:(LineStyle)linstyle
                  selectStyle:(SelectStyle)selectstyle{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.maxWidth = maxWidth;
        self.maxHeight = maxHeight;
        self.lineStyle = linstyle;
        self.selectStyle = selectstyle;
        self.arrayItems = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                     maxWidth:(CGFloat)maxWidth
                    maxHeight:(CGFloat)maxHeight
                    lineStyle:(LineStyle)linstyle
                  selectStyle:(SelectStyle)selectstyle column:(NSInteger)column itemHeight:(CGFloat)itemHeight{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.maxWidth = maxWidth;
        self.maxHeight = maxHeight;
        self.lineStyle = linstyle;
        self.column = column;
        self.itemHeight = itemHeight;
        self.selectStyle = selectstyle;
        self.arrayItems = [NSMutableArray array];
    }
    return self;
}

//
- (void)setFrame:(CGRect)frame{
    if (self.height > self.maxHeight) {
        [self setContentSize:CGSizeMake(frame.size.width, self.height)];
        frame.size = CGSizeMake(frame.size.width,self.maxHeight);
        [super setFrame:frame];
    }else{
        [super setFrame:frame];
    }
}

- (void)setModel:(LhCategoryModel *)model{
    self.arrayTitle = model.arrayTitle;
    self.isShowMoreButton = model.isShowMoreButton;
    self.maxLine = model.maxLine;
    self.layerRadius = model.layerRadius;
    self.isNeedRadius = model.isNeedRadius;
    self.borderColor = model.borderColor;
    self.borderWidth = model.borderWidth;
    self.contentInsets = model.contentInsets;
    self.titleColor = model.titleColor;
    self.fontSize = model.fontSize;
    self.radiusType = model.radiusType;
    self.commonMargin = model.commonMargin;
    self.lineMargin = model.lineMargin;
    self.buttonHeightLightedBackGroundColor = model.buttonHeightLightedBackGroundColor;
    self.buttonBackGroundColor = model.buttonBackGroundColor;
    [self buttonMore];
    if (self.lineStyle == LineStyleUnEqual) {
        [self getHeightAndLayoutButtonsUnEqual];
    }else{
        [self getHeightAndLayoutButtonsEqual];
    }
}
//等分 按钮
- (void)getHeightAndLayoutButtonsEqual{
    if (_arrayTitle.count == 0) {
        return;
    }
    //行数
    NSInteger line = ceilf(_arrayTitle.count/3.0);
    self.height = line*_itemHeight + (line-1)*_lineMargin;
    for (int i = 0; i < _arrayTitle.count; i++) {
        NSString * title = _arrayTitle[i];
        //每个按钮宽度
        CGFloat width = (self.maxWidth - (_column-1)*_commonMargin)/_column;
        CGFloat height = _itemHeight;
        CategoryItem * button = [[CategoryItem alloc]init];
        [button setTag:i+1000];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:self.titleColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:self.fontSize];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        if (self.radiusType == RadiusStyleCommon) {
            button.layer.cornerRadius = self.layerRadius;
        }else if (self.radiusType == RadiusStyleHalfCircle){
            button.layer.cornerRadius = (height)/2;
        }else{
            button.layer.cornerRadius = 0;
        }
        button.layer.masksToBounds = self.isNeedRadius;
        button.layer.borderColor = self.borderColor.CGColor;
        button.layer.borderWidth = self.borderWidth;
        button.frame = CGRectMake(i%3*(width+_commonMargin), i/3*(height+_lineMargin), width, height);
        [self addSubview:button];
    }
}
//不等分 自适应按钮宽度
- (void)getHeightAndLayoutButtonsUnEqual{
    int line = 1;
    for (int i = 0; i < _arrayTitle.count; i++) {
        NSString * title = _arrayTitle[i];
        CategoryItem * button = [[CategoryItem alloc]init];
        [button setTag:i+1000];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:self.titleColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:self.fontSize];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGSize size = [self fitSizeWithViewMaxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) text:title];
        size = CGSizeMake(size.width+20, size.height+10);
        if (self.radiusType == RadiusStyleCommon) {
            button.layer.cornerRadius = self.layerRadius;
        }else if (self.radiusType == RadiusStyleHalfCircle){
            button.layer.cornerRadius = (size.height)/2;
        }else{
            button.layer.cornerRadius = 0;
        }
        button.layer.masksToBounds = self.isNeedRadius;
        button.layer.borderColor = self.borderColor.CGColor;
        button.layer.borderWidth = self.borderWidth;
        [self addSubview:button];
        if (i == 0) {
            button.frame = CGRectMake(0, 0, size.width, size.height);
        }else{
            //判断当前button 是否能放下
            CategoryItem * buttonPre = (CategoryItem *)[self viewWithTag:i+1000-1];
            if (line == _maxLine) {
                if (self.isShowMoreButton) {
                    if (buttonPre.frame.origin.x + buttonPre.frame.size.width + size.width + _commonMargin > _maxWidth - _sizeMore.width - _commonMargin) {
                        if ([self.buttonMore isDescendantOfView:self]) {
                            self.height = line*size.height + (line-1)*_lineMargin;
                            return;
                        }
                        //展示更多
                        self.buttonMore.frame = CGRectMake(CGRectGetMaxX(buttonPre.frame)+_commonMargin, CGRectGetMinY(buttonPre.frame)+(buttonPre.frame.size.height-_sizeMore.height)/2, _sizeMore.width, _sizeMore.height);
                        [self addSubview:_buttonMore];
                        self.height = line*size.height + (line-1)*_lineMargin;
                        return;
                    }else{
                        button.frame = CGRectMake(CGRectGetMaxX(buttonPre.frame)+_commonMargin, CGRectGetMinY(buttonPre.frame), size.width, size.height);
                    }
                }else{
                    if (buttonPre.frame.origin.x + buttonPre.frame.size.width + size.width + _commonMargin > _maxWidth) {
                        self.height = line*size.height + (line-1)*_lineMargin;
                        return;
                    }else{
                        button.frame = CGRectMake(CGRectGetMaxX(buttonPre.frame)+_commonMargin, CGRectGetMinY(buttonPre.frame), size.width, size.height);
                    }
                }
            }else{
                if (self.isShowMoreButton) {
                    if (buttonPre.frame.origin.x + buttonPre.frame.size.width + size.width + _commonMargin > _maxWidth - _commonMargin) {
                        //判断是否是最后一个
                        if (i == self.arrayTitle.count-1) {
                            if ([self.buttonMore isDescendantOfView:self]) {
                                self.height = line*size.height + (line-1)*_lineMargin;
                                return;
                            }
                            //展示更多
                            self.buttonMore.frame = CGRectMake(CGRectGetMaxX(buttonPre.frame)+_commonMargin, CGRectGetMinY(buttonPre.frame)+(buttonPre.frame.size.height-_sizeMore.height)/2, _sizeMore.width, _sizeMore.height);
                            [self addSubview:_buttonMore];
                            self.height = line*size.height + (line-1)*_lineMargin;
                            return;
                        }else{
                            //换行
                            button.frame = CGRectMake(0, CGRectGetMaxY(buttonPre.frame)+_lineMargin, size.width, size.height);
                            line++;
                        }
                    }else{
                        //判断是否是最后一个
                        if (i == self.arrayTitle.count-1) {
                            if ([self.buttonMore isDescendantOfView:self]) {
                                self.height = line*size.height + (line-1)*_lineMargin;
                                return;
                            }
                            //展示更多
                            self.buttonMore.frame = CGRectMake(CGRectGetMaxX(buttonPre.frame)+_commonMargin, CGRectGetMinY(buttonPre.frame)+(buttonPre.frame.size.height-_sizeMore.height)/2, _sizeMore.width, _sizeMore.height);
                            [self addSubview:_buttonMore];
                            self.height = line*size.height + (line-1)*_lineMargin;
                            return;
                        }else{
                            button.frame = CGRectMake(CGRectGetMaxX(buttonPre.frame)+_commonMargin, CGRectGetMinY(buttonPre.frame), size.width, size.height);
                        }
                    }
                }else{
                    if (buttonPre.frame.origin.x + buttonPre.frame.size.width + size.width + _commonMargin > _maxWidth) {
                        //换行
                        button.frame = CGRectMake(0, CGRectGetMaxY(buttonPre.frame)+_lineMargin, size.width, size.height);
                        line++;
                    }else{
                        button.frame = CGRectMake(CGRectGetMaxX(buttonPre.frame)+_commonMargin, CGRectGetMinY(buttonPre.frame), size.width, size.height);
                    }
                }
            }
        }
        self.height = line*size.height + (line-1)*_lineMargin;
    }
}

- (void)buttonClick:(CategoryItem*)sender{
    if (self.selectStyle == SelectStyleSingle) {
        [self.arrayItems removeAllObjects];
        //单选
        for (UIView* button in self.subviews) {
            if (button.tag != 520) {
                button.layer.borderWidth = self.borderWidth;
                button.layer.borderColor = self.borderColor.CGColor;
                if ([button isEqual:sender]) {
                    button.backgroundColor = self.buttonHeightLightedBackGroundColor;
                    if ([self.categoryDelegate respondsToSelector:@selector(itemClick:categoryView:)]) {
                        [self.arrayItems addObject:sender];
                        [self.categoryDelegate itemClick:_arrayItems categoryView:self];
                    }
                }else{
                    button.backgroundColor = self.buttonBackGroundColor;
                }
            }
        }
    }else if (self.selectStyle == SelectStyleMultiple){
        for (UIView* button in self.subviews) {
            button.layer.borderWidth = self.borderWidth;
            button.layer.borderColor = self.borderColor.CGColor;
            if ([button isEqual:sender]) {
                CategoryItem * item = (CategoryItem*)button;
                if (item.statues) {
                    [self.arrayItems removeObject:item];
                    button.backgroundColor = self.buttonBackGroundColor;
                    item.statues = NO;
                }else{
                    [self.arrayItems addObject:item];
                    button.backgroundColor = self.buttonHeightLightedBackGroundColor;
                    item.statues = YES;;
                }
            }
        }
        if ([self.categoryDelegate respondsToSelector:@selector(itemClick:categoryView:)]) {
            [self.categoryDelegate itemClick:_arrayItems categoryView:self];
        }
    }
}

- (void)reloadData:(LhCategoryModel*)model{
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
    self.model = model;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.height);
}

- (void)showAllCategories{
    if ([self.delegate respondsToSelector:@selector(showAllCategories)]) {
        [self.categoryDelegate showAllCategories];
    }
}

- (CGSize)fitSizeWithViewMaxSize:(CGSize)maxSize text:(NSString*)text{
    if (!text) {
        return CGSizeZero;
    }
    UIFont * font = [UIFont systemFontOfSize:self.fontSize];
    CGRect rect = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil];
    CGSize fitSize = rect.size;
    return fitSize;
}

@end
