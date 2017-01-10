//
//  CustomScroll.h
//
//  Created by Tapash.mollick on 10/01/17.
//  Copyright (c) 2015 Tapash Mollick. All rights reserved.
//

@protocol ScrollViewDelegate ;

#import <UIKit/UIKit.h>
#import "CustomButton.h"


@protocol ScrollViewDelegate <NSObject>

@optional
-(void)getButtonType:(NSInteger)_BtnType;

@end

@interface CustomScroll : UIScrollView<CustomBtnDelegate>

@property(nonatomic,weak)id<ScrollViewDelegate>delegate;
@property (strong, nonatomic)  UIButton *btnSelected;



-(void)createView:(NSArray*)arrList;

@end


