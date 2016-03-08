package com.luchanso.studentlife.game;

import com.luchanso.studentlife.Config;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Game extends Sprite
{
	var tHelloWorld : TextField;

	public function new() 
	{
		super();
		
		initHelloWorld();
		
		addChild(tHelloWorld);
	}
	
	private function initHelloWorld() : Void
	{
		tHelloWorld = new TextField();		
		tHelloWorld.defaultTextFormat = new TextFormat("Arial", 50, 0xFFFFFF);
		tHelloWorld.text = "Hello twitch";
		tHelloWorld.selectable = false;
		tHelloWorld.autoSize = TextFieldAutoSize.LEFT;
		tHelloWorld.x = 50;
		tHelloWorld.y = 50;
	}
	
}