package com.luchanso.studentlife.game.ui.progresseducation;

import com.luchanso.studentlife.game.ui.progresseducation.ProgressEducationTarget;
import flash.display.Sprite;
import motion.Actuate;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import pgr.dconsole.DC;

/**
 * ...
 * @author Loutchansky Oleg
 */
class ProgressEducation extends Sprite
{
	public static var progressHeight : Float = 3;

	private var progressWidth : Float;
	private var target : ProgressEducationTarget;
	private var lable : ProgressEducationLable;

	private static var countRanges : Int = 100;
	private static var minimalRanges : Int = 10;
	private static var rangeHeight : Float = 15;
	private static var rangeMinimalHeight : Float = 10;
	private static var rangeMinimalLineWidth : Float = 2;

	public function new(x : Float = 0, y : Float = 0 , width : Float)
	{
		super();

		this.progressWidth = width;
		this.x = x;
		this.y = y;

		draw();
		addTarget();
		addLable();
	}

	private function addLable() : Void
	{
		lable = new ProgressEducationLable(this.progressWidth, 0);
		lable.bindX(this.progressWidth);
		addChild(lable);
	}

	public function setEducationScore(score : Float)
	{
		this.lable.setValue(score);
	}

	public function setProgress(progress : Float)
	{
		if (progress > 1.0)
		{
			progress = 1.0;
		}
		else if (progress < 0.0)
		{
			progress = 0.0;
		}

		var calcPosition = progressWidth * progress - ProgressEducationTarget.tWidth / 2;

		target.moveToX(calcPosition);
	}

	private function addTarget() : Void
	{
		var padding = 15;

		var petX = -ProgressEducationTarget.tWidth / 2;
		var petY = -ProgressEducationTarget.tHeight - padding;

		target = new ProgressEducationTarget(petX, petY);

		addChild(target);
	}

	private function draw() : Void
	{
		drawProgress();
		addRanges();
	}

	private function drawProgress() : Void
	{
		graphics.lineStyle(progressHeight, Config.colorMainUi);
		graphics.moveTo(0, 0);
		graphics.lineTo(progressWidth, 0);
	}

	private function addRanges() : Void
	{
		var padding = progressWidth / countRanges;

		for (i in 0...(countRanges + 1))
		{
			if (i % minimalRanges == 0)
			{
				graphics.lineStyle(progressHeight, Config.colorMainUi);
				graphics.moveTo(i * padding, 0);
				graphics.lineTo(i * padding, -rangeHeight);
			}
			else
			{
				graphics.lineStyle(rangeMinimalLineWidth, Config.colorMainUi);
				graphics.moveTo(i * padding, 0);
				graphics.lineTo(i * padding, -rangeMinimalHeight);
			}
		}
	}
}