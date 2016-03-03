//
//  DropitBehavior.h
//  Dropit
//
//  Created by GBGYP-10 on 3.03.2016.
//  Copyright © 2016 emrelks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

-(void) addItem : (id <UIDynamicItem>) item;
-(void) removeItem : (id<UIDynamicItem>) item;

@end
