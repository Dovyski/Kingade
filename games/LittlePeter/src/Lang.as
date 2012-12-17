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
			gameTitle			:"Pedrinho e a Água!", 
			menuPlay			:"Iniciar!",
			menuCredits			:"Créditos",
			menuBack			:"Voltar",
			creditsList			:"Pedrinho e a Água!\n\nProjeto 'Educação Ambiental e produção de material multimídia com caráter pedagógico e educativo'\n\nEdital 09/PROEC/UFFS/2011\nUniversidade Federal da Fronteira Sul (UFFS)\nwww.uffs.edu.br\n\n\nCoordenador\nProf. Fernando Bevilacqua\n\n\nEquipe UFFS\nProf. Fernando Bevilacqua\nProfa. Adriana Salete Loss\nProf. Rafael Piccin Torchelsen\nProfa. Aurelia Lopes Gomes\nSimone de Melo (Pedagogia)\nMichel Soares Tartas (Ciência da Computação)\nPatric Venturini (Ciência da Computação)\nPatrick Bastiani (Ciência da Computação)\n\n\nEquipe Escola E. B. Pedro Maciel\nClarisse Pressi (Diretora)\n Angela Deliberali Smaniotto (professora 5º ano)\n\n\nDesenhos\nAlunos do 5º ano, E.E.B. Pedro Maciel\n\n\nMúsica\nThiago Gobet Spada, trilhasonora.com\n\n\nEfeitos sonoros\nflashkit.com/soundfx/\n\n\nAgradecimento especial\nEquipe e alunos da escola E. B. Pedro Maciel\nThiago Gobet Spada\nRich \"Photonstorm\" Davey\nAdam \"Atomic\" Saltsman\n\n\nFinanciamento\nPró-reitoria de Extensão, UFFS",
			youWin				:"Você venceu!",
			dropSpeach1			:"Olá!\nSou o Pedrinho e estou aqui para falar da água. Aperte qualquer tecla para continuar!",
			dropSpeach2			:"A água é um dos bens mais importantes que temos. Precisamos cuidar e economizar, se não ela pode acabar!",
			dropSpeach3			:"Quando tomar banho, feche a o chuveiro enquanto se ensaboa. Imagine quanta água você pode economizar.",
			dropSpeach4			:"Lave sua bicicleta ou seu carro usando um balde. É muito mais econômico do que usar a manga.",
			dropSpeach5			:"Feche a torneira enquanto escova os dentes. Não gaste água potável!",
			dropSpeach6			:"Agora me ajude a proteger e economizar água coletando todos os pingos que estão perdidos. Boa sorte!"
		};
		
		// Brazilian portuguese strings
		public static var en :Object = {
			gameTitle			:"Little Peter and the Water!", 
			menuPlay			:"Play!",
			menuCredits			:"Credits",
			menuBack			:"Back",
			creditsList			:"Little Peter and the Water!\n\nProject 'Sustainability education for kids using games'\n\nEdict 09/PROEC/UFFS/2011\nFederal Univerity of Fronteira Sul (UFFS)\nwww.uffs.edu.br\n\n\nProject Leader\nProf. Fernando Bevilacqua\n\n\nUFFS Team\nProf. Fernando Bevilacqua\nProfa. Adriana Salete Loss\nProf. Rafael Piccin Torchelsen\nProfa. Aurelia Lopes Gomes\nSimone de Melo (Pedagogia)\nMichel Soares Tartas (Ciência da Computação)\nPatric Venturini (Ciência da Computação)\nPatrick Bastiani (Ciência da Computação)\n\n\nE.B. Pedro Maciel School Team\nClarisse Pressi (Principal)\n Angela Deliberali Smaniotto (5th grade teacher)\n\n\nArt\nKids from 5th grade, E.B. Pedro Maciel School\n\n\nMusic\nThiago Gobet Spada, trilhasonora.com\n\n\nSound effects\nflashkit.com/soundfx/\n\n\nSpecial thanks\nPedro Maciel School team and kids\nThiago Gobet Spada\nRich \"Photonstorm\" Davey\nAdam \"Atomic\" Saltsman\n\n\nFunding\nPró-reitoria de Extensão, UFFS",
			youWin				:"You win!",
			dropSpeach1			:"Hi!\nI am Little Peter. I'm here to talk about the water. Press any key to continue!",
			dropSpeach2			:"The water is the most important asset we have. We need to protect and save it, otherwise it will end!",
			dropSpeach3			:"When you take a shower, stop the water flow. Imagine how many water you will save doing that.",
			dropSpeach4			:"Use just the water you need to wash your bicycle or car. Don't waste a single drop.",
			dropSpeach5			:"Close the tap while you brush your teeth. Don't waste drinkable water!",
			dropSpeach6			:"Now help me protect and save the water by collecting all missing water drops. Good luck!"
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