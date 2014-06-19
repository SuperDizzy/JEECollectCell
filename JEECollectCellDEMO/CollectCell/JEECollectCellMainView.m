//
//  JEECollectCellMainView.m
//  JEECollectCell
//
//  Created by ZhangJunjee on 14-6-18.
//  Copyright (c) 2014年 junjee. All rights reserved.
//
#define DEFAULT_TAGWIDTH 4

#import "JEECollectCellMainView.h"

@implementation JEECollectCellMainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _view_collectTag = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - DEFAULT_TAGWIDTH, 0, DEFAULT_TAGWIDTH, frame.size.height)];
        [_view_collectTag setBackgroundColor:MAIN_COLOR];
        [_view_collectTag setHidden:YES];
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-1, [UIScreen mainScreen].bounds.size.width, 1)];
        [_line setBackgroundColor:[UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1]];
        
        [self addSubview:_line];
        [self addSubview:_view_collectTag];
    }
    return self;
}

- (void)setHeight:(CGFloat)height
{
    _height = height;
    [_view_collectTag setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - DEFAULT_TAGWIDTH, 0, DEFAULT_TAGWIDTH, height)];
    [_line setFrame:CGRectMake(0, self.height-1, [UIScreen mainScreen].bounds.size.width, 1)];
}

- (void)setCollected:(BOOL)collected
{
    _collected = collected;
    if (collected)
    {
        [_view_collectTag setHidden:NO];
    }
    else
    {
        [_view_collectTag setHidden:YES];
    }
}

@end
