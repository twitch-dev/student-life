package com.luchanso.studentlife;

import com.luchanso.studentlife.game.Game;
import com.luchanso.studentlife.menu.Menu;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;

/**
 * https://github.com/Luchanso/student-life
 * @author Loutchansky Oleg
 */
class Main extends Sprite 
{
	var game : Game;
	var menu : Menu;
	var fps : FPS;

	public function new() 
	{
		super();
		
		fps = new FPS(10, 10, 0xFFFFFF);
		
		game = new Game();
		menu = new Menu();
		menu.visible = false;
		
		addChild(game);
		addChild(menu);
		addChild(fps);
	}
}
