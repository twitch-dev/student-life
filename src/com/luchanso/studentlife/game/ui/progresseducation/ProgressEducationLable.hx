package com.luchanso.studentlife.game.ui.progresseducation;

import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */
class ProgressEducationLable extends TextField
{
	private static var fontSize : Int = 19;

	private var bindedX : Float;

	public function new(x : Float, y : Float)
	{
		super();

		this.defaultTextFormat = new TextFormat(Config.font, fontSize, Config.colorMainUi);
		this.text = "Знания: 0";
		this.autoSize = TextFieldAutoSize.LEFT;
		this.selectable = false;
		this.mouseEnabled = false;
		this.x = x;
		this.y = y;
	}

	public function setValue(education : Float) : Void
	{
		this.text = "Знания: " + education;
		reCalcPosition();
	}

	private function reCalcPosition() : Void
	{
		this.x = bindedX - this.width;
	}

	public function bindX(x : Float)
	{
		bindedX = x;
		reCalcPosition();
	}

}