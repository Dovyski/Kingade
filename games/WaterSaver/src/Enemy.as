package  
{
	import org.flixel.*;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import com.greensock.easing.Linear;

	public class Enemy extends FlxSprite
	{
		[Embed(source = '../assets/mr_trash.png')] private var mrTrashPNG:Class;
		
		public var isDying				:Boolean = false;
		private var lastPos 			:FlxPoint;
		private var standingSamePlace	:int = 0;
		
		public function Enemy(x:int, y:int) {
			super(x * Constants.TILE_SIZE, y * Constants.TILE_SIZE);
			
			loadGraphic(mrTrashPNG, true, true, 42, 52);
			
			facing 		= FlxObject.RIGHT;
			lastPos 	= new FlxPoint();
			
			addAnimation("walk", [0, 1], 6, true);
			play("walk");
			
			acceleration.y = 50;
			velocity.x = 30;
		}
		

		
		override public function kill():void {
			FlxG.play(Assets.sfxKillEnemy, 0.5, false, true);
			
			isDying 	= true;
			frame 		= 1;
			velocity.x 	= 0;
			velocity.y 	= 0;
			angle 		= 180;
			
			TweenMax.to(this, 1.5, { bezier: [ {x:"64", y:"-64"}, {x:"80", y:"200"} ], onComplete: removeSprite } );
		}
		
		private function removeSprite():void {
			exists = false;
		}
		
		override public function update():void {
			super.update();
			
			if (int(lastPos.x) == int(x) && int(lastPos.y) == int(y)) {
				standingSamePlace++;
				
				if (standingSamePlace > 10) {
					turnAround();
				}
			} else {
				standingSamePlace = 0;
			}
			
			//	Check the tiles below it
			if (!isTouching(FlxObject.FLOOR) && !isDying) {
				turnAround();
			}
			
			lastPos.x 	= x;
			lastPos.y 	= y;
		}
		
		private function turnAround():void {
			standingSamePlace 	= 0;
			
			if (facing == FlxObject.RIGHT) {
				facing = FlxObject.LEFT;
				velocity.x = -30;
				
			} else {
				facing = FlxObject.RIGHT;
				velocity.x = 30;
			}
		}
		
	}

}