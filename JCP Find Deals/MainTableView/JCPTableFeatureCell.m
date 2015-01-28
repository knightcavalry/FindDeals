//
//  JCPTableFeatureCell.m
//  JCP Find Deals
//
//  Created by Muhammad Fauzan on 1/26/15.
//  Copyright (c) 2015 JCPenney. All rights reserved.
//

#import "JCPTableFeatureCell.h"

@implementation JCPTableFeatureCell
@synthesize thinLabel;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) boldRange: (NSRange) range {
    if (![thinLabel respondsToSelector:@selector(setAttributedText:)]) {
        return;
    }
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:thinLabel.text];
    [attributedText setAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:thinLabel.font.pointSize]} range:range];
    
    thinLabel.attributedText = attributedText;
}

- (void) boldSubstring: (NSString*) substring {
    NSRange range = [thinLabel.text rangeOfString:substring];
    [self boldRange:range];
}

@end
