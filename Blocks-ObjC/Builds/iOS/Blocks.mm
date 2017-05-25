//
//  Blocks.m
//  BlocksSampleLibrary
//
//  Created by Yohta Watanave on 2017/05/23.
//
//

#import "Blocks.h"
#import "BlocksTouch.h"


@implementation Blocks

- (instancetype)initWithJuceBlockPtr:(juce::Block::Ptr)block {
    
    self = [super init];
    if (self) {
        blockPtr = block;
        touchSurfaceListenerPtr = new BlockTouchSurfaceListener(block);
        touchSurfaceListenerPtr->handler = [self] (const juce::TouchSurface::Touch& touch) {
            touches.updateTouch(touch);
            NSLog(@"Blocks %@", [NSDate date]);
            
            auto touchArray = [NSMutableArray arrayWithCapacity:touches.size()];
            for (auto touch : touches) {
                auto blocksTouch = [[BlocksTouch alloc]initWithJuceTouch:touch.touch];
                [touchArray addObject:blocksTouch];
            }
            [self.touchDelegate touchChange:touchArray];
        };
    }
    
    return self;
}

- (NSString*)serialNumber {
    return [NSString stringWithUTF8String:blockPtr->serialNumber.toStdString().c_str()];
}

- (UInt64)uid {
    return blockPtr->uid;
}

- (NSValue *)blockPtr {
    return [NSValue valueWithPointer:blockPtr.get()];
}

@end
