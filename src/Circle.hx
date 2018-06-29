package;
import openfl.Vector;
import openfl.display.Sprite;

/**
 * ...
 * @author Killabunnies
 */
class Circle extends Sprite
{

	public function new() 
	{
		super();
		
		graphics.beginFill(Game.COLOR_3);
		graphics.drawCircle(0, 0, Game.RADIUS);
		graphics.endFill();
	}
	
}