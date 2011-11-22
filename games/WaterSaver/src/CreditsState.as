package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class CreditsState extends FlxState
	{
		[Embed(source = '../assets/drawings/20011050.jpg')] private var backgroundPNG:Class;
		
		private var background	:FlxSprite;
		private var credits		:FlxText;
		private var btnBack		:FlxButtonPlus;
		
		public function CreditsState() {
		}
		
		override public function create():void {
			FlxG.mouse.show();
			
			background	= new FlxSprite(0, 0, backgroundPNG);
			
			credits 				= new FlxText(50, FlxG.height, FlxG.width - 100, Lang.get("creditsList"));
			credits.alignment 		= "center";
			credits.color 			= 0x000000;
			credits.size 			= 14;
			credits.velocity.y		= -18;
			
			FlxG.playMusic(titleMusicMP3, 1);
			
			btnBack = new FlxButtonPlus(FlxG.width - 200, FlxG.height * 0.90, goBack, null, Lang.get("menuBack"), 140);
			btnBack.updateInactiveButtonColors([ 0xffFF0080, 0xffFF80C0 ]);
			btnBack.updateActiveButtonColors([ 0xffFFFF00, 0xffFF8000 ]);
			
			add(background);
			add(credits);
			add(btnBack);
		}

		override public function update():void {
			super.update();
			
			if (FlxG.keys.any()) {
				goBack();
			}
			
			if (!credits.onScreen()) {
				credits.y = FlxG.height;
			}
		}
		
		private function goBack() :void {
			FlxG.fade(0xff000000, 2, changeState);
			FlxG.music.fadeOut(2);
		}
		
		private function changeState():void {
			FlxG.switchState(new MainMenuState);
		}
		
		override public function destroy():void	{
			background.destroy();
			background = null;
			super.destroy();
		}
	}
}