package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.CenterSlideFX;
	import org.flixel.plugin.photonstorm.FX.FloodFillFX;
	
	public class MainMenuState extends FlxState
	{
		[Embed(source = '../assets/main_menu.png')] private var mainMenuPNG:Class;
		[Embed(source = '../assets/drawings/20011001.png')] private var d20011001PNG:Class;
		[Embed(source = '../assets/drawings/20011002.png')] private var d20011002PNG:Class;
		[Embed(source = '../assets/drawings/20011003.png')] private var d20011003PNG:Class;
		[Embed(source = '../assets/drawings/20011004.png')] private var d20011004PNG:Class;
		[Embed(source = '../assets/drawings/20011005.png')] private var d20011005PNG:Class;
		[Embed(source = '../assets/drawings/20011006.png')] private var d20011006PNG:Class;
		[Embed(source = '../assets/drawings/20011007.png')] private var d20011007PNG:Class;
		[Embed(source = '../assets/drawings/20011008.png')] private var d20011008PNG:Class;
		[Embed(source = '../assets/drawings/20011009.png')] private var d20011009PNG:Class;
		[Embed(source = '../assets/drawings/20011010.png')] private var d20011010PNG:Class;
		[Embed(source = '../assets/drawings/20011011.png')] private var d20011011PNG:Class;
		[Embed(source = '../assets/drawings/20011012.png')] private var d20011012PNG:Class;
		[Embed(source = '../assets/drawings/20011013.png')] private var d20011013PNG:Class;
		[Embed(source = '../assets/drawings/20011014.png')] private var d20011014PNG:Class;
		[Embed(source = '../assets/drawings/20011015.png')] private var d20011015PNG:Class;
		[Embed(source = '../assets/drawings/20011016.png')] private var d20011016PNG:Class;
		[Embed(source = '../assets/drawings/20011017.png')] private var d20011017PNG:Class;
		[Embed(source = '../assets/drawings/20011018.png')] private var d20011018PNG:Class;
		[Embed(source = '../assets/drawings/20011019.png')] private var d20011019PNG:Class;
		[Embed(source = '../assets/drawings/20011020.png')] private var d20011020PNG:Class;
		[Embed(source = '../assets/drawings/20011021.png')] private var d20011021PNG:Class;
		[Embed(source = '../assets/drawings/20011022.png')] private var d20011022PNG:Class;
		[Embed(source = '../assets/drawings/20011023.png')] private var d20011023PNG:Class;
		[Embed(source = '../assets/drawings/20011024.png')] private var d20011024PNG:Class;
		[Embed(source = '../assets/drawings/20011025.png')] private var d20011025PNG:Class;
		[Embed(source = '../assets/drawings/20011026.png')] private var d20011026PNG:Class;
		[Embed(source = '../assets/drawings/20011027.png')] private var d20011027PNG:Class;
		[Embed(source = '../assets/drawings/20011028.png')] private var d20011028PNG:Class;
		[Embed(source = '../assets/drawings/20011029.png')] private var d20011029PNG:Class;
		[Embed(source = '../assets/drawings/20011030.png')] private var d20011030PNG:Class;
		[Embed(source = '../assets/drawings/20011031.png')] private var d20011031PNG:Class;
		[Embed(source = '../assets/drawings/20011032.png')] private var d20011032PNG:Class;
		[Embed(source = '../assets/drawings/20011033.png')] private var d20011033PNG:Class;
		[Embed(source = '../assets/drawings/20011034.png')] private var d20011034PNG:Class;
		[Embed(source = '../assets/drawings/20011035.png')] private var d20011035PNG:Class;
		[Embed(source = '../assets/drawings/20011036.png')] private var d20011036PNG:Class;
		[Embed(source = '../assets/drawings/20011037.png')] private var d20011037PNG:Class;
		[Embed(source = '../assets/drawings/20011038.png')] private var d20011038PNG:Class;
		[Embed(source = '../assets/drawings/20011039.png')] private var d20011039PNG:Class;
		[Embed(source = '../assets/drawings/20011040.png')] private var d20011040PNG:Class;
		[Embed(source = '../assets/drawings/20011041.png')] private var d20011041PNG:Class;
		[Embed(source = '../assets/drawings/20011042.png')] private var d20011042PNG:Class;
		[Embed(source = '../assets/drawings/20011043.png')] private var d20011043PNG:Class;
		[Embed(source = '../assets/drawings/20011044.png')] private var d20011044PNG:Class;
		[Embed(source = '../assets/drawings/20011045.png')] private var d20011045PNG:Class;
		[Embed(source = '../assets/drawings/20011046.png')] private var d20011046PNG:Class;
		[Embed(source = '../assets/drawings/20011047.png')] private var d20011047PNG:Class;
		[Embed(source = '../assets/drawings/20011048.png')] private var d20011048PNG:Class;
		[Embed(source = '../assets/drawings/20011049.png')] private var d20011049PNG:Class;
		[Embed(source = '../assets/drawings/20011050.png')] private var d20011050PNG:Class;
		[Embed(source = '../assets/drawings/20011051.png')] private var d20011051PNG:Class;
		[Embed(source = '../assets/drawings/20011052.png')] private var d20011052PNG:Class;
		[Embed(source = '../assets/drawings/20011053.png')] private var d20011053PNG:Class;
		[Embed(source = '../assets/drawings/20011054.png')] private var d20011054PNG:Class;
		[Embed(source = '../assets/drawings/20011055.png')] private var d20011055PNG:Class;
		[Embed(source = '../assets/drawings/20011056.png')] private var d20011056PNG:Class;
		[Embed(source = '../assets/drawings/20011057.png')] private var d20011057PNG:Class;
		[Embed(source = '../assets/drawings/20011058.png')] private var d20011058PNG:Class;
		
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
			d20011001PNG, d20011002PNG, d20011003PNG, d20011004PNG, d20011005PNG, d20011006PNG, d20011007PNG, d20011008PNG,
			d20011009PNG, d20011010PNG, d20011011PNG, d20011012PNG, d20011013PNG, d20011014PNG, d20011015PNG, d20011016PNG,
			d20011017PNG, d20011018PNG, d20011019PNG, d20011020PNG, d20011021PNG, d20011022PNG, d20011023PNG, d20011024PNG,
			d20011025PNG, d20011026PNG, d20011027PNG, d20011028PNG, d20011029PNG, d20011030PNG, d20011031PNG, d20011032PNG,
			d20011033PNG, d20011034PNG, d20011035PNG, d20011036PNG, d20011037PNG, d20011038PNG, d20011039PNG, d20011040PNG,
			d20011041PNG, d20011042PNG, d20011043PNG, d20011044PNG, d20011045PNG, d20011046PNG, d20011047PNG, d20011048PNG,
			d20011049PNG, d20011050PNG, d20011051PNG, d20011052PNG, d20011053PNG, d20011054PNG, d20011055PNG, d20011056PNG,
			d20011057PNG, d20011058PNG
		);
		private var currentDrawing :int;
		
		public function MainMenuState() {
		}
		
		override public function create():void {
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
			
			start 					= new FlxText(315, 250, 286, "Salve a água!");
			start.alignment 		= "center";
			start.color 			= 0x00498A;
			start.shadow 			= 0x0000FF;
			start.size 				= 28;
			start.scrollFactor.x 	= 0;
			start.scrollFactor.y 	= 0;
			
			FlxG.playMusic(titleMusicMP3, 1);
			
			floodfill.start();
			
			btnPlay = new FlxButtonPlus(400, 325, onClick, [ "play" ], "Iniciar!", 140);
			btnPlay.updateInactiveButtonColors([ 0xffFF0080, 0xffFF80C0 ]);
			btnPlay.updateActiveButtonColors([ 0xffFFFF00, 0xffFF8000 ]);
			setScrollFactorButton(btnPlay, 0);
			
			btnCredits = new FlxButtonPlus(400, 360, onClick, [ "credits" ], "Créditos", 140);
			btnCredits.updateInactiveButtonColors([ 0xffFF0080, 0xffFF80C0 ]);
			btnCredits.updateActiveButtonColors([ 0xffFFFF00, 0xffFF8000 ]);
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