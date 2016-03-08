package com.luchanso.studentlife.game.actor;

/**
 * https://github.com/Luchanso/student-life
 * @author Loutchansky Oleg
 */
class Student
{
	private var fed : Float;
	private var money : Int;
	private var happy : Float;
	private var education : Float;

	public function new() 
	{		
		fed = 0;
		money = 0;
		happy = 0;
		education = 0;
	}
	
	/**
	 * Обновление состояния студента
	 * @param	days
	 */
	public function update(days : Float) : Void
	{
		
	}
	
}