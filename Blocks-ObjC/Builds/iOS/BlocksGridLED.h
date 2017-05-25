//
//  BlocksGridLED.h
//  Blocks-ObjC
//
//  Created by Yohta Watanave on 2017/05/24.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "global.h"

@class Blocks;
@interface BlocksGridLED : NSObject {
    
    juce::DrumPadGridProgram *drumPadGridProgram;
    
}

- (instancetype)initWithBlocks:(Blocks*)blocks;
- (void)setGridFills:(NSInteger)numColumns numRows:(NSInteger)numRows fills:(NSArray<BlocksGridLED *>*)fills;

@property (assign, readonly) Blocks *blocks;

@end


typedef NS_ENUM(NSUInteger, BlocksGridFillType) {
    gradient            = 0,
    filled              = 1,
    hollow              = 2,
    hollowPlus          = 3,
    
    // Animated pads
    dotPulsing          = 4,
    dotBlinking         = 5,
    pizzaFilled         = 6,
    pizzaHollow         = 7,
};


@interface BlocksGridFill: NSObject

@property (strong) UIColor *color;
@property (assign) BlocksGridFillType type;

@end
