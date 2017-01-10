//
//  CustomScroll.m
//
//  Created by Tapash.mollick on 10/01/17.
//  Copyright (c) 2015 Tapash Mollick. All rights reserved.
//

#import "CustomScroll.h"


#define GAP 10
#define ORIGIN_X  8


@implementation CustomScroll
@synthesize delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ;
    }
    return self;
}



#pragma mark- ---CreateView---

-(void)createView:(NSArray*)arrList
{
    float originX=ORIGIN_X;
    
    float width=[UIScreen mainScreen].bounds.size.width- [arrList count]-1*GAP-2*ORIGIN_X;
    float widthofButton=width/[arrList count];
    
    
     for(int i=0;i<[arrList count];++i){
        NSString * titleForButton = arrList[i];
         CustomButton *mCustomButton;
         NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"CustomButton" owner:self options:nil];
         
         mCustomButton= [nibContents objectAtIndex:0];
         
         mCustomButton.hidden=NO;
         mCustomButton.btnType.hidden=NO;

        mCustomButton.tag =i;
        mCustomButton.btnType.tag=i;
        [mCustomButton.btnType.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
         [mCustomButton.btnType setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         [mCustomButton.btnType setTitle:titleForButton forState:UIControlStateNormal];
         mCustomButton.btnType.imageView.contentMode=UIViewContentModeScaleAspectFit;
         mCustomButton.backgroundColor = [UIColor clearColor];
         mCustomButton.btnType.backgroundColor=[UIColor blackColor];
         
         if(i==0){
         [mCustomButton.btnType setSelected:YES];
         self.btnSelected=(UIButton*)mCustomButton.btnType;
        [self.btnSelected setSelected:YES];
         }
         else{
             [mCustomButton.btnType setSelected:NO];

         }
         mCustomButton.delegate=self;
        
        [mCustomButton setFrame:CGRectMake(originX,1,widthofButton,41)];
        originX+= widthofButton+GAP;
         
        [self addSubview:mCustomButton];
    }
   
    [self setContentSize:CGSizeMake(self.frame.size.width,self.frame.size.height)];

}

-(void)btnClick:(id)sender{
    UIButton *btn=(UIButton*)sender;
    
    NSLog(@"sender.tag %ld",(long)btn.tag);
    if (btn.tag==self.btnSelected.tag) {
        //************ do nothing as selected  button clicked
    }
    else{
        [self.btnSelected setSelected:NO];

        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             [btn setSelected:YES];

                         }
         
                         completion:nil];
        
        self.btnSelected=btn;
        
        if(self.delegate && [self.delegate respondsToSelector:@selector(getButtonType:)])
            [self.delegate getButtonType:btn.tag];
        
    }
    
    
}

@end

