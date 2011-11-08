package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/player.png')] private var playerPNG:Class;
		
		private var jumpFX:FlxSound;
		private var walkFX:FlxSound;
		private var start:FlxPoint;
		
		public function Player(x:Number, y:Number) {
			//	As this extends FlxSprite we need to call super() to ensure all of the parent variables we need are created
			super(x, y);
			
			start = new FlxPoint(x, y);
			
			jumpFX = new FlxSound();
			jumpFX.loadEmbedded(jumpSFX);
			
			walkFX = new FlxSound();
			walkFX.loadEmbedded(walkSFX, true);
			
			//	Load the player.png into this sprite.
			//	The 2nd parameter tells Flixel it's a sprite sheet and it should chop it up into 16x18 sized frames.
			loadGraphic(playerPNG, true, true, 42, 52, true);
			
			//	The sprite is 16x18 in size, but that includes a little feather of hair on its head which we don't want to include in collision checks.
			//	We also shave 2 pixels off each side to make it slip through gaps easier. Changing the width/height does NOT change the visual sprite, just the bounding box used for physics.
			width = 42;
			height = 52;
			
			//	Because we've shaved a few pixels off, we need to offset the sprite to compensate
			offset.x = 2;
			offset.y = 2;
			
			//	The Animation sequences we need
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [0, 1, 0, 2], 10, true);
			addAnimation("jump", [1], 0, false);
			addAnimation("hurt", [4], 0, false);
			
			//	Enable the Controls plugin - you only need do this once (unless you destroy the plugin)
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			//	Add this sprite to the FlxControl plugin and tell it we want the sprite to accelerate and decelerate smoothly
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			
			//	Sprite will be controlled with the left and right cursor keys
			FlxControl.player1.setCursorControl(false, false, true, true);
			
			//	And SPACE BAR will make them jump up to a maximum of 200 pixels (per second), only when touching the FLOOR
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, Constants.PLAYER_JUMP, FlxObject.FLOOR, 250, 200);
			
			//	Because we are using the MOVEMENT_ACCELERATES type the first value is the acceleration speed of the sprite
			//	Think of it as the time it takes to reach maximum velocity. A value of 100 means it would take 1 second. A value of 400 means it would take 0.25 of a second.
			FlxControl.player1.setMovementSpeed(Constants.PLAYER_SPEED, 0, 100, Constants.PLAYER_JUMP, 400, 0);
			
			//	Set a downward gravity of 400px/sec
			FlxControl.player1.setGravity(0, 400);
			
			FlxControl.player1.setSounds(jumpFX, null, walkFX);
			
			//	By default the sprite is facing to the right.
			//	Changing this tells Flixel to flip the sprite frames to show the left-facing ones instead.
			facing = FlxObject.RIGHT;
		}
		
		//	We don't actually kill the player at all, we just reset them
		public function restart():void {
			// TODO: anim?
			reset(start.x, start.y);
		}
		
		override public function update():void {
			super.update();
			
			if (x < 0) {
				x = 0;
			}
			
			if (touching == FlxObject.FLOOR) {
				if (velocity.x != 0) {
					play("walk");
				} else {
					play("idle");
				}
			} else if (velocity.y < 0) {
				play("jump");
			}
		}
	}
}