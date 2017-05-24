//
//  BlockTouchSurfaceListener.hpp
//  BlocksSampleLibrary
//
//  Created by Yohta Watanave on 2017/05/23.
//
//

#ifndef BlockTouchSurfaceListener_hpp
#define BlockTouchSurfaceListener_hpp

#include "global.h"

class BlockTouchSurfaceListener : public juce::ReferenceCountedObject, private juce::TouchSurface::Listener {
    
public:
    BlockTouchSurfaceListener(juce::Block::Ptr blockPtr) : blockPtr(blockPtr) {
        blockPtr->getTouchSurface()->addListener(this);
    };
    ~BlockTouchSurfaceListener() {
        blockPtr->getTouchSurface()->removeListener(this);
    };
    
    std::function<void(const juce::TouchSurface::Touch&)> handler = nullptr;
    
private:
    juce::Block::Ptr blockPtr;
    
    void touchChanged (juce::TouchSurface&, const juce::TouchSurface::Touch& touch) override {
        if (handler) {
            handler(touch);
        }
    }

};

#endif /* BlockTouchSurfaceListener_hpp */
