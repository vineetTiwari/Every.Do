//
//  Todo.h
//  Every.Do
//
//  Created by Vineet Tiwari on 2015-05-21.
//  Copyright (c) 2015 vinny.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic) NSString *taskTitle;
@property (nonatomic) NSString *taskDescription;
@property (nonatomic) NSNumber *priorityNumber;
@property (nonatomic, getter=isCompleted) BOOL completed;


+ (instancetype) taskWithTitle:(NSString *)taskTitle description:(NSString *)taskDescription andPriorityNumber:(NSNumber *)priorityNumber;

@end

