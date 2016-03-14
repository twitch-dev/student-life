package com.luchanso.studentlife.game.ui;

import motion.Actuate;
import motion.easing.Linear;
import openfl.display.Sprite;

/**
 * ...
 * @author Loutchansky Oleg
 */
class ProgressEducationTarget extends Sprite
{
	public static var lineWidth : Float = 2;
	public static var tWidth : Float = 10;
	public static var tHeight : Float = 25;

	private static var animationTime : Float = 0.345;
	private static var animationPositionY : Float = 20;
	private static var animationMoveTime : Float = 1;

	public function new(x : Float = 0, y : Float = 0)
	{
		super();

		this.x = x;
		this.y = y;

		draw();
		addAnimation();
	}

	public function moveToX(x : Float)
	{
		Actuate.tween(this, animationMoveTime, { x : x } );
	}

	private function draw() : Void
	{
		graphics.lineStyle(lineWidth, Config.colorMainUi);

		graphics.moveTo(0, 0);
		graphics.lineTo(tWidth, 0);
		graphics.lineTo(tWidth / 2, tHeight);
		graphics.lineTo(0, 0);
	}

	private function addAnimation() : Void
	{
		Actuate.tween(this, animationTime, { y : y - animationPositionY } ).ease(Linear.easeNone).repeat().reflect();
	}

	public function animationPlay(time : Float)
	{
		Actuate.stop(this);

		animationTime = time;

		addAnimation();
	}
}