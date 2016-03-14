package com.luchanso.studentlife.game.ui.statsview;

import motion.Actuate;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import pgr.dconsole.DC;

/**
 * ...
 * @author Loutchansky Oleg
 */
class StatsView extends Sprite
{
	private static var margin = 25;
	private static var paddingTop = 35;

	public var lMoney : Money;

	public var progressHappy : ProgressBar;
	public var progressFed : ProgressBar;

	public function new()
	{
		super();

		var tempX = Lib.application.window.width - margin;
		var tempY = margin;

		Lib.current.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);

		addMoneyLable(tempX, tempY);
		addProgressBars(tempX, tempY + paddingTop);
	}

	private function keyDown(e:KeyboardEvent):Void
	{
		if (e.keyCode == Keyboard.SPACE)
		{
			Actuate.tween(progressHappy, 3, { progress: Math.random() } );
			Actuate.tween(progressFed, 3, { progress: Math.random() } );
		}
	}

	private function addMoneyLable(x : Float, y : Float) : Void
	{
		lMoney = new Money(x, y, Config.colorMainUi);
		addChild(lMoney);
	}

	private function addProgressBars(x : Float, y : Float) : Void
	{
		progressHappy = new ProgressBar(x, y, "Счастье");
		Actuate.tween(progressHappy, 3, { progress: Math.random() } );

		progressFed = new ProgressBar(x, y + paddingTop, "Сытность");
		Actuate.tween(progressFed, 3, { progress: Math.random() } );

		addChild(progressHappy);
		addChild(progressFed);
	}
}