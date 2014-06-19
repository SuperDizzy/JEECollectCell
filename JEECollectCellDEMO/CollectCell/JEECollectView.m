//
//  JEECollectView.m
//  JEECollectCell
//
//  Created by ZhangJunjee on 14-6-18.
//  Copyright (c) 2014年 junjee. All rights reserved.
//

#import "JEECollectView.h"

@implementation JEECollectView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setBackgroundColor:MAIN_COLOR];
        self.img_defaultCollectView = [[UIImageView alloc] initWithFrame:CGRectMake(10, frame.size.height/2-10, 80, 20)];
        self.img_dragCollectView = [[UIImageView alloc] initWithFrame:CGRectMake(10, frame.size.height/2-10, 80, 20)];
        if (self.collected)
        {
            [self.img_defaultCollectView setImage:[UIImage imageNamed:@"haveCollected"]];
            [self.img_dragCollectView setImage:[UIImage imageNamed:@"cancleCollect"]];
        }
        else
        {
            [self.img_defaultCollectView setImage:[UIImage imageNamed:@"noCollected"]];
            [self.img_dragCollectView setImage:[UIImage imageNamed:@"isCollect"]];
        }
        [self addSubview:self.img_defaultCollectView];
        [self addSubview:self.img_dragCollectView];
        [self.img_dragCollectView setAlpha:0];
    }
    return self;
}

- (void)setHeight:(CGFloat)height
{
    _height = height;
    [self.img_defaultCollectView setFrame:CGRectMake(10, height/2 - 10, 80, 20)];
    [self.img_dragCollectView setFrame:CGRectMake(10, height/2 - 10, 80, 20)];
}

- (void)setCollected:(BOOL)collected
{
    _collected = collected;
    if (collected)
    {
        [self.img_defaultCollectView setImage:[UIImage imageNamed:@"haveCollected"]];
        [self.img_dragCollectView setImage:[UIImage imageNamed:@"cancleCollect"]];
    }
    else
    {
        [self.img_defaultCollectView setImage:[UIImage imageNamed:@"noCollected"]];
        [self.img_dragCollectView setImage:[UIImage imageNamed:@"isCollect"]];
    }
}

- (void)dragToChangeImage
{
    [UIView animateWithDuration:0.4f animations:^{
        [self.img_defaultCollectView setAlpha:0];
        [self.img_dragCollectView setAlpha:1];
    }];
    
}

- (void)dragToChangeBackImage
{
    [UIView animateWithDuration:0.4f animations:^{
        [self.img_dragCollectView setAlpha:0];
        [self.img_defaultCollectView setAlpha:1];
    }];
}


@end
