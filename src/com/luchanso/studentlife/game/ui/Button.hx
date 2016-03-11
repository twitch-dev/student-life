package com.luchanso.studentlife.game.ui;

import motion.Actuate;
import motion.actuators.GenericActuator;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.geom.ColorTransform;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Button extends Sprite
{
	private var image : Bitmap;
	private var color : Int;
	private var hoverColor : Int;
	private var animationResizeIsActive : Bool;

	private static var animationHoverTime : Float = 1;
	private static var animationSizeTime : Float = 0.1;
	private static var resizePercent : Float = 0.75;

	public function new(image : Bitmap, color : Int, hoverColor : Int)
	{
		super();

		this.image = image;
		this.color = color;
		this.hoverColor = hoverColor;

		Actuate.transform(this, 0).color(color, 1);

		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}

	private function addedToStage(e:Event):Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, addedToStage);

		addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
		addEventListener(MouseEvent.CLICK, mouseClick);

		this.addChild(image);
	}

	private function mouseClick(e:MouseEvent):Void
	{
		if (!animationResizeIsActive) {
			animationResizeIsActive = true;

			Actuate.tween(this, animationSizeTime, {
				width: width * resizePercent,
				height: height * resizePercent,
				x: x + (width * (1 - resizePercent)) / 2,
				y: y + (height * (1 - resizePercent)) / 2
			}).reverse().onComplete(function() {
				animationResizeIsActive = false;
			});
		}
	}

	private function mouseOut(e:MouseEvent):Void
	{
		Actuate.transform(this, animationHoverTime).color(color, 1);
	}

	private function mouseOver(e:MouseEvent):Void
	{
		Actuate.transform(this, animationHoverTime).color(hoverColor, 1);
	}
}