package com.luchanso.studentlife.game.ui.statsview;

import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */
class ProgressBarLabel extends TextField
{
	private static var fontSize : Int = 14;

	public function new(text : String = "")
	{
		super();

		this.defaultTextFormat = new TextFormat(Config.font, fontSize, Config.colorMainUi);
		this.text = text;
		this.selectable = false;
		this.mouseEnabled = false;
		this.autoSize = TextFieldAutoSize.LEFT;
	}
}