//
//  JEECollectTableViewCell.h
//  JEECollectCell
//
//  Created by ZhangJunjee on 14-6-18.
//  Copyright (c) 2014年 junjee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JEECollectView;
@class JEECollectCellMainView;

///收藏与取消收藏商家代理方法
@protocol JEECellCollectDelegate

@required
/**
 *	@brief	收藏方法
 *
 *	@param 	index 	cell所在位置
 */
- (void)collectCellAtIndex:(NSIndexPath *)index;

/**
 *	@brief	取消收藏方法
 *
 *	@param 	index 	cell所在位置
 */
- (void)cancleCollectAtIndex:(NSIndexPath *)index;

/**
 *	@brief	选中cell方法（scrollView覆盖了cell导致tableView的selected方法无法触发，以此代替）
 *
 *	@param 	index 	cell所在位置
 */
- (void)selectCellAtIndex:(NSIndexPath *)index;


@end

@interface JEECollectTableViewCell : UITableViewCell<UIScrollViewDelegate>
{
    @private
    JEECollectView *_collectView;
    UIScrollView *_scroll_MainView;
    BOOL _isCollectChanged;
    BOOL _isAnimationStop;
}

@property (nonatomic, strong)JEECollectCellMainView *cellMainView;
@property (nonatomic, assign)CGFloat height;
///是否被收藏
@property (nonatomic, assign)BOOL collected;
///商家cell所对应在商家列表中的位置
@property (nonatomic, strong)NSIndexPath *cellIndexPath;
///商家cell的代理方法
@property (nonatomic, strong)id<JEECellCollectDelegate> delegate;

@end
