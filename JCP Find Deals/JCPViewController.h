//
//  JCPViewController.h
//  JCP Find Deals
//
//  Created by Muhammad Fauzan on 1/26/15.
//  Copyright (c) 2015 JCPenney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FYX/FYX.h>
#import <FYX/FYXVisitManager.h>
#import <FYX/FYXiBeacon.h>

@interface JCPViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, FYXServiceDelegate, FYXVisitDelegate, FYXiBeaconVisitDelegate>
@property (weak, nonatomic) IBOutlet UITableView *JCPTableViewController;


@property FYXVisitManager *visitManager;

@end
