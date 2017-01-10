//
//
//  Created by Tapash.mollick on 10/01/17.
//  Copyright (c) 2015 Tapash Mollick. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton
@synthesize btnType;
@synthesize delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.btnType setBackgroundImage:nil forState:UIControlStateNormal];
    [self.btnType setBackgroundImage:[UIImage imageNamed:@"btn_over.png"] forState:UIControlStateSelected];
    
}



- (IBAction)ClickOnType:(id)sender {
    UIButton *btn=(UIButton*)sender;
    NSLog(@"sender.tag %ld",(long)btn.tag);
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(btnClick:)])
        [self.delegate btnClick:sender];
}

@end
