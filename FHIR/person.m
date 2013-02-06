//
//  person.m
//  Untitled
//
//  Created by Geoffrey Pamerleau on 4/16/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#import "person.h"


@implementation person
@synthesize PERSON_ID,fName,lName;

-(NSString*)getFirstName
{
	return self.fName;
}

@end
