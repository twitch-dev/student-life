package com.luchanso.studentlife.game.effects;

import flash.text.TextField;
import flash.text.TextFormatAlign;
import motion.Actuate;
import openfl.display.Sprite;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */
class PlusOne extends TextField
{
	private static var animationTimeFadeIn = 0.3;
	private static var animationTimeFadeOut = 1.5;
	private static var animationTimePosition = animationTimeFadeIn + animationTimeFadeOut;
	private static var size = 20;

	public static function generate(x : Float, y : Float, color : Int, text : String) : PlusOne
	{
		var plus = new PlusOne(x, y);
		plus.defaultTextFormat = new TextFormat(Config.font, 25, color);
		plus.text = text;
		plus.autoSize = TextFieldAutoSize.CENTER;
		plus.x = x - plus.width / 2;
		plus.y = y - plus.height / 2;
		plus.selectable = false;
		plus.mouseEnabled = false;

		return plus;
	}

	private function new(x : Float, y : Float)
	{
		super();

		this.x = x;
		this.y = y;
		this.alpha = 0;

		Actuate.tween(this, animationTimePosition, { y: y - (100 + Math.random() * 150) } );
		Actuate.tween(this, animationTimeFadeIn, { alpha: 1 } ).onComplete(fadeOut);
	}

	private function fadeOut() : Void
	{
		Actuate.tween(this, animationTimeFadeOut, { alpha: 0 } ).onComplete(function ()
		{
			this.parent.removeChild(this);
		});
	}
}