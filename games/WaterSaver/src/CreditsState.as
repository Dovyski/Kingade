package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class CreditsState extends FlxState
	{
		[Embed(source = '../assets/drawings/20011050.jpg')] private var backgroundPNG:Class;
		
		private static var CREDITS_TEXT	:String	= "Salve a Água!\n\nProjeto 'Educação Ambiental e produção de material multimídia com caráter pedagógico e educativo'\n\nEdital Nº 01/PROEC/UFFS/2010\nUniversidade Federal da Fronteira Sul (UFFS)\nwww.uffs.edu.br\n\n\nCoordenador\nProf. Fernando Bevilacqua\n\n\nEquipe UFFS\nProf. Fernando Bevilacqua\nProfa. Adriana Salete Loss\nProf. Fabrício Bueno B. dos Santos\nProf. Rafael Piccin Torchelsen\nProf. Élsio Corá\nProf. Antonio Valmor de Campos\nProfa. Aurelia Lopes Gomes\nProfa. Joseane de Menezes Sterndt\nSimone de Melo (Pedagogia)\nMichel Soares Tartas (Ciência da Computação)\nPatric Venturini (Ciência da Computação)\n\n\nEquipe Escola Estadual Lourdes Tonin\nProfa. Cicrano da Fulano\nProf. Cicrano da Fulano\n\n\nDesenhos\nAlunos do 5º ano, E.E. Lourdes Tonin\nAlunos da 6a série, E.E. Lourdes Tonin\n\n\nMúsica\nThiago Gobet Spada, trilhasonora.com\n\n\nAgradecimento especial\nEquipe e alunos da escola Lourdes Tonin\nThiago Gobet Spada\n\n\nFinanciamento\nPró-reitoria de Extensão, UFFS";
		
		private var background	:FlxSprite;
		private var credits		:FlxText;
		private var btnBack		:FlxButtonPlus;
		
		public function CreditsState() {
		}
		
		override public function create():void {
			FlxG.mouse.show();
			
			background	= new FlxSprite(0, 0, backgroundPNG);
			
			credits 				= new FlxText(50, FlxG.height, FlxG.width - 100, CREDITS_TEXT);
			credits.alignment 		= "center";
			credits.color 			= 0x000000;
			credits.size 			= 14;
			credits.velocity.y		= -18;
			
			FlxG.playMusic(titleMusicMP3, 1);
			
			btnBack = new FlxButtonPlus(FlxG.width - 200, FlxG.height * 0.90, goBack, null, "Voltar", 140);
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