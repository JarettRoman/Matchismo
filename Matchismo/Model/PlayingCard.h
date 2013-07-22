//
//  PlayingCard.h
//  Matchismo
//
//  Created by Uboa on 7/18/13.
//  Copyright (c) 2013 Uboa. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
