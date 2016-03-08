package com.luchanso.studentlife;

import com.luchanso.studentlife.game.Game;
import com.luchanso.studentlife.menu.Menu;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Main extends Sprite 
{
	var game : Game;
	var menu : Menu;

	public function new() 
	{
		super();
		
		game = new Game();
		menu = new Menu();
		
		addChild(game);
		addChild(menu);
	}
}
