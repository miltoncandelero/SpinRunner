package;

import openfl.display.Sprite;

/**
 * ...
 * @author Killabunnies
 */
class Player extends Sprite
{

	public function new() 
	{
		super();
		graphics.beginFill(Game.COLOR_3);
		graphics.drawRect(0, 0, 6, 6);
		graphics.endFill();
	}
	
}