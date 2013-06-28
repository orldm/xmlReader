//
//  currentFileViewController.h
//  xmlReader
//
//  Created by John Smith on 6/24/13.
//  Copyright (c) 2013 bullet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface currentFileViewController : UIViewController <NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UILabel *fileInfo;
@property (weak,nonatomic) NSString *fileName;

@end
