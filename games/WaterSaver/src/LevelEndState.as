package  
{
	import org.flixel.*;
	
	public class LevelEndState extends FlxState
	{
		[Embed(source = "../assets/water_00.jpg")] public var water00PNG:Class;
		[Embed(source = "../assets/star.png")] public var starPNG:Class;
		
		private var background	:FlxSprite;
		private var won			:FlxText;
		private var stars		:FlxEmitter;

		public function LevelEndState() {
		}
		
		override public function create():void {
			Lang.init();
			
			background = new FlxSprite(0, 0, water00PNG);
			
			won 				= new FlxText(0, FlxG.height * 0.9, FlxG.width, Lang.get("youWin"));
			won.scale.x 		= 4;
			won.scale.y 		= 4;
			won.color 			= 0x00498A;
			won.alignment 		= "center";
			won.scrollFactor.x 	= 0;
			won.scrollFactor.y 	= 0;
			
			stars 				= new FlxEmitter();
			stars.x 			= 160;
			stars.y 			= 100;
			stars.gravity 		= 150;
			
			stars.setXSpeed( -100, 100);
			stars.setYSpeed( -200, 0);
			stars.setRotation( 0, 0);

			stars.makeParticles(starPNG, 100, 0, false, 0);
			
			FlxG.playMusic(Assets.musicMainMenu, 1);
			
			stars.start(false, 4, 0.1);
			
			add(background);
			add(stars);
			add(won);
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.keys.any()) {
				FlxG.fade(0xff000000, 2, changeState);
				FlxG.music.fadeOut(2);
			}
		}
		
		private function changeState():void {
			FlxG.switchState(new MainMenuState);
		}
		
		override public function destroy():void {
			background.destroy();
			background = null;
			super.destroy();
		}
	}
}