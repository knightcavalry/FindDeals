//
//  JCPViewController.m
//  JCP Find Deals
//
//  Created by Muhammad Fauzan on 1/26/15.
//  Copyright (c) 2015 JCPenney. All rights reserved.
//

#import "JCPViewController.h"
#import "JCPTableFeatureCell.h"
#import "JCPTableImageCell.h"
#import "JCPTableSetStoreCell.h"

@interface JCPViewController ()

@end

@implementation JCPViewController
@synthesize visitManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [FYX startService:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCPTableFeatureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeatureCell"];
    if(!cell){
        cell = [[JCPTableFeatureCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FeatureCell"];
    }
    
    int index = (int)indexPath.row;
    switch (index) {
        case 0:
            return [self setStoreCell:(UITableView *)tableView];
            break;
        case 1:
            cell.thinLabel.text = @"FIND ALL THE DEALS";
            [cell boldSubstring:@"DEALS"];
            break;
        case 2:
            cell.thinLabel.text = @"SCAN FOR PRODUCT INFO";
            [cell boldSubstring:@"PRODUCT INFO"];
            break;
        case 3:
            cell.thinLabel.text = @"SELF CHECKOUT";
            [cell boldSubstring:@"CHECKOUT"];
            break;
        case 4:
            cell.thinLabel.text = @"SAVED LIST FINDER";
            [cell boldSubstring:@"FINDER"];
            break;
        default:
            cell.thinLabel.text = @"IN DEVELOPMENT";
            [cell boldSubstring:@"DEVELOPMENT"];
            break;
    }
    return cell;
}

- (JCPTableSetStoreCell *)setStoreCell:(UITableView *)tableView{
    JCPTableSetStoreCell * setStoreCell = [tableView dequeueReusableCellWithIdentifier:@"SetStoreCell"];
    if (!setStoreCell) {
        setStoreCell = [[JCPTableSetStoreCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SetStoreCell"];
    }
    return setStoreCell;
}

- (void)serviceStarted{
    NSLog(@"Service successfully started");
    
    self.visitManager = [FYXVisitManager new];
    self.visitManager.delegate = self;
    self.visitManager.iBeaconDelegate = self;
    [self.visitManager start];
}

- (void)startServiceFailed:(NSError *)error{
    NSLog(@"Service failed to start");
}

- (void)didArriveIBeacon:(FYXiBeaconVisit *)visit;
{
    // this will be invoked when a managed Gimbal beacon is sighted for the first time
    NSLog(@"I arrived within the proximity of a Gimbal beacon!!! Proximity UUID:%@ Major:%@ Minor:%@", visit.iBeacon.uuid, visit.iBeacon.major, visit.iBeacon.minor);
}

- (void)receivedIBeaconSighting:(FYXiBeaconVisit *)visit updateTime:(NSDate *)updateTime RSSI:(NSNumber *)RSSI;
{
    // this will be invoked when a managed Gimbal beacon is sighted during an on-going visit
    NSLog(@"I received a sighting!!! Proximity UUID:%@ Major:%@ Minor:%@", visit.iBeacon.uuid, visit.iBeacon.major, visit.iBeacon.minor);
}

- (void)didDepartIBeacon:(FYXiBeaconVisit *)visit;
{
    // this will be invoked when a managed Gimbal beacon has not been sighted for some time
    NSLog(@"I left the proximity of a Gimbal beacon!!!! Proximity UUID:%@ Major:%@ Minor:%@", visit.iBeacon.uuid, visit.iBeacon.major, visit.iBeacon.minor);
    NSLog(@"I was around the beacon for %f seconds", visit.dwellTime);
}

- (void)receivedSighting:(FYXVisit *)visit updateTime:(NSDate *)updateTime RSSI:(NSNumber *)RSSI{
    NSLog(@"Received sighting from %@", visit.transmitter.name);
}

- (void)didArrive:(FYXVisit *)visit{
    NSLog(@"Arrived at %@", visit.transmitter.name);
}

- (void)didDepart:(FYXVisit *)visit{
    NSLog(@"Depart from %@", visit.transmitter.name);

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
