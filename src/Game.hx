package;

import openfl.Vector;
import openfl.display.BitmapData;
import openfl.display.PNGEncoderOptions;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.utils.ByteArray;
/**
 * ...
 * @author Killabunnies
 */
class Game extends Sprite 
{
	public static inline var NUM_SPIKES:Int = 48;
	public static inline var RADIUS:Int = 100;
	
	
	public static inline var COLOR_0:Int = 0x9bbc0f;
	public static inline var COLOR_1:Int = 0x8bac0f;
	public static inline var COLOR_2:Int = 0x306230;
	public static inline var COLOR_3:Int = 0x0f380f;
	
	var speed:Float = 0.02;
	
	var c:Circle;
	var s:Spike;
	
	var spikes:Vector<Spike>;
	var platforms:Array<Platform>;
	

	public function new() 
	{
		super();
		c = new Circle();
		c.x = 160 / 2;
		c.y = 144 / 2;
		addChild(c);
		
		spikes = new Vector(NUM_SPIKES);
		
		for (i in 0...NUM_SPIKES) 
		{
			spikes[i] = new Spike();
			spikes[i].x = c.x;
			spikes[i].y = c.y;
			spikes[i].rotation = (360 / NUM_SPIKES) * i;
			addChild(spikes[i]);
		}
		
		platforms = new Array<Platform>();
		
		
		for (j in 0...17) 
		{
			var p = new Platform(20,Math.round(Math.random() * 10));
			p.x = c.x;
			p.y = c.y;
			p.rotation = j * (360/NUM_SPIKES);// + Math.random() * 20;
			p.visible = false;
			platforms.push(p);
			addChildAt(p,getChildIndex(c));		
		}
	}
	
	public function update(dt:Int)
	{
		for (i in 0...NUM_SPIKES) 
		{
			spikes[i].rotation = (spikes[i].rotation % 360) - dt * speed;
		}
		
		for (p in platforms) 
		{
			p.rotation = (p.rotation) - dt * speed;
			p.visible = (p.rotation < 0 && p.rotation > -360);
			if (p.rotation <= -360)
			{
				removeChild(p);
				platforms.remove(p);
				
				var p = new Platform(10,Math.round(Math.random() * 10));
				p.x = c.x;
				p.y = c.y;
				p.rotation = 0;
				addChildAt(p, getChildIndex(c));
				platforms.push(p);
			}
		}
	}
}