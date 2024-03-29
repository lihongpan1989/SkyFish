//
//  JKCountDownButton.m
//  JKCountDownButton
//
//  Created by Jakey on 15/3/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "JKCountDownButton.h"

@implementation JKCountDownButton
#pragma -mark touche action
-(void)addToucheHandler:(TouchedDownBlock)touchHandler{
    _touchedDownBlock = [touchHandler copy];
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)touched:(JKCountDownButton*)sender{
    if (_touchedDownBlock) {
        _touchedDownBlock(sender,sender.tag);
    }
}

#pragma -mark count down method
-(void)startWithSecond:(int)totalSecond
{
    _totalSecond = totalSecond;
    _second = totalSecond;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    _startDate = [NSDate date];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
-(void)timerStart:(NSTimer *)theTimer {
     double deltaTime = [[NSDate date] timeIntervalSinceDate:_startDate];
    
     _second = _totalSecond - (int)(deltaTime+0.5) ;
    
    if (_second< 0.0)
    {
        [self stop];
    }
    else
    {
        if (_didChangeBlock)
        {
            [self setTitle:_didChangeBlock(self,_second) forState:UIControlStateNormal];
            [self setTitle:_didChangeBlock(self,_second) forState:UIControlStateDisabled];

        }
        else
        {
            [self setTitleColor:[UIColor colorWithRed:177/255.0 green:177/255.0 blue:179/255.0 alpha:1] forState:UIControlStateNormal];
            NSString *title = [NSString stringWithFormat:@"重新发送(%d)",_second];
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitle:title forState:UIControlStateDisabled];

        }
    }
}

- (void)stop{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                _second = _totalSecond;
                if (_didFinishedBlock)
                {
                    [self setTitle:_didFinishedBlock(self,_totalSecond)forState:UIControlStateNormal];
                    [self setTitle:_didFinishedBlock(self,_totalSecond)forState:UIControlStateDisabled];

                }
                else
                {
                    [self setTitleColor:[UIColor colorWithRed:250/255.0 green:86/255.0 blue:85/255.0 alpha:1] forState:UIControlStateNormal];
                    [self setTitle:@"重新发送" forState:UIControlStateNormal];
                    [self setTitle:@"重新发送" forState:UIControlStateDisabled];

                }
            }
        }
    }
}
#pragma -mark block
-(void)didChange:(DidChangeBlock)didChangeBlock{
    _didChangeBlock = [didChangeBlock copy];
}
-(void)didFinished:(DidFinishedBlock)didFinishedBlock{
    _didFinishedBlock = [didFinishedBlock copy];
}
@end
