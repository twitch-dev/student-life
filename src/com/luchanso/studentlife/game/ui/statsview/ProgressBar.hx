package com.luchanso.studentlife.game.ui.statsview;

import motion.Actuate;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Loutchansky Oleg
 */
class ProgressBar extends Sprite
{
	private static var maxWidth : Float = 300;
	private static var maxHeight : Float = 12.5;
	public var progress(get, set) : Float;

	private var lable : ProgressBarLabel;
	private var _progress : Float;

	public function new(x : Float = 0.0, y : Float = 0.0, text : String = "")
	{
		super();

		this.x = x;
		this.y = y;

		addLable(text);

		progress = 0.0;
	}

	public function setProgress(value : Float)
	{
		Actuate.tween(this, 0.5, { progress: value } );
	}

	function addLable(text)
	{
		lable = new ProgressBarLabel(text);
		lable.y -= 4.5;

		addChild(lable);
	}

	private function draw()
	{
		var tempWidth = getRealWidth();

		graphics.clear();
		graphics.beginFill(Config.colorMainUi);
		graphics.drawRect(-tempWidth, 0, tempWidth, maxHeight);
		graphics.endFill();
	}

	private function get_progress() : Float
	{
		return _progress;
	}

	private function set_progress(value : Float) : Float
	{
		if (value > 1.0) {
			value = 1.0;
		} else if (value < 0.0) {
			value = 0;
		}

		_progress = value;

		draw();
		changeLablePosition();

		return _progress;
	}

	private function getRealWidth() : Float
	{
		return maxWidth * progress;
	}

	private function changeLablePosition() : Void
	{
		lable.x = -1 * (getRealWidth() + lable.width + 5);
	}
}