//
//  Todo.m
//  Every.Do
//
//  Created by Vineet Tiwari on 2015-05-21.
//  Copyright (c) 2015 vinny.co. All rights reserved.
//

#import "Task.h"

@implementation Task

+ (instancetype)taskWithTitle:(NSString *)taskTitle description:(NSString *)taskDescription andPriorityNumber:(NSNumber *)priorityNumber {

  Task *task = [[Task alloc] init];
  task.taskTitle = taskTitle;
  task.taskDescription = taskDescription;
  task.priorityNumber = priorityNumber;

  return task;
}

@end
