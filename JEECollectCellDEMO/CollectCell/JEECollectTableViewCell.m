//
//  JEECollectTableViewCell.m
//  JEECollectCell
//
//  Created by ZhangJunjee on 14-6-18.
//  Copyright (c) 2014年 junjee. All rights reserved.
//

#import "JEECollectTableViewCell.h"
#import "JEECollectView.h"
#import "JEECollectCellMainView.h"

@interface JEECollectTableViewCell()

///收起商家视图后的自然弹起动画
- (void)hiddeSupplierViewAnimation;
///收起商家视图
- (void)hiddeSupplier;

@end

@implementation JEECollectTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cellMainView = [[JEECollectCellMainView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.height)];
        _collectView = [[JEECollectView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, self.height-1)];
        _scroll_MainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.height)];
        [_scroll_MainView setScrollsToTop:NO];
        [_scroll_MainView setDelegate:self];
        [_scroll_MainView setContentSize:CGSizeMake(2*[UIScreen mainScreen].bounds.size.width, self.height-1)];
        [_scroll_MainView setShowsHorizontalScrollIndicator:NO];
        [_scroll_MainView setShowsVerticalScrollIndicator:NO];
        [_scroll_MainView setBounces:NO];
        [_scroll_MainView addSubview:_cellMainView];
        [_scroll_MainView addSubview:_collectView];
        [self addSubview:_scroll_MainView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectCell)];
        [_scroll_MainView addGestureRecognizer:tapGesture];
        _isAnimationStop = YES;
    }
    return self;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [scrollView setContentOffset:scrollView.contentOffset animated:NO];
    [self hiddeSupplier];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self hiddeSupplier];
}

- (void)selectCell
{
    [self.delegate selectCellAtIndex:self.cellIndexPath];
}

- (void)setHeight:(CGFloat)height
{
    _height = height;
    [_cellMainView setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.height)];
    [_collectView setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, self.height)];
    [_scroll_MainView setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.height)];
    _cellMainView.height = height;
    _collectView.height = height;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x > 90)
    {
        [_collectView dragToChangeImage];
    }
    else
    {
        [_collectView dragToChangeBackImage];
    }
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setCollected:(BOOL)collected
{
    _collected = collected;
    _collectView.collected = collected;
    _cellMainView.collected = collected;
}

- (void)hiddeSupplierViewAnimation
{
    [UIView animateWithDuration:0.5 animations:^{
        [_collectView setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 8, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    } completion:^(BOOL finished) {
        if (_isCollectChanged)
        {
            self.collected = !_collectView.collected;
        }
        [UIView animateWithDuration:0.5 animations:^{
            [_collectView setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void)hiddeSupplier
{
    if (_isAnimationStop)
    {
        if (_scroll_MainView.contentOffset.x > 90)
        {
            [_collectView dragToChangeImage];
            _isCollectChanged = YES;
        }
        else
        {
            [_collectView dragToChangeBackImage];
            _isCollectChanged = NO;
        }
        if (_isCollectChanged)
        {
            if (!_collectView.collected)
                [self.delegate collectCellAtIndex:self.cellIndexPath];
            else
                [self.delegate cancleCollectAtIndex:self.cellIndexPath];
        }
        [UIView animateWithDuration:0.6f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _isAnimationStop = NO;
            [_scroll_MainView setContentOffset:CGPointMake(0, 0) animated:NO];
        } completion:^(BOOL finished) {
            _isAnimationStop = YES;
            if (_isCollectChanged)
                [self hiddeSupplierViewAnimation];
        }];
    }
    
}

@end
