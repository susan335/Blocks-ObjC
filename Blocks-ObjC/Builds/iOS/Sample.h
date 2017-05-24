//
//  Sample.h
//  BlocksSampleLibrary
//
//  Created by Yohta Watanave on 2017/05/23.
//
//

#import <Foundation/Foundation.h>
#import "BlockFinder.h"
#import "Blocks.h"

@protocol BlockFinderDelegate

- (void)findBlock:(Blocks*) blocks;

@end

@interface Sample : NSObject {
    
    juce::ScopedJuceInitialiser_GUI platform;
    BlockFinder blockFinder;
    id<BlockFinderDelegate> delegate;
}

@property (weak) id<BlockFinderDelegate> delegate;

@end
