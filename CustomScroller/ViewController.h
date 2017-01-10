//
//  ViewController.h
//  CustomScroller
//
//  Created by Tapash.mollick on 10/01/17.
//  Copyright (c) 2015 Tapash Mollick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomScroll.h"


@interface ViewController : UIViewController<ScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UITableView *tblView;


@end

