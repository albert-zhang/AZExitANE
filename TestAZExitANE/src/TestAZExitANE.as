package
{
	import com.landinggearup.ane.exit.AZExitANE;
	
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class TestAZExitANE extends Sprite
	{
		private var ane:AZExitANE;
		
		public function TestAZExitANE()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			
			var titleField:TextField = new TextField();
			titleField.y = 10;
			titleField.width = 200;
			titleField.defaultTextFormat = new TextFormat("Arial", 30, 0xffffff, true, false, false, null, null, TextFormatAlign.CENTER);
			titleField.text = "Exit Now";
			
			var sp1:Sprite = new Sprite();
			sp1.graphics.beginFill(0xff0000, 1);
			sp1.graphics.drawRoundRect(0, 0, 200, 60, 30, 30);
			sp1.graphics.endFill();
			sp1.addChild(titleField);
			var sp2:Sprite = new Sprite();
			sp2.graphics.beginFill(0x660000, 1);
			sp2.graphics.drawRoundRect(0, 0, 200, 60, 30, 30);
			sp2.graphics.endFill();
			
			var btn:SimpleButton = new SimpleButton(sp1, sp1, sp2, sp2);
			btn.x = 20;
			btn.y = 20;
			addChild(btn);
			
			btn.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
		}
		
		private function onClick(e:MouseEvent):void{
			if(! ane){
				ane = new AZExitANE();
			}
			ane.exit(0);
		}
	}
}