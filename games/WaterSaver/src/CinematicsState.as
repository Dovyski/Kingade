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
		[Embed(source = "../assets/water_05.png")] public var water05PNG:Class;
		[Embed(source = "../assets/water_06.png")] public var water06PNG:Class;
		
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
										[ { "x": 50, "y": 65, "width": 230, "text": "A ÁGUA é algo fundamental para a vida! Temos que cuidar dela." } ],
										[ { "x": 242, "y": 35, "width": 215, "text": "\nExiste bastante água, mas ela pode acabar um dia..." } ],
										[ { "x": 270, "y": 370, "width": 215, "text": "Esse é o ciclo da água. Temos que cuidar dele e poupar água." } ],
										[ { "x": 260, "y": 75, "width": 215, "text": "Feche a torneira enquanto escova os dentes. Não gaste água potável!" } ],
										[ 
											{ "x": 355, "y": 35, "width": 215, "text": "\nGuarde a água da chuva para lavar o chão, por exemplo." },
											{ "x": 350, "y": 195, "width": 220, "text": "Use balde para lavar o carro. Gasta menos água do que a manga." },
											{ "x": 300, "y": 356, "width": 186, "text": "Não demore no banho e feche o chuveiro para se ensaboar." },
										],
										[ { "x": 280, "y": 395, "width": 216, "text": "Poluir os rios destroi o meio ambiente." } ],
										[ { "x": 290, "y": 225, "width": 250, "text": "Esse é o Sr. Folha. Ajude ele a proteger a água pegando as gotas e despoluindo os rios!\n\nBoa sorte!" } ],
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
			
			if (FlxG.keys.any() && (getTime() - time) >= 500) {
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