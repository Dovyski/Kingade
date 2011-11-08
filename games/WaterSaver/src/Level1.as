package  
{
	import org.flixel.*;

	public class Level1 extends FlxGroup
	{
		[Embed(source = "../assets/mapCSV_Level1_Sky.csv", mimeType = "application/octet-stream")] public var skyCSV:Class;
		[Embed(source = "../assets/mapCSV_Level1_Map.csv", mimeType = "application/octet-stream")] public var mapCSV:Class;
		[Embed(source = "../assets/mapCSV_Level1_Stars.csv", mimeType = "application/octet-stream")] public var starsCSV:Class;
		[Embed(source = "../assets/mapCSV_Level1_Enemies.csv", mimeType = "application/octet-stream")] public var enemiesCSV:Class;
		[Embed(source = "../assets/backdrop.png")] public var skyTilesPNG:Class;
		[Embed(source = "../assets/tiles.png")] public var mapTilesPNG:Class;
		[Embed(source = "../assets/tiles_students.png")] public var mapTilesStudentsPNG:Class;
		[Embed(source = "../assets/star.png")] public var starPNG:Class;
		
		public var sky			:FlxTilemap;
		public var map			:FlxTilemap;
		public var taps			:FlxGroup;
		public var enemies		:FlxGroup;
		public var levelExit	:FlxPoint;
		
		private var elevator1	:Elevator;
		private var elevator2	:Elevator;
		
		public var width		:int;
		public var height		:int;
		public var totalTaps	:int;

		public function Level1() {
			super();
			
			sky = new FlxTilemap();
			sky.loadMap(new skyCSV, skyTilesPNG, 500, 446);
			sky.setTileProperties(1, FlxObject.NONE);
			sky.scrollFactor.x = 0.9;
			
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapTilesStudentsPNG, 32, 32, 0, 0, 1, 31);
			
			//	Makes these tiles as allowed to be jumped UP through (but collide at all other angles)
			map.setTileProperties(27, FlxObject.UP, null, null, 4);
			map.setTileProperties(16, FlxObject.UP, null, null, 10);
			map.setTileProperties(1, FlxObject.UP, null, null, 7);
			
			map.setTileProperties(33, FlxObject.RIGHT | FlxObject.LEFT, null, null);
			map.setTileProperties(154, FlxObject.ANY, null, null, 6);
			map.setTileProperties(170, FlxObject.ANY, null, null, 6);
			
			levelExit 	= new FlxPoint(99 * 16, 16 * 16);
			width 		= map.width;
			height 		= map.height;
			
			elevator1 	= new Elevator(26, 6, 10, 0);
			elevator2 	= new Elevator(82, 6, 0, 7);
			
			add(sky);
			add(map);
			add(elevator1);
			add(elevator2);
			
			parseTaps();
			parseEnemies();
		}
		
		public function openExit():void {
			//	Removes the two blocking tiles on the right of the map and sets them to nothing, so the player can walk through
			map.setTile(98, 16, 0, true);
			map.setTile(99, 16, 0, true);
		}
		
		private function parseEnemies():void {
			var map:FlxTilemap = new FlxTilemap();
			
			map.loadMap(new enemiesCSV, starPNG, Constants.TILE_SIZE, Constants.TILE_SIZE);
			enemies = new FlxGroup();
			
			for (var ty:int = 0; ty < map.heightInTiles; ty++) {
				for (var tx:int = 0; tx < map.widthInTiles; tx++) {
					if (map.getTile(tx, ty) != 0) {
						enemies.add(new Enemy(tx, ty));
					}
				}
			}
		}
		
		private function parseTaps():void {
			var map:FlxTilemap = new FlxTilemap();
			
			map.loadMap(new starsCSV, starPNG, 16, 16);
			taps = new FlxGroup();
			
			for (var ty:int = 0; ty < map.heightInTiles; ty++) {
				for (var tx:int = 0; tx < map.widthInTiles; tx++) {
					if (map.getTile(tx, ty) != 0) {
						taps.add(new Tap(tx, ty));
						totalTaps++;
					}
				}
			}
		}
	}
}