package com.luchanso.studentlife.game;

import com.luchanso.studentlife.Config;
import com.luchanso.studentlife.game.ui.Button;
import motion.Actuate;
import openfl.Assets;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.geom.ColorTransform;
import openfl.net.SharedObject;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * https://github.com/Luchanso/student-life
 * @author Loutchansky Oleg
 */
class Game extends Sprite
{
	var tHelloWorld : TextField;

	var bSchool : Button;
	var bHeadset : Button;
	var bPurse : Button;
	var bRestaurant : Button;

	public function new()
	{
		super();
		
		loadUserData();
		saveUserData();
		
		addHelloWorld();
		addButtons();
	}

	private function loadUserData() : Void
	{
	}

	private function saveUserData() : Void
	{
	}

	private function addHelloWorld() : Void
	{
		tHelloWorld = new TextField();
		tHelloWorld.defaultTextFormat = new TextFormat("Arial", 50, 0xFFFFFF);
		tHelloWorld.text = "Hello twitch";
		tHelloWorld.selectable = false;
		tHelloWorld.autoSize = TextFieldAutoSize.LEFT;
		tHelloWorld.x = 50;
		tHelloWorld.y = 50;

		addChild(tHelloWorld);
	}

	private function addButtons()
	{
		var buttonSize = 72;
		var margin = 100;
		var buttonCount = 4;
		var startX = Lib.application.window.width / 2 - (buttonCount * margin) / 2;
		var startY = Lib.application.window.height - margin * 1.5;

		var arrayButtons = new Array<Button>();

		bSchool = new Button(new Bitmap(Assets.getBitmapData("img/school.png")), Config.colorMainUi, Config.colorHoverMainUi);
		bHeadset = new Button(new Bitmap(Assets.getBitmapData("img/headset.png")), Config.colorMainUi, Config.colorHoverMainUi);
		bPurse = new Button(new Bitmap(Assets.getBitmapData("img/purse.png")), Config.colorMainUi, Config.colorHoverMainUi);
		bRestaurant = new Button(new Bitmap(Assets.getBitmapData("img/restaurant.png")), Config.colorMainUi, Config.colorHoverMainUi);

		arrayButtons.push(bSchool);
		arrayButtons.push(bHeadset);
		arrayButtons.push(bPurse);
		arrayButtons.push(bRestaurant);

		var i = 0;
		for (button in arrayButtons)
		{
			button.buttonMode = true;
			button.x = startX + i * (margin);
			button.y = startY;

			addChild(button);

			i++;
		}
	}
}