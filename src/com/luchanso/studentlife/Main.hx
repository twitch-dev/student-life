package com.luchanso.studentlife;

import com.luchanso.studentlife.game.Game;
import com.luchanso.studentlife.game.ui.MCPS;
import com.luchanso.studentlife.game.ui.statsview.ProgressBarLabel;
import com.luchanso.studentlife.menu.Menu;
import motion.Actuate;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;
import pgr.dconsole.DC;

/**
 * https://github.com/Luchanso/student-life
 * @author Loutchansky Oleg
 */
class Main extends Sprite 
{
	var game : Game;
	var menu : Menu;
	var fps : FPS;
	var mcps : MCPS;

	public function new()
	{
		super();

		DC.init();
		DC.registerClass(Actuate, "Actuate");
		DC.registerClass(Tools, "Tools");

		fps = new FPS(10, 10, 0xFFFFFF);
		mcps = new MCPS(10, 25, 0xFFFFFF);

		game = new Game();
		menu = new Menu();
		menu.visible = false;

		addChild(game);
		addChild(menu);
		addChild(fps);
		addChild(mcps);
	}
}
