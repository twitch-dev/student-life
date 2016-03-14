package com.luchanso.studentlife.game.actor;
import openfl.events.Event;
import openfl.events.EventDispatcher;

/**
 * https://github.com/Luchanso/student-life
 * @author Loutchansky Oleg
 */
class Student extends EventDispatcher
{
	private var _fed : Float;
	private var _money : Float;
	private var _happy : Float;
	private var _education : Float;

	private var _maxFed : Float;
	private var _maxHappy : Float;

	public var maxEducation(get, null) : Float;
	public var maxFed(get, set) : Float;
	public var maxHappy(get, set) : Float;

	public var fed(get, set) : Float;
	public var money(get, set) : Float;
	public var happy(get, set) : Float;
	public var education(get, set) : Float;

	public static var UPDATE_DATA = "updateData";

	public function new()
	{
		super();

		fed = 0;
		money = 0;
		happy = 0;
		education = 0;

		maxFed = 1;
		maxHappy = 1;
	}

	function get_education():Float
	{
		return _education;
	}

	function set_education(value:Float):Float
	{
		_education = value;
		this.dispatchEvent(new Event(UPDATE_DATA));
		return _education;
	}

	function get_happy():Float
	{
		return _happy;
	}

	function set_happy(value:Float):Float
	{
		_happy = value;

		if (_happy < 0)
		{
			_happy = 0;
		}
		else if (_happy > _maxHappy)
		{
			_happy = _maxHappy;
		}

		this.dispatchEvent(new Event(UPDATE_DATA));
		return _happy;
	}

	function get_money():Float
	{
		return _money;
	}

	function set_money(value:Float):Float
	{
		_money = value;
		this.dispatchEvent(new Event(UPDATE_DATA));
		return _money;
	}

	function get_fed():Float
	{
		return _fed;
	}

	function set_fed(value:Float):Float
	{
		_fed = value;
		if (_fed < 0)
		{
			_fed = 0;
		}
		else if (_fed > _maxFed)
		{
			_fed = _maxFed;
		}

		this.dispatchEvent(new Event(UPDATE_DATA));
		return _fed;
	}

	function get_maxEducation():Float
	{
		return Config.maxEducationScore;
	}

	function get_maxFed():Float
	{
		return _maxFed;
	}

	function set_maxFed(value:Float):Float
	{
		return _maxFed = value;
	}

	function get_maxHappy():Float
	{
		return _maxHappy;
	}

	function set_maxHappy(value:Float):Float
	{
		return _maxHappy = value;
	}
}