package  
{
	public class Assets 
	{
	
		/**
		 * Sound effects:
		 * 
	     * http://www.flashkit.com/soundfx/Cartoon/Pops/Pop_2-Texavery-8930/index.php
	     * http://www.flashkit.com/soundfx/Cartoon/Splashes/Deep_spl-Sith_Mas-7718/index.php
	     * http://www.flashkit.com/soundfx/Ambience/Water/Boat-MaRc-8003/index.php
	     * http://www.flashkit.com/soundfx/Cartoon/Movement/Footstep-Ninja_Sn-8065/index.php
	     * http://www.flashkit.com/soundfx/Cartoon/Pops/Pop-PhoenixJ-8164/index.php
	     * http://www.flashkit.com/soundfx/Cartoon/Pops/Stretch_-Texavery-8989/index.php
		 * 
		 */
		[Embed(source = "../assets/sfx/Boat-MaRc-8003_hifi.mp3")] 			public static var sfxWaterFlowing		:Class;
		[Embed(source = "../assets/sfx/Pop-PhoenixJ-8164_hifi.mp3")] 		public static var sfxJump				:Class;
		[Embed(source = "../assets/sfx/Deep_spl-Sith_Mas-7718_hifi.mp3")] 	public static var sfxSpashWater			:Class;
		[Embed(source = "../assets/sfx/Footstep-Ninja_Sn-8065_hifi.mp3")] 	public static var sfxWalk				:Class;
		[Embed(source = "../assets/sfx/Pop_2-Texavery-8930_hifi.mp3")] 		public static var sfxCollectDrop		:Class;
		[Embed(source = "../assets/sfx/Stretch_-Texavery-8989_hifi.mp3")] 	public static var sfxKillEnemy			:Class;
		 
		 /**
		  * Music by Thiago Gobet (trilhasonora.com)
		  */
		[Embed(source = "../assets/music/Bolero_ThiagoGobet.mp3")] 			public static var musicMainMenu			:Class;
		[Embed(source = "../assets/music/CaribeanGameEndCredits.mp3")] 		public static var musicGamePlay			:Class;
		
		public function Assets() {
		}
	}
}