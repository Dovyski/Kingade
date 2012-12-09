package 
{
	import flash.display.LoaderInfo;
	import org.flixel.FlxG;
	
	/**
	 * @author Andrey Volodko
	 * @link http://flashgamedojo.com/wiki/index.php?title=Localization_(Flixel)_v2
	 */
	public class Lang
	{
		private static var lngArr :Object;
		
		// English strings - Also use if other keys are null
		public static var br :Object = {
			gameTitle			:"Salve a água!", 
			menuPlay			:"Iniciar!",
			menuCredits			:"Créditos",
			menuBack			:"Voltar",
			creditsList			:"Salve a Água!\n\nProjeto 'Educação Ambiental e produção de material multimídia com caráter pedagógico e educativo'\n\nEdital 01/PROEC/UFFS/2010\nUniversidade Federal da Fronteira Sul (UFFS)\nwww.uffs.edu.br\n\n\nCoordenador\nProf. Fernando Bevilacqua\n\n\nEquipe UFFS\nProf. Fernando Bevilacqua\nProfa. Adriana Salete Loss\nProf. Fabrício Bueno B. dos Santos\nProf. Rafael Piccin Torchelsen\nProf. Élsio Corá\nProf. Antonio Valmor de Campos\nProfa. Aurelia Lopes Gomes\nProfa. Joseane de Menezes Sterndt\nSimone de Melo (Pedagogia)\nMichel Soares Tartas (Ciência da Computação)\nPatric Venturini (Ciência da Computação)\n\n\nEquipe Escola E. Lourdes Tonin\nRosilei Hans - Diretora\nOdete Baptista - Assessora de Direção\nLenair Braghini - Assistente de Educação\nMarinês Camatti - Professora do 5ª ano\nCleusa Hunttmann - Professora\nHelena Simon - Professora\nNeoimi Triches - Professora\nDolores Ferro - Professora\nWilson Fiabane - Professor\nAndressa Rodrigues - Professora\nIvan Mucelini - Professor\nNestor Caon - Professor\n\n\nDesenhos\nAlunos do 5º ano, E.E. Lourdes Tonin\nAlunos da 6a série, E.E. Lourdes Tonin\n\n\nMúsica\nThiago Gobet Spada, trilhasonora.com\n\n\nEfeitos sonoros\nflashkit.com/soundfx/\n\n\nAgradecimento especial\nEquipe e alunos da escola Lourdes Tonin\nThiago Gobet Spada\nRich \"Photonstorm\" Davey\n\n\nFinanciamento\nPró-reitoria de Extensão, UFFS",
			youWin				:"Você venceu!",
			dropSpeach1			:"Olá!\nSou o Sr. Água. Aperte qualquer tecla para continuar...",
			dropSpeach2			:"\nExiste bastante água, mas ela pode acabar um dia...",
			dropSpeach3			:"Esse é o ciclo da água. Temos que cuidar dele e poupar água.",
			dropSpeach4			:"Feche a torneira enquanto escova os dentes. Não gaste água potável!",
			dropSpeach5a		:"\nGuarde a água da chuva para lavar o chão, por exemplo.",
			dropSpeach5b		:"Use balde para lavar o carro. Gasta menos água do que a manga.",
			dropSpeach5c		:"Não demore no banho e feche o chuveiro para se ensaboar.",
			dropSpeach6			:"Poluir os rios destroi o meio ambiente.",
			dropSpeach7			:"Esse é o Sr. Folha. Ajude ele a proteger a água pegando as gotas e despoluindo os rios!\n\nBoa sorte!"
		};
		
		// Brazilian portuguese strings
		public static var en :Object = {
			gameTitle			:"Save the Water!", 
			menuPlay			:"Play!",
			menuCredits			:"Credits",
			menuBack			:"Back",
			creditsList			:"Save the Water!\n\nProject 'Sustainability education for kids using games'\n\nEdict 01/PROEC/UFFS/2010\nFederal Univerity of Fronteira Sul (UFFS)\nwww.uffs.edu.br\n\n\nProject Leader\nProf. Fernando Bevilacqua\n\n\nUFFS Team\nProf. Fernando Bevilacqua\nProfa. Adriana Salete Loss\nProf. Fabrício Bueno B. dos Santos\nProf. Rafael Piccin Torchelsen\nProf. Élsio Corá\nProf. Antonio Valmor de Campos\nProfa. Aurelia Lopes Gomes\nProfa. Joseane de Menezes Sterndt\nSimone de Melo (Pedagogy)\nMichel Soares Tartas (Computer Science)\nPatric Venturini (Computer Science)\n\n\nLourdes Tonin School Team\nRosilei Hans - Head teacher\nOdete Baptista - Principals Assistant\nLenair Braghini - Education Assistant\nMarinês Camatti - 5th grade teacher\nCleusa Hunttmann - Teacher\nHelena Simon - Teacher\nNeoimi Triches - Teacher\nDolores Ferro - Teacher\nWilson Fiabane - Teacher\nAndressa Rodrigues - Teacher\nIvan Mucelini - Teacher\nNestor Caon - Teacher\n\n\nArt\nKids from 5th grade, Lourdes Tonin School\nKids from 6th grade, Lourdes Tonin School\n\n\nMusic\nThiago Gobet Spada, trilhasonora.com\n\n\nSound effects\nflashkit.com/soundfx/\n\n\nSpecial thanks\nLourdes Tonin School team and kids\nThiago Gobet Spada\nRich \"Photonstorm\" Davey\n\n\nFunding\nPró-reitoria de Extensão, UFFS",
			youWin				:"You win!",
			dropSpeach1			:"Hi!\nI am Mr Water. Press any key to continue...",
			dropSpeach2			:"\nThere is a lot of water, but it may end some day...",
			dropSpeach3			:"That is the water cicle. We must protect it and save water.",
			dropSpeach4			:"Close the tap while you brush your teeth. Do not waste potable water!",
			dropSpeach5a		:"\nSave some water from the rain to wash the floor, for instance.",
			dropSpeach5b		:"Use a bucket to wash the car, it can save a lot of water. ",
			dropSpeach5c		:"Take quick baths and hold the water while you lather.",
			dropSpeach6			:"Dumping junk into the rivers will destroy them",
			dropSpeach7			:"\nThis is Mr Leaf. Help him protect the water by catching the drops.\n\nGood luck!"
		};		
		/**
		 * 
		 */
		public function Lang() {
		}
		/**
		 * Lang initialization. You must call it before.
		 * Use: Lang.init();
		 */
		static public function init():void {
			lngArr = br;

			// check flashvars
			try {
				var params:Object = LoaderInfo(FlxG.stage.root.loaderInfo).parameters;
				
				if (params.lang != null) {
					setLang(params.lang);
					FlxG.log("Selected language: " + params.lang);
				}
			} catch (e :Error) {
				FlxG.log("Unable to select language.");
			}
		} 
		
		/**
		 * Set language
		 * Use: Lang.setLng(Lang.ru);
		 */
		static public function setLang(code:String):void {
				switch(code) {
					case "en":
						lngArr = en;
						break;
						
					case "br":
					case "pt-br":
					default:
						lngArr = br;
						break;
				}
		}
		/**
		 * Localization helper
		 * Use: Lang.get("name");
		 */
		static public function get(sname :String) :String {
			if (lngArr[sname] == null) {
				return br[sname];
			} else {
				return lngArr[sname];
			}
		}
	}
}