package;

import openfl.Vector;
import openfl.display.BitmapData;
import openfl.display.PNGEncoderOptions;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.display.Stage;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
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

	var player:Player;

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

		for (j in 0...Math.floor(NUM_SPIKES/3))
		{
			var p = new Platform(20+Math.round(Math.random()*10),Math.round(Math.random() * 50));
			p.x = c.x;
			p.y = c.y;
			p.rotation = j * (360/(NUM_SPIKES/3));// + Math.random() * 20;
			platforms.push(p);
			addChildAt(p,getChildIndex(c));
		}

		player = new Player();
		c.addChild(player);
		player.y = -RADIUS -  50;

		addEventListener(Event.ADDED_TO_STAGE, function (e)
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, pressKey);
		},false,0,true);
	}
	
	function pressKey(e:KeyboardEvent):Void 
	{
		//jump
		trace ("jump!");
		if (player.isOnFloor) 
		{
			player.speed = player.jumpSpeed;
		}
	}

	public function update(dt:Int)
	{

		//player movement
		if (!player.isOnFloor)
		{
			if (player.speed < player.maxSpeed)
			{
				player.y += (player.speed * dt) + (0.5* player.gravity * Math.pow(dt,2));
				player.speed += player.gravity * dt;
				if (player.speed >= player.maxSpeed) player.speed = player.maxSpeed;
			}
			else
			{
				player.y += (player.speed * dt);
			}
		}

		//spin the spikes.
		for (i in 0...NUM_SPIKES)
		{
			spikes[i].rotation = (spikes[i].rotation % 360) - dt * speed;
		}

		//spin and collide platforms
		for (p in platforms)
		{

			p.rotation = (p.rotation) - dt * speed;

			if (p.rotation <= -360)
			{
				p.recycle(20 + Math.round(Math.random() * 10), Math.round(Math.random() * 50));
				p.rotation = p.rotation % 360;
			}

			
			player.isOnFloor = false;
			if (Math.abs(p.rotation%360) < 180 + p.deltaAngle && Math.abs(p.rotation%360) > 180 - p.deltaAngle)
			{
				if (player.speed >= 0) //if going down.
				{
					if (player.y > -p.distanceToCenter - 12  &&  player.y < -p.distanceToCenter)
					{
						player.y = -p.distanceToCenter - 12;

						player.isOnFloor = true;
						player.speed = 0;
					}
				}
			}
		}

	}

}