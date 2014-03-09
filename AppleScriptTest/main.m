//
//  main.m
//  AppleScriptTest
//
//  Created by Sander Dijkhuis on 09/03/14.
//  Copyright (c) 2014 Sander Dijkhuis. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
