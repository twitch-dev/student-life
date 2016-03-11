package com.luchanso.studentlife.game;

import com.luchanso.studentlife.Config;
import com.luchanso.studentlife.game.actor.Student;
import com.luchanso.studentlife.game.ui.Button;
import motion.Actuate;
import openfl.Assets;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.geom.ColorTransform;
import openfl.net.SharedObject;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import pgr.dconsole.DC;

/**
 * https://github.com/Luchanso/student-life
 * @author Loutchansky Oleg
 */
class Game extends Sprite
{
	var tHelloWorld : TextField;

	// remove to button manager class
	var bSchool : Button;
	var bHeadset : Button;
	var bPurse : Button;
	var bRestaurant : Button;
	var student : Student;

	public function new()
	{
		super();
		
		loadUserData();
		saveUserData();
		
		consoleInit();

		addHelloWorld();
		addButtons();
	}

	private function consoleInit() : Void
	{
		DC.registerObject(student, "student");
		DC.monitorField(student, "fed", "fed");
		DC.monitorField(student, "money", "money");
		DC.monitorField(student, "happy", "happy");
		DC.monitorField(student, "education", "education");
	}

	private function loadUserData() : Void
	{
		student = new Student();
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
		bSchool.addEventListener(MouseEvent.CLICK, function(_) {
			student.education++;
		});

		bHeadset = new Button(new Bitmap(Assets.getBitmapData("img/headset.png")), Config.colorMainUi, Config.colorHoverMainUi);
		bHeadset.addEventListener(MouseEvent.CLICK, function(_) {
			student.happy++;
		});

		bPurse = new Button(new Bitmap(Assets.getBitmapData("img/purse.png")), Config.colorMainUi, Config.colorHoverMainUi);
		bPurse.addEventListener(MouseEvent.CLICK, function(_) {
			student.money++;
		});

		bRestaurant = new Button(new Bitmap(Assets.getBitmapData("img/restaurant.png")), Config.colorMainUi, Config.colorHoverMainUi);
		bRestaurant.addEventListener(MouseEvent.CLICK, function(_) {
			student.fed++;
		});

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