//
//  JEECollectCellMainView.h
//  JEECollectCell
//
//  Created by ZhangJunjee on 14-6-18.
//  Copyright (c) 2014年 junjee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JEECollectCellMainView : UIView
{
    UIView *_line;
    /////标识商家是否被收藏的标注
    UIView *_view_collectTag;
}

///当前商家是否被收藏
@property (nonatomic, assign)BOOL collected;
///高度
@property (nonatomic, assign)CGFloat height;

@end
