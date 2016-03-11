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
		this.dispatchEvent(new Event(UPDATE_DATA));
		return _fed;
	}
}