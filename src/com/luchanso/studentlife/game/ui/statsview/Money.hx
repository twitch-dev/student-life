package com.luchanso.studentlife.game.ui.statsview;

import flash.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Money extends TextField
{
	private var _money : Float;
	public var money(get, set) : Float;

	public function new(x : Float, y : Float, color : Int)
	{
		super();

		this.defaultTextFormat = new TextFormat(Config.font, 20, color);
		this.autoSize = TextFieldAutoSize.RIGHT;
		this.x = x;
		this.y = y;
		this.text = "0 Руб.";
		this.selectable = false;
		this.mouseEnabled = false;
	}

	function get_money() : Float
	{
		return _money;
	}

	function set_money(value : Float) : Float
	{
		_money = value;

		this.text = _money + " Руб.";

		return _money;
	}
}