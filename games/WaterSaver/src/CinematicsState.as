package  
{
	import org.flixel.*;
	
	public class CinematicsState extends FlxState
	{
		[Embed(source = "../assets/water_00.jpg")] public var water00PNG:Class;
		[Embed(source = "../assets/water_01.jpg")] public var water01PNG:Class;
		[Embed(source = "../assets/water_02.jpg")] public var water02PNG:Class;
		[Embed(source = "../assets/water_03.jpg")] public var water03PNG:Class;
		[Embed(source = "../assets/water_04.jpg")] public var water04PNG:Class;
		[Embed(source = "../assets/water_05.jpg")] public var water05PNG:Class;
		[Embed(source = "../assets/water_06.jpg")] public var water06PNG:Class;
		
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
										water05PNG,
										water06PNG
									];
		private var texts 			:Array = [
										[ { "x": 50, "y": 65, "width": 230, "text": Lang.get("dropSpeach1") } ],
										[ { "x": 242, "y": 35, "width": 215, "text": Lang.get("dropSpeach2") } ],
										[ { "x": 270, "y": 370, "width": 215, "text": Lang.get("dropSpeach3") } ],
										[ { "x": 260, "y": 75, "width": 215, "text": Lang.get("dropSpeach4") } ],
										[ 
											{ "x": 355, "y": 35, "width": 215, "text": Lang.get("dropSpeach5a")  },
											{ "x": 350, "y": 195, "width": 220, "text": Lang.get("dropSpeach5b") },
											{ "x": 300, "y": 356, "width": 186, "text": Lang.get("dropSpeach5c") },
										],
										[ { "x": 280, "y": 395, "width": 216, "text": Lang.get("dropSpeach6") } ],
										[ { "x": 290, "y": 225, "width": 250, "text": Lang.get("dropSpeach7") } ],
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
			
			//FlxG.playMusic(titleMusicMP3, 1);
			
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