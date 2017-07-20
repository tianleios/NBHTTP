//
//  ViewController.h
//  HTTP
//
//  Created by  tianlei on 2017/7/6.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

    @private  NSString *_privateStr;
    @protected  NSString *_protectedStr;
    @public  NSString *_publicStr;
    @package NSString *_packageStr;
    
}

//
@property (nonatomic, strong) NSString *name;

@end

