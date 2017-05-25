//
//  BlocksGridLED.m
//  Blocks-ObjC
//
//  Created by Yohta Watanave on 2017/05/24.
//
//

#import "BlocksGridLED.h"
#import "Blocks.h"

@implementation BlocksGridLED

- (instancetype)initWithBlocks:(Blocks*)blocks {
    
    self = [super init];
    if (self) {
        juce::Block *block = (juce::Block *)blocks.blockPtr.pointerValue;
        drumPadGridProgram = new juce::DrumPadGridProgram(*block);
        block->setProgram(drumPadGridProgram);
        
        _blocks = blocks;
    }
    return self;
}

- (void)dealloc {
    juce::Block *block = (juce::Block *)_blocks.blockPtr.pointerValue;
    drumPadGridProgram = new juce::DrumPadGridProgram(*block);
    block->setProgram(nullptr);
    delete drumPadGridProgram;
    
    [super dealloc];
}

- (void)setGridFills:(NSInteger)numColumns numRows:(NSInteger)numRows fills:(NSArray<BlocksGridFill *>*)fills {
    juce::Array<juce::DrumPadGridProgram::GridFill> gridFillArray;
    for (BlocksGridFill *fill in fills) {
        juce::DrumPadGridProgram::GridFill juceFille;
        
        juceFille.fillType = (juce::DrumPadGridProgram::GridFill::FillType)fill.type;
        
        UIColor *color = fill.color;
        CGFloat r, g, b, a;
        [color getRed:&r green:&g blue:&b alpha:&a];
        uint32_t argb = ((uint8_t)(a * 0xFF) << 24) | ((uint8_t)(r * 0xFF) << 16) | ((uint8_t)(g * 0xFF) << 8) | (uint8_t)(b * 0xFF);
        juceFille.colour = juce::LEDColour(argb);
        gridFillArray.add(juceFille);
    }
    drumPadGridProgram->setGridFills((int)numColumns, (int)numRows, gridFillArray);
}

@end

@implementation BlocksGridFill
@end
