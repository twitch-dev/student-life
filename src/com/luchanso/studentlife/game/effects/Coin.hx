package com.luchanso.studentlife.game.effects;

import motion.Actuate;
import motion.easing.Linear;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Coin extends Sprite
{
	private static var animationTimeMove : Float = 0.2;
	private static var animationTimeFadeIn : Float = 0.1;
	private static var animationTimeFadeOut : Float = 0.1;

	public static var EDUCATION = 'education';
	public static var FOOD = 'food';
	public static var MONEY = 'money';
	public static var HAPPY = 'happy';

	private var bitmap : Bitmap;

	public static function generate(x : Float, y : Float, targetX : Float, targetY : Float, type : String) : Coin
	{
		var coin = new Coin(x, y, targetX, targetY, type);
		coin.alpha = 0;

		return coin;
	}

	private function new(x : Float, y : Float, targetX : Float, targetY : Float, type : String)
	{
		super();

		var imageName = 'coin-' + type + '.png';

		bitmap = new Bitmap(Assets.getBitmapData('img/' + imageName));

		this.x = x;
		this.y = y;
		this.mouseEnabled = false;

		this.addChild(bitmap);

		Actuate.tween(this, animationTimeMove, { x : targetX, y : targetY } ).ease(Linear.easeNone);
		Actuate.tween(this, animationTimeFadeIn, { alpha: 1 } ).onComplete(fadeOut).ease(Linear.easeNone);
	}

	private function fadeOut() : Void
	{
		Actuate.tween(this, animationTimeFadeOut, { alpha: 0 } )
				.ease(Linear.easeNone)
				.delay(animationTimeMove - (animationTimeFadeIn + animationTimeFadeOut))
				.onComplete(function ()
		{
			this.parent.removeChild(this);
		});
	}

}