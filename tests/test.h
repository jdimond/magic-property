#import <Foundation/Foundation.h>

@protocol Baz
@end

@protocol MyObserver
@end

#define MyCustomInt NSInteger

@interface Foo : NSObject <Baz>

@property (default=@"Hello \"Stefan\"\n", nonatomic, strong, readonly) NSString *p1;
@property (nonatomic, readwrite) int p2;
@property (nonatomic, readonly, weak, default=nil) id<MyObserver> p3;
@property (nonatomic, default=, weak, readwrite) NSObject<MyObserver> *  p4;
@property (nonatomic, readonly) MyCustomInt p5;
- (Foo *)someMethod:(int)i withString:(NSString *)s;

@end
