package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;

/**
 * ...
 * @author Killabunnies
 */
class Main extends Sprite 
{
	var g:Game;
	
	
	public function new() 
	{
		super();
		
		g = new Game();
		g.y = 550;
		g.scaleX = g.scaleY = 4;
		addChild(g);
		
		addEventListener(Event.ENTER_FRAME, update);
		
		currentTime = previousTime = Lib.getTimer();
	}
	
	var currentTime:Int;
	public static var dt:Int;
	var previousTime:Int;
	
	/* UPDATE aqui viene lo bueno señores. */
	private function update(e:Event = null):Void{
		currentTime = Lib.getTimer ();
		dt = (currentTime - previousTime);
		previousTime = currentTime;
		
		g.update(dt);
	}

}
