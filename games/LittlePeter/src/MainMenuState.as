package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.CenterSlideFX;
	import org.flixel.plugin.photonstorm.FX.FloodFillFX;
	
	public class MainMenuState extends FlxState
	{
		[Embed(source = '../assets/main_menu.png')] private var mainMenuPNG:Class;
		[Embed(source = '../assets/drawings/PEDR0500.jpg')] private var dPEDR0500JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0501.jpg')] private var dPEDR0501JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0502.jpg')] private var dPEDR0502JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0503.jpg')] private var dPEDR0503JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0504.jpg')] private var dPEDR0504JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0505.jpg')] private var dPEDR0505JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0506.jpg')] private var dPEDR0506JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0507.jpg')] private var dPEDR0507JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0508.jpg')] private var dPEDR0508JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0509.jpg')] private var dPEDR0509JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0510.jpg')] private var dPEDR0510JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0511.jpg')] private var dPEDR0511JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0512.jpg')] private var dPEDR0512JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0513.jpg')] private var dPEDR0513JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0514.jpg')] private var dPEDR0514JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0515.jpg')] private var dPEDR0515JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0516.jpg')] private var dPEDR0516JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0517.jpg')] private var dPEDR0517JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0518.jpg')] private var dPEDR0518JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0519.jpg')] private var dPEDR0519JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0520.jpg')] private var dPEDR0520JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0521.jpg')] private var dPEDR0521JPG:Class;
		[Embed(source = '../assets/drawings/PEDR0522.jpg')] private var dPEDR0522JPG:Class;
		
		private static const	BACKGROUND_SPEED :Number = -100;
		
		private var background	:FlxGroup;
		private var title		:FlxSprite;
		private var backImg1	:FlxSprite;
		private var backImg2	:FlxSprite;
		private var start		:FlxText;
		private var reveal		:CenterSlideFX;
		private var floodfill	:FloodFillFX;
		private var btnPlay		:FlxButtonPlus;
		private var btnCredits	:FlxButtonPlus;
		private var drawings	:Array = new Array(
			dPEDR0500JPG, dPEDR0501JPG, dPEDR0502JPG, dPEDR0503JPG, dPEDR0504JPG, dPEDR0505JPG, dPEDR0506JPG, dPEDR0507JPG, dPEDR0508JPG,
			dPEDR0509JPG, dPEDR0510JPG, dPEDR0511JPG, dPEDR0512JPG, dPEDR0513JPG, dPEDR0514JPG, dPEDR0515JPG, dPEDR0516JPG,
			dPEDR0517JPG, dPEDR0518JPG, dPEDR0519JPG, dPEDR0520JPG, dPEDR0521JPG, dPEDR0522JPG
		);
		private var currentDrawing :int;
		
		override public function create():void {
			Lang.init();
			
			if (FlxG.getPlugin(FlxSpecialFX) == null){
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			FlxG.mouse.show();
			
			background				= new FlxGroup();
			currentDrawing 			= 0;
			
			backImg1				= new FlxSprite(0, 0, drawings[currentDrawing++]);
			backImg2				= new FlxSprite(640, 0, drawings[currentDrawing++]);
			backImg1.velocity.x 	= BACKGROUND_SPEED;
			backImg2.velocity.x 	= BACKGROUND_SPEED;
			
			background.add(backImg1);
			background.add(backImg2);
			
			reveal 			= FlxSpecialFX.centerSlide();
			floodfill 		= FlxSpecialFX.floodFill();
			
			var t:FlxSprite = new FlxSprite(0, 0, mainMenuPNG);
			
			title 					= floodfill.create(t, 0, 0, t.width, t.height, 0, 1);
			title.scrollFactor.x 	= 0;
			title.scrollFactor.y 	= 0;
			
			start 					= new FlxText(190, 200, 286, Lang.get("gameTitle"));
			start.alignment 		= "center";
			start.color 			= 0x00498A;
			start.shadow 			= 0x0000FF;
			start.size 				= 28;
			start.scrollFactor.x 	= 0;
			start.scrollFactor.y 	= 0;
			
			FlxG.playMusic(Assets.musicMainMenu, 1);
			
			floodfill.start();
			
			btnPlay = new FlxButtonPlus(250, 355, onClick, [ "play" ], Lang.get("menuPlay"), 140);
			btnPlay.updateInactiveButtonColors([ 0xff0000AF, 0xff0000FF ]);
			btnPlay.updateActiveButtonColors([ 0xff0000AA, 0xff0000AA ]);
			setScrollFactorButton(btnPlay, 0);
			
			btnCredits = new FlxButtonPlus(250, 390, onClick, [ "credits" ], Lang.get("menuCredits"), 140);
			btnCredits.updateInactiveButtonColors([ 0xff0000AF, 0xff0000FF ]);
			btnCredits.updateActiveButtonColors([ 0xff0000AA, 0xff0000AA ]);
			setScrollFactorButton(btnCredits, 0);
			
			add(background);
			add(title);
			add(start);
			add(btnPlay);
			add(btnCredits);
		}
		
		private function setScrollFactorButton(button :FlxButtonPlus, factor :Number) :void {
			button.buttonNormal.scrollFactor.x 		= factor;
			button.buttonNormal.scrollFactor.y 		= factor;
			
			button.buttonHighlight.scrollFactor.x 	= factor;
			button.buttonHighlight.scrollFactor.y 	= factor;
			
			button.textNormal.scrollFactor.x 		= factor;
			button.textNormal.scrollFactor.y 		= factor;
			
			button.textHighlight.scrollFactor.x 	= factor;
			button.textHighlight.scrollFactor.y 	= factor;
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.keys.any()) {
				endCurrentState(startPlayState);
			}
			
			currentDrawing = currentDrawing >= drawings.length ? 0 : currentDrawing;
			
			if (!backImg1.onScreen()) {
				background.remove(backImg1, true);
				backImg1.destroy();
				backImg1			= null;
				backImg1 			= new FlxSprite(FlxG.width, 0, drawings[currentDrawing++]);
				backImg1.velocity.x = BACKGROUND_SPEED;
				
				background.add(backImg1);
			}

			if (!backImg2.onScreen()) {
				background.remove(backImg2, true);
				backImg2.destroy();
				backImg2			= null;
				backImg2 			= new FlxSprite(FlxG.width, 0, drawings[currentDrawing++]);
				backImg2.velocity.x = BACKGROUND_SPEED;
				
				background.add(backImg2);
			}
		}
		
		private function endCurrentState(nextStateCallback :Function) :void {
			FlxG.fade(0xff000000, 2, nextStateCallback);
			FlxG.music.fadeOut(2);
		}
		
		private function startPlayState():void {
			FlxG.switchState(new CinematicsState);
		}
		
		private function startCreditsState():void {
			FlxG.switchState(new CreditsState);
		}
		
		override public function destroy():void	{
			FlxSpecialFX.clear();			
			super.destroy();
		}

		private function onClick(text:String):void {
			endCurrentState(text == "play" ? startPlayState : startCreditsState);
		}
		
		private function mouseOver():void {
		}
		
		private function mouseOut():void {
		}
	}
}