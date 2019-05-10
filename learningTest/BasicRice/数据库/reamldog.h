
//https://www.jianshu.com/p/f415d07bc446


#import <Realm/Realm.h>

@interface reamldog : RLMObject

@property(strong,nonatomic)NSString *name;

@property(assign,nonatomic)int age;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<reamldog *><reamldog>
RLM_ARRAY_TYPE(reamldog)
