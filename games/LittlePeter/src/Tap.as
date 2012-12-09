package  
{
	import org.flixel.FlxSprite;

	public class Tap extends FlxSprite
	{
		[Embed(source = '../assets/drop.png')] private var dropPNG:Class;
		
		public function Tap(X:int, Y:int) {
			super(X * Constants.TILE_SIZE, Y * Constants.TILE_SIZE);
			solid = true;
			
			loadGraphic(dropPNG, true, true, 34, 54, true);
			addAnimation("idle", [0, 1, 2, 1, 0], 5, true);
			play("idle");
		}
	}
}