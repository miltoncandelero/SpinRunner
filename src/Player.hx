package;

import openfl.display.Sprite;

/**
 * ...
 * @author Killabunnies
 */
class Player extends Sprite
{
	public var speed:Float = 0;
	public var maxSpeed:Float = 1 / 16;
	public var gravity:Float = 1 / 5000;
	public var jumpSpeed:Float = -1 / 16;
	
	public var isOnFloor:Bool = false;
	

	public function new() 
	{
		super();
		graphics.beginFill(Game.COLOR_3);
		graphics.drawRect(-3, 0, 6, 6);
		graphics.beginFill(Game.COLOR_2);
		graphics.drawRect(-2, 1, 4, 2);
		graphics.beginFill(Game.COLOR_1);
		graphics.drawRect(-2, 3, 4, 2);
		graphics.beginFill(Game.COLOR_0);
		graphics.drawRect(-1, 2, 2, 2);
		
		graphics.drawRect(-3, 0, 1, 1);
		graphics.drawRect(2, 0, 1, 1);
		graphics.drawRect(-3, 5, 1, 1);
		graphics.drawRect(2, 5, 1, 1);
		
		graphics.endFill();
	}
	
	//no subpixels.
	override function set_x(value:Float):Float 
	{
		value = Math.round(value);
		return super.set_x(value);
	}
	
	override function set_y(value:Float):Float 
	{
		value = Math.round(value);
		return super.set_y(value);
	}
	
}