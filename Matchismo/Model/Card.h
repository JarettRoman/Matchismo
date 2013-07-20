//
//  Card.h
//  Matchismo
//
//  Created by Jarett Roman on 7/18/13.
//  Copyright (c) 2013 Jarett Roman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString * contents;

@property (nonatomic, getter=isFaceUp) BOOL faceUp;

@property (nonatomic, getter=isUnplayable) BOOL unplayable;

- (int) match:(NSArray *)otherCards;

@end
