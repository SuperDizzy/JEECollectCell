//
//  JEETableViewController.h
//  JEECollectCell
//
//  Created by ZhangJunjee on 14-6-18.
//  Copyright (c) 2014年 junjee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JEECollectTableViewCell.h"

@interface JEETableViewController : UITableViewController<JEECellCollectDelegate>
{
    NSMutableArray *_collectIndexArray;
}

@end
