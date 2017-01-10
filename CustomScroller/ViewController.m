//
//  ViewController.m
//  CustomScroller
//
//  Created by Tapash.mollick on 10/01/17.
//  Copyright (c) 2015 Tapash Mollick. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CustomScroll *mCustomScroll;
    NSInteger index;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tblView.tableFooterView = [UIView new];
    [self addScrollView];
}

#pragma mark- ADD_SCROLL_VIEW

-(void)addScrollView
{
    NSArray *arr =[NSMutableArray arrayWithObjects:@"FIRST",@"SECOND",@"THIRD",nil];
    if(!mCustomScroll){
        
        mCustomScroll = [[CustomScroll alloc] initWithFrame:CGRectMake(0.0, 20.0, [UIScreen mainScreen].bounds.size.width, 44.0)];
        
        mCustomScroll.delegate = self;
        mCustomScroll.backgroundColor = [UIColor blackColor];
        mCustomScroll.showsHorizontalScrollIndicator = NO;
        [mCustomScroll createView:arr];
        [self.view addSubview:mCustomScroll];
    }
    
}

-(void)getButtonType:(NSInteger)_BtnType{
    
    index = (_BtnType + 1);
    [self.tblView reloadData];
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"%ld clicked",index] preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }];
//    
//    [alert addAction:okButton];
//    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark -
#pragma mark Table view dalegate and datasource methods
/* Methods to handle the TableView Datasource and Delegate */

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //put your values, this is part of my code
    
    
    return nil;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

// custom view for header. will be adjusted to default or specified header height

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}// custom view for header. will be adjusted to default or specified header height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 46;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self configureTableView:tableView ForIndexPath:indexPath];
}



-(UITableViewCell*)configureTableView:(UITableView *)tableView ForIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell ;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.textLabel setTextColor:[UIColor orangeColor] ];
    [cell.textLabel setText:[NSString stringWithFormat:@"%ld item at index %ld",index,indexPath.row]];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
