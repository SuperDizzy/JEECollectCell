//
//  JEETableViewController.m
//  JEECollectCell
//
//  Created by ZhangJunjee on 14-6-18.
//  Copyright (c) 2014年 junjee. All rights reserved.
//

#import "JEETableViewController.h"
#import "JEECollectTableViewCell.h"
#import "JEECollectCellMainView.h"

@interface JEETableViewController ()

@end

@implementation JEETableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _collectIndexArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - JEECellCollectDelegate
- (void)collectCellAtIndex:(NSIndexPath *)index
{
    [_collectIndexArray addObject:index];
}

- (void)cancleCollectAtIndex:(NSIndexPath *)index
{
    [_collectIndexArray removeObject:index];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIn = @"CellIn";
    JEECollectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIn];
    if (cell == nil)
    {
        cell = [[JEECollectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIn];
        cell.delegate = self;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.height = 90;
        UILabel *lab_tag = [[UILabel alloc] initWithFrame:CGRectMake(10, cell.height/2 - 10, 60, 20)];
        [lab_tag setBackgroundColor:[UIColor whiteColor]];
        [lab_tag setFont:[UIFont boldSystemFontOfSize:18]];
        [lab_tag setTag:100];
        [cell.cellMainView addSubview:lab_tag];
    }
    cell.cellIndexPath = indexPath;
    int i = 0;
    for(NSIndexPath *myIndexPath in _collectIndexArray)
    {
        if ([myIndexPath isEqual:indexPath])
        {
            i = 1;
            break;
        }
    }
    UILabel *lab = (UILabel *)[cell.cellMainView viewWithTag:100];
    lab.text = [NSString stringWithFormat:@"%d",indexPath.row];
    if (i == 1)
        cell.collected = YES;
    else
        cell.collected = NO;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)selectCellAtIndex:(NSIndexPath *)index
{
    NSLog(@"Selected%d",index.row);
}

@end
