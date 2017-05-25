//
//  Blocks.h
//  BlocksSampleLibrary
//
//  Created by Yohta Watanave on 2017/05/23.
//
//

#import <Foundation/Foundation.h>
#import "BlockTouchSurfaceListener.hpp"
#import "global.h"
#import "BlocksGridLED.h"

@class BlocksTouch;
@protocol BlockTouchDelegate
- (void)touchChange:(NSArray<BlocksTouch *>*) touches;
@end


@interface Blocks : NSObject {

    juce::Block::Ptr blockPtr;
    juce::ReferenceCountedObjectPtr<BlockTouchSurfaceListener> touchSurfaceListenerPtr;
    juce::TouchList<juce::TouchSurface::Touch> touches;
    BlocksGridLED *gridLed;
}

- (instancetype)initWithJuceBlockPtr:(juce::Block::Ptr)block;
- (NSString*)serialNumber;
- (UInt64)uid;
- (NSValue *)blockPtr;

@property (assign) id<BlockTouchDelegate> touchDelegate;

@end
