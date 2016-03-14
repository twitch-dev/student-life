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

		addMoneyLable(tempX, tempY);
		addProgressBars(tempX, tempY + paddingTop);
	}

	private function addMoneyLable(x : Float, y : Float) : Void
	{
		lMoney = new Money(x, y, Config.colorMainUi);
		addChild(lMoney);
	}

	private function addProgressBars(x : Float, y : Float) : Void
	{
		progressHappy = new ProgressBar(x, y, "Счастье");

		progressFed = new ProgressBar(x, y + paddingTop, "Сытность");

		addChild(progressHappy);
		addChild(progressFed);
	}
}