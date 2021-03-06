//
//  ObjectiveMixinTests.m
//  ObjectiveMixinTests
//
//  Created by Vladimir Mitrovic on 11/04/2011.
//  Copyright 2011 Vladimir Mitrovic. All rights reserved.
//

#import "ObjectiveMixinTests.h"
#import "Mixin.h"
#import "SourceClass.h"
#import "ChildSourceClass.h"
#import "DestinationClass.h"

@implementation ObjectiveMixinTests

- (void)setUp
{
	[super setUp];
	
	// Set-up code here.
	NSLog(@"====");
}

- (void)tearDown
{
	// Tear-down code here.
	NSLog(@"====");
	
	[super tearDown];
}

- (void)testMethods
{
	DestinationClass* dest = [[[DestinationClass alloc] init] autorelease];
	
	[Mixin from:[SourceClass class] into:[DestinationClass class]];
	[(id)dest helloWorld];
	[(id)dest methodWithAnArgument:[NSNumber numberWithInt:rand()]];
	[(id)dest methodUsingAnInstanceVariable];
}

- (void) testInheritedMethods {
	DestinationClass* dest = [[[DestinationClass alloc] init] autorelease];
	
	[Mixin from:[ChildSourceClass class] into:[DestinationClass class] followInheritance:YES];
	[(id)dest childMethodCallingParentMethod];
	[(id)dest helloWorld];
}

- (void) testNSObjectCategory {
	DestinationClass* dest = [[[DestinationClass alloc] init] autorelease];
	[dest mixinFrom:[SourceClass class]];
	
	[(id)dest helloWorld];
}

@end
