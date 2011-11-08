package
{
	import org.flixel.FlxGame;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]

	public class Main extends FlxGame
	{
		public function Main() {
			super(640, 480, MainMenuState, 1, 60, 60);
			forceDebugger = true;
		}
	}
}
