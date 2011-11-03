package  
{
	import org.flixel.FlxSprite;

	public class Tap extends FlxSprite
	{
		[Embed(source = '../assets/star.png')] private var starPNG:Class;
		
		public function Tap(X:int, Y:int) {
			super(X * 16, Y * 16, starPNG);
			solid = true;
		}
	}
}