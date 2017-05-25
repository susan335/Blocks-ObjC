//
//  Sample.m
//  BlocksSampleLibrary
//
//  Created by Yohta Watanave on 2017/05/23.
//
//

#import "Sample.h"
#import "global.h"

@implementation Sample

@synthesize delegate = delegate;

- (instancetype)init {
    self = [super init];
    if (self) {
        
        blockFinder.handler = [self] (juce::Block::Ptr ptr) {
            Blocks *blocks = [[[Blocks alloc]initWithJuceBlockPtr:(ptr)]autorelease];
            [self.delegate findBlock:blocks];
        };
        
    }
    return self;
}

@end
