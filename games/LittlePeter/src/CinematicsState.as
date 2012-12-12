package  
{
	import org.flixel.*;
	
	public class CinematicsState extends FlxState
	{
		[Embed(source = "../assets/water_00.png")] public var water00PNG:Class;
		[Embed(source = "../assets/water_01.png")] public var water01PNG:Class;
		[Embed(source = "../assets/water_02.png")] public var water02PNG:Class;
		[Embed(source = "../assets/water_03.png")] public var water03PNG:Class;
		[Embed(source = "../assets/water_04.png")] public var water04PNG:Class;
		
		private var image 			:FlxSprite;
		private var time 			:Number;
		private var currentIndex 	:int;
		private var textBoxes 		:Array;
		private var images 			:Array = [
										water00PNG,
										water01PNG,
										water02PNG,
										water03PNG,
										water04PNG,
										water00PNG
									];
		private var texts 			:Array = [
										[ { "x": 91, "y": 30, "width": 293, "text": Lang.get("dropSpeach1") } 	],
										[ { "x": 121, "y": 200, "width": 293, "text": Lang.get("dropSpeach2") } ],
										[ { "x": 102, "y": 79, "width": 293, "text": Lang.get("dropSpeach3") } 	],
										[ { "x": 123, "y": 71, "width": 293, "text": Lang.get("dropSpeach4") } 	],
										[ { "x": 229, "y": 71, "width": 293, "text": Lang.get("dropSpeach5") } 	],
										[ { "x": 91, "y": 30, "width": 293, "text": Lang.get("dropSpeach6") } 	],
									];

		public function CinematicsState() {
		}
		
		private function showNextImageAndText() :void {
			if (currentIndex < images.length) {
				showCurrentImage();
				showCurrentText();
				
				time = getTime();
				currentIndex++;
			} else {
				startGamePlay();
			}
		}
		
		private function showCurrentImage() :void {
			if (image != null) {
				image.kill();
				image.destroy();
				image = null;
			}
			
			image = new FlxSprite(0, 0, images[currentIndex]);
			image.loadGraphic(images[currentIndex]);
			add(image);
		}
		
		private function showCurrentText() :void {
			var i: int;
			var info :Object;
			
			for (i = 0; i < textBoxes.length; i++) {
				if (textBoxes[i] != null) {
					textBoxes[i].kill();
					textBoxes[i].destroy();					
				}
			}
			
			textBoxes.splice(0);
			
			for (i = 0; i < texts[currentIndex].length; i++) {
				info							= texts[currentIndex][i];
				textBoxes[i] 					= new FlxText(info.x, info.y, info.width, info.text);
				textBoxes[i].alignment 			= "center";
				textBoxes[i].color 				= 0x00498A;
				textBoxes[i].size				= 17;
				textBoxes[i].scrollFactor.x 	= 0;
				textBoxes[i].scrollFactor.y 	= 0;
				
				add(textBoxes[i]);
			}
		}
		
		override public function create():void
		{
			time 				= getTime();
			currentIndex 		= 0;
			textBoxes			= new Array();
			
			FlxG.playMusic(Assets.sfxWaterFlowing, 1);
			
			showNextImageAndText();
		}
		
		private function getTime() :Number {
			return (new Date()).getTime();
		}
		
		override public function update():void {
			super.update();
			
			if ((FlxG.keys.any() || FlxG.mouse.justPressed()) && (getTime() - time) >= 500) {
				showNextImageAndText();
			}
		}
		
		private function startGamePlay() :void {
			FlxG.fade(0xff000000, 2, changeState);
			//FlxG.music.fadeOut(2);			
		}
		
		private function changeState():void {
			FlxG.switchState(new PlayState);
		}
		
		override public function destroy():void {
			var i: int;
			
			for (i = 0; i < textBoxes.length; i++) {
				textBoxes[i].destroy();
				textBoxes[i] = null;
			}
			image.destroy();
			
			textBoxes = null;
			image = null;
			
			super.destroy();
		}
	}
}