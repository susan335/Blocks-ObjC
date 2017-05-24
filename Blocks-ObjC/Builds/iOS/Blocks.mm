//
//  Blocks.m
//  BlocksSampleLibrary
//
//  Created by Yohta Watanave on 2017/05/23.
//
//

#import "Blocks.h"

@interface Blocks()

@property (strong) NSTimer *timer;

@end

@implementation Blocks

- (instancetype)initWithJuceBlockPtr:(juce::Block::Ptr)block {
    
    self = [super init];
    if (self) {
        blockPtr = block;
        touchSurfaceListenerPtr = new BlockTouchSurfaceListener(block);
        touchSurfaceListenerPtr->handler = [self] (const juce::TouchSurface::Touch& touch) {
            touches.updateTouch(touch);
            
            NSLog(@"Touch!!");
            for (auto touch : touches) {
                NSLog(@"-------");
                NSLog(@"%d, %f, %f, %f", touch.touch.index, touch.touch.x, touch.touch.y, touch.touch.z);
            }
            
        };
        
//        auto row = block->getLEDRow();
        auto grid = block->getLEDGrid();
        auto render = grid->getRenderer();
//        grid->
        ledProgram = new juce::BitmapLEDProgram(*block.get());
        block->setProgram(ledProgram);
//        block->saveProgramAsDefault();
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            if (auto row = block->getLEDRow()) {
//                for (int i = 0; i < row->getNumLEDs(); ++i) {
//                    row->setLEDColour(i, juce::Colours::orange);
//                }
//            }
            if (!ledProgram) {
                return;
            }
            auto grid = block->getLEDGrid();
            auto render = grid->getRenderer();
            for (uint32_t x = 0; x < 15; ++x) {
                for (uint32_t y = 0; y < 15; ++y) {
                    ledProgram->setLED(x, y, juce::Colours::white);
                }
            }
            
        }];
    }
    
    return self;
}

- (void)timerFire:(NSTimer *)timer {
}

- (void)dealloc {
    [self.timer invalidate];
    delete ledProgram;
    [super dealloc];
}

@end
