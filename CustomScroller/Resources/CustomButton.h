//
//  CustomButton.h
//
//  Created by Tapash.mollick on 10/01/17.
//  Copyright (c) 2015 Tapash Mollick. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomBtnDelegate<NSObject>

@optional

-(void)btnClick:(id)sender;

@end


@interface CustomButton : UIView
@property (weak, nonatomic) IBOutlet UIButton *btnType;
@property (weak, nonatomic) id<CustomBtnDelegate>delegate;


- (IBAction)ClickOnType:(id)sender;

@end
