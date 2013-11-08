//
//  EqHashDescriptionGenerator.m
//  DociPad
//
//  Created by Stefan Wehr on 09.04.10.
//  Copyright 2010 factis research GmbH. All rights reserved.
//

#import "EqHashDescriptionGenerator.h"
#import "FRCommon.h"

@implementation FRObject
+ (BOOL)is:(id)o1 equalTo:(id)o2 {
    if (o1 == nil && o2 == nil) {
        return YES;
    } else {
        return [o1 isEqual:o2];
    }
}
+ (NSUInteger)hashOf:(id)o {
    return [o hash];
}
+ (NSString *)descriptionOf:(id)o {
    return ((o == nil) ? @"<nil>" : [o description]);
}
@end

@implementation FRIdentity
+ (BOOL)is:(id)o1 equalTo:(id)o2 {
    return (o1 == o2);
}
+ (NSUInteger)hashOf:(id)o {
    return (NSUInteger)o;
}
+ (NSString *)descriptionOf:(id)o {
    return ((o == nil) ? @"<nil>" : [o description]);
}
@end

@implementation FRData
+ (BOOL)is:(NSData *)o1 equalTo:(NSData *)o2 {
    if (o1 == nil && o2 == nil) {
        return YES;
    } else {
        return [o1 isEqualToData:o2];
    }
}
+ (NSUInteger)hashOf:(NSData *)o {
    return [o hash];
}
+ (NSString *)descriptionOf:(NSData *)o {
    return ((o == nil) ? @"<nil>" : [o description]);
}
@end

@implementation FRRect
+ (BOOL)is:(CGRect)o1 equalTo:(CGRect)o2 {
    return CGRectEqualToRect(o1, o2);
}
+ (NSUInteger)hashOf:(CGRect)o {
    NSUInteger result = 17;
    result = 37 * result + [FRPoint hashOf:o.origin];
    result = 37 * result + [FRSize hashOf:o.size];
    return result;
}
+ (NSString *)descriptionOf:(CGRect)o {
#if TARGET_IOS
    return NSStringFromCGRect(o);
#else
    return NSStringFromRect(o);
#endif
}
@end

@implementation FRSize
+ (BOOL)is:(CGSize)o1 equalTo:(CGSize)o2 {
    return CGSizeEqualToSize(o1, o2);
}
+ (NSUInteger)hashOf:(CGSize)o {
    NSUInteger result = 17;
    result = 37 * result + abs((int)o.width);
    result = 37 * result + abs((int)o.height);
    return result;
}
+ (NSString *)descriptionOf:(CGSize)o {
#if TARGET_IOS
    return NSStringFromCGSize(o);
#else
    return NSStringFromSize(o);
#endif
}
@end

@implementation FRPoint
+ (BOOL)is:(CGPoint)o1 equalTo:(CGPoint)o2 {
    return CGPointEqualToPoint(o1, o2);
}
+ (NSUInteger)hashOf:(CGPoint)o {
    NSUInteger result = 17;
    result = 37 * result + abs((int)o.x);
    result = 37 * result + abs((int)o.y);
    return result;
}
+ (NSString *)descriptionOf:(CGPoint)o {
#if TARGET_IOS
    return NSStringFromCGPoint(o);
#else
    return NSStringFromPoint(o);
#endif
}
@end

@implementation FRString
+ (BOOL)is:(NSString *)o1 equalTo:(NSString *)o2 {
    if (o1 == nil && o2 == nil) {
        return YES;
    } else {
        return [o1 isEqualToString:o2];
    }
}
+ (NSUInteger)hashOf:(NSString *)o {
    return [o hash];
}
+ (NSString *)descriptionOf:(NSString *)o {
    return ((o == nil) ? @"<nil>" : [NSString stringWithFormat:@"\"%@\"", o]);
}
@end

@implementation FRInteger
+ (BOOL)is:(NSInteger)i1 equalTo:(NSInteger)i2 {
    return (i1 == i2);
}
+ (NSUInteger)hashOf:(NSInteger)i {
    return i;
}
+ (NSString *)descriptionOf:(NSInteger)i {
    return [NSString stringWithFormat:@"%ld", (long)i];
}
@end

@implementation FRUInteger
+ (BOOL)is:(NSUInteger)i1 equalTo:(NSUInteger)i2 {
    return (i1 == i2);
}
+ (NSUInteger)hashOf:(NSUInteger)i {
    return i;
}
+ (NSString *)descriptionOf:(NSUInteger)i {
    return [NSString stringWithFormat:@"%lu", (unsigned long)i];
}
@end

@implementation FRInteger64 : NSObject
+ (BOOL)is:(int64_t)i1 equalTo:(int64_t)i2
{
    return (i1 == i2);
}
+ (NSUInteger)hashOf:(int64_t)i
{
    return (NSUInteger)i;
}
+ (NSString *)descriptionOf:(int64_t)i
{
    return [NSString stringWithFormat:@"%lld", i];
}
@end

@implementation FRUInteger64 : NSObject
+ (BOOL)is:(uint64_t)i1 equalTo:(uint64_t)i2
{
    return (i1 == i2);
}
+ (NSUInteger)hashOf:(uint64_t)i
{
    return (NSUInteger)i;
}
+ (NSString *)descriptionOf:(uint64_t)i
{
    return [NSString stringWithFormat:@"%llu", i];
}
@end

@implementation FRBool
+ (BOOL)is:(BOOL)b1 equalTo:(BOOL)b2 {
    return (b1 == b2);
}
+ (NSUInteger)hashOf:(BOOL)b {
    return (b ? 1 : 0);
}
+ (NSString *)descriptionOf:(BOOL)b {
    return (b ? @"YES" : @"NO");
}
@end

@implementation FRDouble
+ (BOOL)is:(double)d1 equalTo:(double)d2 {
    return (d1 == d2);
}
+ (NSUInteger)hashOf:(double)d {
    return (NSUInteger)d;
}
+ (NSString *)descriptionOf:(double)d {
    return [NSString stringWithFormat:@"%.3f", d];
}
@end

@implementation FRSelector
+ (BOOL)is:(SEL)sel1 equalTo:(SEL)sel2 {
    if (sel1 == sel2) {
        return YES;
    }
    return [NSStringFromSelector(sel1) isEqualToString:NSStringFromSelector(sel2)];
}
+ (NSUInteger)hashOf:(SEL)sel {
    return [NSStringFromSelector(sel) hash];
}
+ (NSString *)descriptionOf:(SEL)sel {
    return NSStringFromSelector(sel);
}
@end
