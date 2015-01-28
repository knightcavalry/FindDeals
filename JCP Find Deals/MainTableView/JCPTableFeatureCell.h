//
//  JCPTableFeatureCell.h
//  JCP Find Deals
//
//  Created by Muhammad Fauzan on 1/26/15.
//  Copyright (c) 2015 JCPenney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCPTableFeatureCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *thinLabel;

- (void) boldSubstring: (NSString*) substring;
- (void) boldRange: (NSRange) range;

@end
