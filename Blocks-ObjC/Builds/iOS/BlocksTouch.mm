//
//  BlocksTouch.m
//  Blocks-ObjC
//
//  Created by Yohta Watanave on 2017/05/24.
//
//

#import "BlocksTouch.h"

@implementation BlocksTouch

- (instancetype)initWithJuceTouch:(juce::TouchSurface::Touch)touch {
    self = [super init];
    if (self) {
        juceTouch = touch;
    }
    
    return self;
}

- (NSInteger) index {
    return juceTouch.index;
}
- (CGFloat) x {
        return juceTouch.x;
}
- (CGFloat) xVolocity {
    return juceTouch.xVelocity;
}
- (CGFloat) y {
        return juceTouch.y;
}
- (CGFloat) yVelocity {
    return juceTouch.yVelocity;
}
- (CGFloat) z {
    return juceTouch.z;
}
- (BOOL) isTouchStart {
    return juceTouch.isTouchStart;
}
- (BOOL) isTouchEnd {
    return juceTouch.isTouchEnd;
}
- (CGFloat) startX {
    return juceTouch.startX;
}
- (CGFloat) startY {
    return juceTouch.startY;
}


@end
