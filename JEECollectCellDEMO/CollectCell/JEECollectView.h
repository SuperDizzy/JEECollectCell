//
//  JEECollectView.h
//  JEECollectCell
//
//  Created by ZhangJunjee on 14-6-18.
//  Copyright (c) 2014年 junjee. All rights reserved.
//

#import <UIKit/UIKit.h>

///左滑收藏视图
@interface JEECollectView : UIView

///收藏图标
@property (nonatomic, strong)UIImageView *img_defaultCollectView;
///未藏图标
@property (nonatomic, strong)UIImageView *img_dragCollectView;
///是否被收藏
@property (nonatomic, assign)BOOL collected;
///视图高度
@property (nonatomic, assign)CGFloat height;

///拖拽改变收藏状态
- (void)dragToChangeImage;
///拖拽改回收藏状态
- (void)dragToChangeBackImage;

@end
