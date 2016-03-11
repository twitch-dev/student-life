package com.luchanso.studentlife.game.ui.statsview;

import openfl.Lib;
import openfl.display.Sprite;

/**
 * ...
 * @author Loutchansky Oleg
 */
class StatsView extends Sprite
{
	public var lMoney : Money;

	public function new()
	{
		super();

		var margin = 25;

		lMoney = new Money(Lib.application.window.width - margin, margin, Config.colorMainUi);

		addChild(lMoney);
	}

}