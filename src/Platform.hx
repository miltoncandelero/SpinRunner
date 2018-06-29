package;

import openfl.display.Sprite;

/**
 * ...
 * @author Killabunnies
 */
class Platform extends Sprite
{

	private static inline var MINIMUM:Int = 6;
	public function new(w:Int = 10,h:Int = 0) 
	{
		super();
		
		if (w % 2 == 1) w++; //make it even.
		
		graphics.beginFill(Game.COLOR_1);
		graphics.drawRect( -Math.abs(w/2), Game.RADIUS, w, MINIMUM + h);
		
		graphics.beginFill(Game.COLOR_2);
		graphics.drawRect( -Math.abs(w/2), Game.RADIUS + MINIMUM + h, w, 2);
		
		graphics.endFill();
	}
	
}