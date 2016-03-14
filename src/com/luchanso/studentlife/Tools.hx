package com.luchanso.studentlife;
import openfl.net.SharedObject;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Tools
{
	public static function clearSave() : Void
	{
		var storage = SharedObject.getLocal("student");
		storage.clear();
	}
}