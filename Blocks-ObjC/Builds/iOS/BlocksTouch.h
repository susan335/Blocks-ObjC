//
//  BlocksTouch.h
//  Blocks-ObjC
//
//  Created by Yohta Watanave on 2017/05/24.
//
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "global.h"

@interface BlocksTouch : NSObject {
    juce::TouchSurface::Touch juceTouch;
}

- (instancetype)initWithJuceTouch:(juce::TouchSurface::Touch)touch;

- (NSInteger) index;
- (CGFloat) x;
- (CGFloat) xVolocity;
- (CGFloat) y;
- (CGFloat) yVelocity;
- (CGFloat) z;
- (BOOL) isTouchStart;
- (BOOL) isTouchEnd;
- (CGFloat) startX;
- (CGFloat) startY;

@end
