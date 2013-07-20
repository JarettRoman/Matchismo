//
//  Card.m
//  Matchismo
//
//  Created by Jarett Roman on 7/18/13.
//  Copyright (c) 2013 Jarett Roman. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
