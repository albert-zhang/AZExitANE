//
//  AZExitANE.m
//  AZExitANE
//
//  Created by Albert Zhang on 4/6/14.
//  Copyright (c) 2014 Albert Zhang. All rights reserved.
//

#import "FlashRuntimeExtensions.h"


FREObject AZExitANEExit(FREContext ctx,
						void* funcData,
						uint32_t argc,
						FREObject argv[])
{
	int exitCode;
	FREGetObjectAsInt32(argv[0], &exitCode);
	
	exit(exitCode);
	
	return NULL;
}


void AZExitANEContextInitializer(void* extData,
								 const uint8_t* ctxType,
								 FREContext ctx,
								 uint32_t* numFunctionsToTest,
								 const FRENamedFunction** functionsToSet)
{
	*numFunctionsToTest = 1;
	
	FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToTest));
	
	func[0].name = (const uint8_t*) "AZExitANEExit";
	func[0].functionData = NULL;
	func[0].function = &AZExitANEExit;
	
	*functionsToSet = func;
}


void AZExitANEInitializer(void** extDataToSet,
						  FREContextInitializer* ctxInitializerToSet,
						  FREContextFinalizer* ctxFinalizerToSet)
{
	*extDataToSet = NULL;
	*ctxInitializerToSet = &AZExitANEContextInitializer;
}

void AZExitANEFinalizer(FREContext ctx){
	
}

