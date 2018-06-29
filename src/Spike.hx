package;

import openfl.Vector;
import openfl.display.Sprite;

/**
 * ...
 * @author Killabunnies
 */
class Spike extends Sprite
{

	public function new() 
	{
		super();
		graphics.beginFill(Game.COLOR_3);
		//graphics.drawRect( -3, 35, 6, 6);
		var v:Vector<Float> = new Vector(6);
		//v = [ -3, 35, 3, 35, 0, 41];
		v[0] = 3;
		v[1] = Game.RADIUS-1;
		v[2] = -3;
		v[3] = Game.RADIUS-1;
		v[4] = 0;
		v[5] = Game.RADIUS+5;
		graphics.drawTriangles(v);
		
		graphics.beginFill(Game.COLOR_3, 0);
		graphics.drawCircle(0, 0, 45);
		
		graphics.endFill();
	}
	
}