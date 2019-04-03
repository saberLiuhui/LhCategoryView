//
//  ViewController.m
//  CategoryDemo
//
//  Created by saber on 2019/3/27.
//  Copyright © 2019 saber. All rights reserved.
//

#import "ViewController.h"
#import "LhCategoryView.h"
#import "LhCategoryModel.h"
#import "TestViewController.h"

@interface ViewController ()<LhCategoryDelegate>

@property (nonatomic, strong) LhCategoryView * categoryView;
@property (nonatomic, strong) LhCategoryView * categoryView2;
@property (nonatomic, strong) LhCategoryModel * model;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSArray * arrar = @[@"依附",@"奢侈品",@"时装",@"导购员",@"导购员导购员",@"好的嘛",@"三二一",@"九",@"五五五五五五",@"六六六",@"七",@"琪琪琪琪琪琪",@"服装",@"导",@"导购员导购员"];
    self.model = [[LhCategoryModel alloc]init];
    _model.arrayTitleParameter(arrar).fontSizeParameter(14.0).titleColorParameter([UIColor purpleColor]).isShowMoreButtonParameter(YES).maxLineParameter(3).commonMarginParameter(16).lineMarginParameter(10);
    
    //test
    self.categoryView = [[LhCategoryView alloc]initWithFrame:CGRectZero maxWidth:self.view.frame.size.width-2*16 maxHeight:100 lineStyle:LineStyleUnEqual selectStyle:SelectStyleSingle];
    _categoryView.categoryDelegate = self;
    _categoryView.model = _model;
    [self.view addSubview:_categoryView];
    _categoryView.frame = CGRectMake(16, 0, self.view.frame.size.width-16*2, _categoryView.height);
    
    self.categoryView2 = [[LhCategoryView alloc]initWithFrame:CGRectZero maxWidth:self.view.frame.size.width-2*16 maxHeight:100 lineStyle:LineStyleEqual selectStyle:SelectStyleMultiple column:3 itemHeight:30];
    _categoryView2.categoryDelegate = self;
    _categoryView2.model = _model;
    [self.view addSubview:_categoryView2];
    _categoryView2.frame = CGRectMake(16, 200, self.view.frame.size.width-16*2, _categoryView2.height);
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(100, 400, 100, 44)];
    [button setTitle:@"reload data" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(reloadCategoryData) forControlEvents:UIControlEventTouchUpInside];
}

- (void)itemClick:(NSArray<CategoryItem *> *)arrayItems categoryView:(LhCategoryView *)categoryView{
    if ([categoryView isEqual:_categoryView]) {
        NSLog(@"================ category ======================");
    }else if([categoryView isEqual:_categoryView2]){
        NSLog(@"---------------- category2 ---------------------");
    }
    
    for (CategoryItem * item in arrayItems) {
        NSLog(@"category title = %@",item.titleLabel.text);
    }
    
    if ([categoryView isEqual:_categoryView]) {
        NSLog(@"================ category ======================");
    }else if([categoryView isEqual:_categoryView2]){
        NSLog(@"---------------- category2 ---------------------");
    }
}

- (void)showAllCategories{
    NSLog(@"show all categories");
//    return;
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    LhCategoryModel * model = [[LhCategoryModel alloc]init];
    model = _model;
    model.isShowMoreButton = NO;
    model.maxLine = NSIntegerMax;
    [_categoryView reloadData:model];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.navigationController pushViewController:[TestViewController new] animated:YES];
    //reloaddata
    
}

- (void)reloadCategoryData{
    NSArray * arrar = @[@"依",@"奢侈品",@"奢侈品",@"奢侈品",@"奢侈品",@"奢侈品",@"时装",@"导购员",@"导购员导购员",@"好的嘛",@"三二一",@"九",@"五五五五五五",@"六六六",@"七",@"琪琪琪琪琪琪",@"服装",@"导",@"导购员导购员"];
    _model.arrayTitleParameter(arrar);
    [_categoryView reloadData:_model];
    
    [_categoryView2 reloadData:_model];
}

@end
