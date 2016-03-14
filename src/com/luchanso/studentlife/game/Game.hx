package com.luchanso.studentlife.game;

import com.luchanso.studentlife.Config;
import com.luchanso.studentlife.game.actor.Student;
import com.luchanso.studentlife.game.effects.PlusOne;
import com.luchanso.studentlife.game.ui.Button;
import com.luchanso.studentlife.game.ui.progresseducation.ProgressEducation;
import com.luchanso.studentlife.game.ui.statsview.StatsView;
import flash.events.Event;
import haxe.Serializer;
import haxe.Unserializer;
import motion.Actuate;
import openfl.Assets;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.events.TimerEvent;
import openfl.geom.ColorTransform;
import openfl.net.SharedObject;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.utils.Timer;
import pgr.dconsole.DC;

/**
 * https://github.com/Luchanso/student-life
 * @author Loutchansky Oleg
 */
class Game extends Sprite
{
	var tHelloWorld : TextField;

	var iterationCount : Int;
	var gameTimer : Timer;

	var bSchool : Button;
	var bHeadset : Button;
	var bPurse : Button;
	var bRestaurant : Button;
	var student : Student;

	var statsView : StatsView;
	var progressEducation : ProgressEducation;

	public function new()
	{
		super();

		loadUserData();

		consoleInit();

		addHelloWorld();
		addButtons();
		addStatsView();
		addProgressEducation();

		addTimerEvent();

		studentUpdateData();
	}

	private function addTimerEvent() : Void
	{
		var timerDelay = 1000;

		gameTimer = new Timer(timerDelay);
		gameTimer.addEventListener(TimerEvent.TIMER, update);
		gameTimer.start();
	}

	private function update(e:TimerEvent) : Void
	{
		student.maxFed = 50 + student.education / student.maxEducation * 100000;
		student.maxHappy = 10 + student.education / student.maxEducation * 10000 * Math.exp(1);
		student.happy -= 0.5;
		student.fed -= 0.5;
	}

	private function addProgressEducation() : Void
	{
		var margin = 25;
		var x = margin;
		var y = Config.height / 2 - ProgressEducation.progressHeight / 2;
		var pWidth = Config.width - margin * 2;

		progressEducation = new ProgressEducation(x, y, pWidth);

		addChild(progressEducation);
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
		var soStudent = SharedObject.getLocal("student").data;

		if (soStudent.data == null)
		{
			student = new Student();
		}
		else
		{
			var unserializer = new Unserializer(soStudent.data);
			student = unserializer.unserialize();
		}

		DC.registerObject(student, "student");

		student.addEventListener(Student.UPDATE_DATA, studentUpdateData);
	}

	private function studentUpdateData(e : Event = null) : Void
	{
		iterationCount++;
		if (iterationCount > 50) {
			saveUserData();
			iterationCount = 0;
		}

		statsView.lMoney.money = student.money;
		progressEducation.setEducationScore(student.education);
		progressEducation.setProgress(student.education / student.maxEducation);

		statsView.progressFed.setProgress(student.fed / student.maxFed);
		statsView.progressHappy.setProgress(student.happy / student.maxHappy);
	}

	private function saveUserData() : Void
	{
		var storage = SharedObject.getLocal("student");

		var serializer = new Serializer();
		serializer.serialize(student);

		storage.setProperty("data", serializer.toString());
	}

	private function addHelloWorld() : Void
	{
		tHelloWorld = new TextField();
		tHelloWorld.defaultTextFormat = new TextFormat(Config.font, 50, 0xFFFFFF);
		tHelloWorld.text = "Hello twitch";
		tHelloWorld.selectable = false;
		tHelloWorld.autoSize = TextFieldAutoSize.LEFT;
		tHelloWorld.x = 50;
		tHelloWorld.y = 50;

		addChild(tHelloWorld);
	}

	private function addButtons() : Void
	{
		var buttonSize = 72;
		var margin = 100;
		var buttonCount = 4;
		var startX = Lib.application.window.width / 2 - (buttonCount * margin) / 2;
		var startY = Lib.application.window.height - margin * 1.5;

		var arrayButtons = new Array<Button>();

		bSchool = new Button(new Bitmap(Assets.getBitmapData("img/school.png")), Config.colorMainUi, Config.colorHoverMainUi);
		bSchool.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
			student.education++;
			makeEffectPlusOne(e.stageX, e.stageY, "+1 к знаниям");
		});

		bHeadset = new Button(new Bitmap(Assets.getBitmapData("img/headset.png")), Config.colorMainUi, Config.colorHoverMainUi);
		bHeadset.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
			student.happy++;
			makeEffectPlusOne(e.stageX, e.stageY, "+1 к счастью");
		});

		bPurse = new Button(new Bitmap(Assets.getBitmapData("img/purse.png")), Config.colorMainUi, Config.colorHoverMainUi);
		bPurse.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
			student.money++;
			makeEffectPlusOne(e.stageX, e.stageY, "+1 к деньгам");
		});

		bRestaurant = new Button(new Bitmap(Assets.getBitmapData("img/restaurant.png")), Config.colorMainUi, Config.colorHoverMainUi);
		bRestaurant.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
			student.fed++;
			makeEffectPlusOne(e.stageX, e.stageY, "+1 к сытности");
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

	private function addStatsView() : Void
	{
		statsView = new StatsView();

		addChild(statsView);
	}

	private function makeEffectPlusOne(x : Float, y : Float, text : String) {
		addChild(PlusOne.generate(x + (-10 + Math.random() * 20), y + (-10 + Math.random() * 20), Config.colorEffect, text));
	}
}