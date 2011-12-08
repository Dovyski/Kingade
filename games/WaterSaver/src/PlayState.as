package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		public var level:Level1;
		
		private var player:Player;
		private var score:FlxText;
		
		private var starFX:FlxSound;
		
		public function PlayState() {
		}
		
		override public function create():void	{
			Lang.init();
			
			level = new Level1;
			
			starFX = new FlxSound();
			starFX.loadEmbedded(Assets.sfxCollectDrop);
			
			player = new Player(4, 120);
			
			score = new FlxText(0, 0, 100);
			score.color = 0xffffffff;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = "0 / " + level.totalTaps.toString();
			
			add(level);
			add(player);
			add(level.taps);
			add(level.enemies);
			add(score);
			
			//	Tell flixel how big our game world is
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			
			//	Don't let the camera wander off the edges of the map
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			
			//	The camera will follow the player
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
			
			FlxG.playMusic(Assets.musicGamePlay, 0.8);
			FlxG.mouse.hide();
		}
		
		override public function update():void {
			super.update();
			
			FlxG.collide(player, level);
			FlxG.collide(level.enemies, level);
			
			FlxG.overlap(player, level.enemies, hitEnemy);
			FlxG.overlap(player, level.taps, hitTap);
		}
		
		private function changeState() :void {
			FlxG.switchState(new LevelEndState);
		}
		
		private function levelUp() :void {
			FlxG.score = 0;
			player.exists = false;
			FlxG.fade(0xff000000, 2, changeState);
			FlxG.music.fadeOut(2);
		}
		
		private function hitEnemy(player:FlxObject, enemy:FlxObject):void {
			if (Enemy(enemy).isDying) {
				return;
			}
			
			if (player.y < enemy.y) {
				enemy.kill();
				
			} else {
				Player(player).restart();
			}
		}
		
		private function hitTap(p:FlxObject, tap:FlxObject):void {
			tap.kill();
			FlxG.score += 1;
			starFX.play(true);
			
			if (FlxG.score >= level.totalTaps) {
				levelUp();
				
			} else {
				score.text = FlxG.score.toString() + " / " + level.totalTaps.toString();
			}
		}
		
	}

}