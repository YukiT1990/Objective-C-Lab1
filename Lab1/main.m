//
//  main.m
//  Lab1
//
//  Created by Yuki Tsukada on 2021/02/23.
//

#import <Foundation/Foundation.h>

NSString *
getUserInput(int maxLength, NSString *prompt) {
    if (maxLength < 1) {
        maxLength = 225;
    }
    NSLog(@"%@ ", prompt);
    char inputChars[maxLength];
    char *result = fgets(inputChars, maxLength, stdin);
    if (result != NULL) {
        NSString *objCString = [NSString stringWithUTF8String:inputChars];
        NSCharacterSet *whitespaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimmedInput = [objCString stringByTrimmingCharactersInSet: whitespaces];
        return trimmedInput;
    }
    return NULL;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        while (YES) {
            NSString *strInput = getUserInput(255, @"\nEnter your String ('q' to quit): ");
            if ([strInput isEqualToString:@"q"]) { break; }
            while (YES) {
                NSString *option = getUserInput(10, @"\nChoose one of the following options:\n1. Uppercase\n2. Lowercase\n3. Numberize\n4. Canadianize\n5. Respond\n6. De-Space-It\n7. Word Count\n8. Remove Punctuations\n9. Done\n");
                if ([option isEqualToString:@"1"]) {
                    // 1. Uppercase
                    NSLog(@"%@", [strInput uppercaseString]);
                } else if ([option isEqualToString:@"2"]) {
                    // 2. Lowercase
                    NSLog(@"%@", [strInput lowercaseString]);
                } else if ([option isEqualToString:@"3"]) {
                    // 3. Numberize
                    if ((long)[strInput integerValue] == 0) {
                        NSLog(@"Conversion unsuccessful.");
                    } else {
                        NSLog(@"Successfully convert to %ld.", (long)[strInput integerValue]);
                    }
                } else if ([option isEqualToString:@"4"]) {
                    // 4. Canadianize
                    NSString *suffix = @", eh?";
                    NSString *canadianized = [strInput stringByAppendingString:suffix];
                    NSLog(@"%@", canadianized);
                } else if ([option isEqualToString:@"5"]) {
                    // 5. Respond
                    if ([strInput hasSuffix:@"?"]) {
                        NSLog(@"I don't know");
                    } else if ([strInput hasSuffix:@"!"]) {
                        NSLog(@"Whoa, calm down!");
                    } else {
                        NSLog(@"Nothing ro respond.");
                    }
                } else if ([option isEqualToString:@"6"]) {
                    // 6. De-Space-It
                    NSString *newString = [strInput stringByReplacingOccurrencesOfString:@" " withString:@"-"];
                    NSLog(@"%@", newString);
                } else if ([option isEqualToString:@"7"]) {
                    // 7. Word Count
                    int count = (int)strInput.length;
                    NSLog(@"%d", count);
                } else if ([option isEqualToString:@"8"]) {
                    // 8. Remove Punctuations
                    NSString* pureCharactors = [[strInput componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
                    NSLog(@"%@", pureCharactors);
                } else if (option == nil || [option isEqualToString:@"9"]) {
                    // 9. Done
                    NSLog(@"Next String!");
                    break;
                } else {
                    NSLog(@"Not available.");
                }
            }
        }
    }
    return 0;
}
