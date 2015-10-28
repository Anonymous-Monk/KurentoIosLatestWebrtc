//
//  NBMUtilities.m
//  KurentoClient-iOS
//
//  Created by Marco Rossi on 18/09/15.
//  Copyright © 2015 Telecom Italia S.p.A. All rights reserved.
//

#import "NBMUtilities.h"

@implementation NSDictionary (NBMUtilites)

+ (NSDictionary *)nbm_dictionaryWithJSONString:(NSString *)jsonString {
    NSParameterAssert(jsonString.length > 0);
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dict =
    [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        NSLog(@"Error parsing JSON: %@", error.localizedDescription);
        return nil;
    }
    return dict;
}

+ (NSDictionary *)nbm_dictionaryWithJSONData:(NSData *)jsonData {
    NSError *error = nil;
    NSDictionary *dict =
    [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (error) {
        NSLog(@"Error parsing JSON: %@", error.localizedDescription);
        return nil;
    }
    return dict;
}

@end

@implementation NSString (NBMUtilites)

+ (NSString *)nbm_stringFromJSONDictionary:(NSDictionary *)jsonDictionary {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonDictionary options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"Error parsing Data: %@", error.localizedDescription);
        return nil;
    }
    return [self nbm_stringFromJSONData:data];
}

+ (NSString *)nbm_stringFromJSONData:(NSData *)jsonData
{
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end