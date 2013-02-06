//
//  person.h
//  Untitled
//
//  Created by Geoffrey Pamerleau on 4/16/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface person : NSObject 
{
	NSInteger PERSON_ID;
	NSString *fName;
	NSString *lName;
	
}

@property (nonatomic) NSInteger PERSON_ID;
@property (nonatomic, retain) NSString *fName;
@property (nonatomic, retain) NSString *lName;

-(NSString*)getFirstName;

@end
