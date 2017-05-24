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

@protocol BlockTouchDelegate

//- (void)findBlock:(Blocks*) blocks;

@end

@interface Blocks : NSObject {

    juce::Block::Ptr blockPtr;
    juce::ReferenceCountedObjectPtr<BlockTouchSurfaceListener> touchSurfaceListenerPtr;
    juce::TouchList<juce::TouchSurface::Touch> touches;
    juce::BitmapLEDProgram *ledProgram;
    
}

- (instancetype)initWithJuceBlockPtr:(juce::Block::Ptr)block;

@end
