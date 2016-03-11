package com.luchanso.studentlife.game.ui;

import openfl.Lib;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.events.TimerEvent;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.utils.Timer;

/**
 * ...
 * @author Loutchansky Oleg
 */
class MCPS extends TextField
{
	var clicks : Int;
	var timer : Timer;

	public function new(x : Float = 10, y : Float = 10, color : Int = 0x000000)
	{
		super();

		this.x = x;
		this.y = y;

		selectable = false;
		mouseEnabled = false;
		autoSize = TextFieldAutoSize.LEFT;
		defaultTextFormat = new TextFormat("_sans", 12, color);
		text = "Mouse Click Per Second: 0";

		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}

	private function addedToStage(e:Event):Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, addedToStage);

		addTimer();

		Lib.current.addEventListener(MouseEvent.CLICK, mouseClick);
	}

	private function addTimer():Void
	{
		timer = new Timer(1000);

		timer.start();
		timer.addEventListener(TimerEvent.TIMER, tick);
	}

	private function tick(e:TimerEvent):Void
	{
		this.text = "Mouse Click Per Second: " + clicks;
		clicks = 0;
	}

	private function mouseClick(e:MouseEvent):Void
	{
		clicks++;
	}
}