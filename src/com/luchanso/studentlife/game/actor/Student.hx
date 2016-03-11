package com.luchanso.studentlife.game.actor;

/**
 * https://github.com/Luchanso/student-life
 * @author Loutchansky Oleg
 */
class Student
{
	private var _fed : Float;
	private var _money : Float;
	private var _happy : Float;
	private var _education : Float;

	public var fed(get, set) : Float;
	public var money(get, set) : Float;
	public var happy(get, set) : Float;
	public var education(get, set) : Float;

	public function new()
	{		
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
		return _education = value;
	}

	function get_happy():Float
	{
		return _happy;
	}

	function set_happy(value:Float):Float
	{
		return _happy = value;
	}

	function get_money():Float
	{
		return _money;
	}

	function set_money(value:Float):Float
	{
		return _money = value;
	}

	function get_fed():Float
	{
		return _fed;
	}

	function set_fed(value:Float):Float
	{
		return _fed = value;
	}
}