package;

import openfl.display.Sprite;

/**
 * ...
 * @author Killabunnies
 */
class Platform extends Sprite
{

	public var distanceToCenter:Int;
	public var platformWidth:Int;
	public var deltaAngle:Float;
	
	private static inline var MINIMUM:Int = 6;
	public function new(w:Int = 10,h:Int = 0) 
	{
		super();
		recycle(w, h);

	}
	
	public function recycle(w:Int,h:Int)
	{
		if (w % 2 == 1) w++; //make it even.
		
		distanceToCenter = Game.RADIUS + h + 2;
		platformWidth = w;
		
		deltaAngle = ((Math.atan((Std.int(platformWidth / 2)+3) / distanceToCenter)) * (180 / Math.PI));
		
		graphics.clear();
		
		graphics.beginFill(Game.COLOR_1);
		graphics.drawRect( -Math.abs(w/2), Game.RADIUS, w, MINIMUM + h);
		
		graphics.beginFill(Game.COLOR_2);
		graphics.drawRect( -Math.abs(w/2), Game.RADIUS + MINIMUM + h, w, 2);
		
		graphics.endFill();
	}
	
}