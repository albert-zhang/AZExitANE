package com.landinggearup.ane.exit
{
	import flash.desktop.NativeApplication;
	import flash.events.EventDispatcher;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;
	
	public class AZExitANE extends EventDispatcher
	{
		private var _extContext:ExtensionContext;
		
		public function AZExitANE()
		{
			super();
			
			if((! this.isIOS()) && (! this.isAndroid())){
				throw new Error("Unsupported platform");
			}
			
			_extContext = ExtensionContext.createExtensionContext("com.landinggearup.ane.exit", "");
			
			if(! _extContext){
				throw new Error("Cannot create AZExitANE");
			}
		}
		
		private function isIOS():Boolean{
			return Capabilities.manufacturer.toLowerCase().indexOf("ios") >= 0;
		}
		
		private function isAndroid():Boolean{
			return Capabilities.manufacturer.toLowerCase().indexOf("android") >= 0;
		}
		
		public function exit(code:int=0):void{
			if(this.isIOS()){
				_extContext.call("AZExitANEExit", code);
				
			}else if(this.isAndroid()){
				NativeApplication.nativeApplication.exit(code);
				
			}
		}
	}
}