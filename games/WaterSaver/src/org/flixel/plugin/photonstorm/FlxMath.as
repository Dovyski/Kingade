/**
 * FlxMath
 * -- Part of the Flixel Power Tools set
 * 
 * v1.6 Added wrapAngle, angleLimit and more documentation
 * v1.5 Added pointInCoordinates, pointInFlxRect and pointInRectangle
 * v1.4 Updated for the Flixel 2.5 Plugin system
 * 
 * @version 1.6 - June 12th 2011
 * @link http://www.photonstorm.com
 * @author Richard Davey / Photon Storm
*/

package org.flixel.plugin.photonstorm 
{
	import flash.geom.Rectangle;
	import org.flixel.FlxRect;
	
	/**
	 * Adds a set of fast Math functions and extends a few commonly used ones
	 */
	public class FlxMath
	{
		public static var getrandmax:int = int.MAX_VALUE;
		private static var mr:uint = 0;
		private static var cosTable:Array = new Array;
		private static var sinTable:Array = new Array;
		
		private static var coefficient1:Number = Math.PI / 4;
		private static const RADTODEG:Number = 180 / Math.PI;
		private static const DEGTORAD:Number = Math.PI / 180;
		
		public function FlxMath() 
		{
		}
		
		/**
		 * Returns true if the given x/y coordinate is within the given rectangular block
		 * 
		 * @param	pointX		The X value to test
		 * @param	pointY		The Y value to test
		 * @param	rectX		The X value of the region to test within
		 * @param	rectY		The Y value of the region to test within
		 * @param	rectWidth	The width of the region to test within
		 * @param	rectHeight	The height of the region to test within
		 * 
		 * @return	true if pointX/pointY is within the region, otherwise false
		 */
		public static function pointInCoordinates(pointX:int, pointY:int, rectX:int, rectY:int, rectWidth:int, rectHeight:int):Boolean
		{
			if (pointX >= rectX && pointX <= (rectX + rectWidth))
			{
				if (pointY >= rectY && pointY <= (rectY + rectHeight))
				{
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * Returns true if the given x/y coordinate is within the given rectangular block
		 * 
		 * @param	pointX		The X value to test
		 * @param	pointY		The Y value to test
		 * @param	rect		The FlxRect to test within
		 * @return	true if pointX/pointY is within the FlxRect, otherwise false
		 */
		public static function pointInFlxRect(pointX:int, pointY:int, rect:FlxRect):Boolean
		{
			if (pointX >= rect.x && pointX <= rect.right && pointY >= rect.y && pointY <= rect.bottom)
			{
				return true;
			}
			
			return false;
		}
		
		/**
		 * Returns true if the given x/y coordinate is within the Rectangle
		 * 
		 * @param	pointX		The X value to test
		 * @param	pointY		The Y value to test
		 * @param	rect		The Rectangle to test within
		 * @return	true if pointX/pointY is within the Rectangle, otherwise false
		 */
		public static function pointInRectangle(pointX:int, pointY:int, rect:Rectangle):Boolean
		{
			if (pointX >= rect.x && pointX <= rect.right && pointY >= rect.y && pointY <= rect.bottom)
			{
				return true;
			}
			
			return false;
		}
		
		/**
		 * A faster (but much less accurate) version of Math.atan2(). For close range / loose comparisons this works very well, 
		 * but avoid for long-distance or high accuracy simulations.
		 * Based on: http://blog.gamingyourway.com/PermaLink,guid,78341247-3344-4a7a-acb2-c742742edbb1.aspx
		 * <p>
		 * Computes and returns the angle of the point y/x in radians, when measured counterclockwise from a circle's x axis 
		 * (where 0,0 represents the center of the circle). The return value is between positive pi and negative pi. 
		 * Note that the first parameter to atan2 is always the y coordinate.
		 * </p>
		 * @param y The y coordinate of the point
		 * @param x The x coordinate of the point
		 * @return The angle of the point x/y in radians
		 */
		public static function atan2(y:Number, x:Number):Number
		{
			var absY:Number = y;
			var coefficient2:Number = 3 * coefficient1;
			var r:Number;
			var angle:Number;
			
			if (absY < 0)
			{
				absY = -absY;
			}

			if (x >= 0)
			{
				r = (x - absY) / (x + absY);
				angle = coefficient1 - coefficient1 * r;
			}
			else
			{
				r = (x + absY) / (absY - x);
				angle = coefficient2 - coefficient1 * r;
			}
    
			return y < 0 ? -angle : angle;
		}
		
		/**
		 * Generate a sine and cosine table simultaneously and extremely quickly. Based on research by Franky of scene.at
		 * <p>
		 * The parameters allow you to specify the length, amplitude and frequency of the wave. Once you have called this function
		 * you should get the results via getSinTable() and getCosTable(). This generator is fast enough to be used in real-time.
		 * </p>
		 * @param length 		The length of the wave
		 * @param sinAmplitude 	The amplitude to apply to the sine table (default 1.0) if you need values between say -+ 125 then give 125 as the value
		 * @param cosAmplitude 	The amplitude to apply to the cosine table (default 1.0) if you need values between say -+ 125 then give 125 as the value
		 * @param frequency 	The frequency of the sine and cosine table data
		 * @return	Returns the sine table
		 * @see getSinTable
		 * @see getCosTable
		 */
		public static function sinCosGenerator(length:uint, sinAmplitude:Number = 1.0, cosAmplitude:Number = 1.0, frequency:Number = 1.0):Array
		{
			var sin:Number = sinAmplitude;
			var cos:Number = cosAmplitude;
			var frq:Number = frequency * Math.PI / length;
			
			cosTable = new Array();
			sinTable = new Array();
			
			for (var c:uint = 0; c < length; c++)
			{
				cos -= sin * frq;
				sin += cos * frq;
				
				cosTable[c] = cos;
				sinTable[c] = sin;
			}
			
			return sinTable;
		}
		
		/**
		 * Returns the sine table generated by sinCosGenerator(), or an empty array object if not yet populated
		 * @return Array of sine wave data
		 * @see sinCosGenerator
		 */
		public static function getSinTable():Array
		{
			return sinTable;
		}
		
		/**
		 * Returns the cosine table generated by sinCosGenerator(), or an empty array object if not yet populated
		 * @return Array of cosine wave data
		 * @see sinCosGenerator
		 */
		public static function getCosTable():Array
		{
			return cosTable;
		}
		
		/**
		 * A faster version of Math.sqrt
		 * <p>
		 * Computes and returns the square root of the specified number.
		 * </p>
		 * @link http://osflash.org/as3_speed_optimizations#as3_speed_tests
		 * @param val A number greater than or equal to 0
		 * @return If the parameter val is greater than or equal to zero, a number; otherwise NaN (not a number).
		 */
		public static function sqrt(val:Number):Number
		{
			if (isNaN(val))
			{
				return NaN;
			}
			
			var thresh:Number = 0.002;
			var b:Number = val * 0.25;
			var a:Number;
			var c:Number;
			
			if (val == 0)
			{
				return 0;
			}
			
			do {
				c = val / b;
				b = (b + c) * 0.5;
				a = b - c;
				if (a < 0) a = -a;
			}
			while (a > thresh);
			
			return b;
		}
		
		/**
		 * Generates a small random number between 0 and 65535 very quickly
		 * <p>
		 * Generates a small random number between 0 and 65535 using an extremely fast cyclical generator, 
		 * with an even spread of numbers. After the 65536th call to this function the value resets.
		 * </p>
		 * @return A pseudo random value between 0 and 65536 inclusive.
		 */
		public static function miniRand():int
		{
			var result:uint = mr;
			
			result++;
			result *= 75;
			result %= 65537;
			result--;
			
			mr++;
			
			if (mr == 65536)
			{
				mr = 0;
			}
			
			return result;
		}
		
		/**
		 * Generate a random integer
		 * <p>
		 * If called without the optional min, max arguments rand() returns a peudo-random integer between 0 and getrandmax().
		 * If you want a random number between 5 and 15, for example, (inclusive) use rand(5, 15)
		 * Parameter order is insignificant, the return will always be between the lowest and highest value.
		 * </p>
		 * @param min The lowest value to return (default: 0)
		 * @param max The highest value to return (default: getrandmax)
		 * @param excludes An Array of integers that will NOT be returned (default: null)
		 * @return A pseudo-random value between min (or 0) and max (or getrandmax, inclusive)
		 */
		public static function rand(min:Number = NaN, max:Number = NaN, excludes:Array = null):int
		{
			if (isNaN(min))
			{
				min = 0;
			}
			
			if (isNaN(max))
			{
				max = getrandmax;
			}
			
			if (min == max)
			{
				return min;
			}
			
			if (excludes != null)
			{
				//	Sort the exclusion array
				excludes.sort(Array.NUMERIC);
				
				var result:int;
				
				do {
					if (min < max)
					{
						result = min + (Math.random() * (max - min));
					}
					else
					{
						result = max + (Math.random() * (min - max));
					}
				}
				while (excludes.indexOf(result) >= 0);
				
				return result;
			}
			else
			{
				//	Reverse check
				if (min < max)
				{
					return min + (Math.random() * (max - min));
				}
				else
				{
					return max + (Math.random() * (min - max));
				}
			}
		}
		
		/**
		 * Generate a random float (number)
		 * <p>
		 * If called without the optional min, max arguments rand() returns a peudo-random float between 0 and getrandmax().
		 * If you want a random number between 5 and 15, for example, (inclusive) use rand(5, 15)
		 * Parameter order is insignificant, the return will always be between the lowest and highest value.
		 * </p>
		 * @param min The lowest value to return (default: 0)
		 * @param max The highest value to return (default: getrandmax)
		 * @return A pseudo random value between min (or 0) and max (or getrandmax, inclusive)
		 */
		public static function randFloat(min:Number = NaN, max:Number = NaN):Number
		{
			if (isNaN(min))
			{
				min = 0;
			}
			
			if (isNaN(max))
			{
				max = getrandmax;
			}
			
			if (min == max)
			{
				return min;
			}
			else if (min < max)
			{
				return min + (Math.random() * (max - min + 1));
			}
			else
			{
				return max + (Math.random() * (min - max + 1));
			}
		}
		
		/**
		 * Generate a random boolean result based on the chance value
		 * <p>
		 * Returns true or false based on the chance value (default 50%). For example if you wanted a player to have a 30% chance
		 * of getting a bonus, call chanceRoll(30) - true means the chance passed, false means it failed.
		 * </p>
		 * @param chance The chance of receiving the value. Should be given as a uint between 0 and 100 (effectively 0% to 100%)
		 * @return true if the roll passed, or false
		 */
		public static function chanceRoll(chance:uint = 50):Boolean
		{
			if (chance <= 0)
			{
				return false;
			}
			else if (chance >= 100)
			{
				return true;
			}
			else
			{
				if (Math.random() * 100 >= chance)
				{
					return false;
				}
				else
				{
					return true;
				}
			}
		}
		
		/**
		 * Adds the given amount to the value, but never lets the value go over the specified maximum
		 * 
		 * @param value The value to add the amount to
		 * @param amount The amount to add to the value
		 * @param max The maximum the value is allowed to be
		 * @return The new value
		 */
		public static function maxAdd(value:int, amount:int, max:int):int
		{
			value += amount;
			
			if (value > max)
			{
				value = max;
			}
			
			return value;
		}
		
		/**
		 * Adds value to amount and ensures that the result always stays between 0 and max, by wrapping the value around.
		 * <p>Values must be positive integers, and are passed through Math.abs</p>
		 * 
		 * @param value The value to add the amount to
		 * @param amount The amount to add to the value
		 * @param max The maximum the value is allowed to be
		 * @return The wrapped value
		 */
		public static function wrapValue(value:int, amount:int, max:int):int
		{
			var diff:int;

			value = Math.abs(value);
			amount = Math.abs(amount);
			max = Math.abs(max);
			
			diff = (value + amount) % max;
			
			return diff;
		}
		
		/**
		 * Finds the length of the given vector
		 * 
		 * @param	dx
		 * @param	dy
		 * 
		 * @return
		 */
        public static function vectorLength(dx:Number, dy:Number):Number
        {
            return Math.sqrt(dx * dx + dy * dy);
        }
		
		/**
		 * Finds the dot product value of two vectors
		 * 
		 * @param	ax		Vector X
		 * @param	ay		Vector Y
		 * @param	bx		Vector X
		 * @param	by		Vector Y
		 * 
		 * @return	Dot product
		 */
        public static function dotProduct(ax:Number, ay:Number, bx:Number, by:Number):Number
        {
            return ax * bx + ay * by;
        }
        
		/**
		 * Randomly returns either a 1 or -1
		 * 
		 * @return	1 or -1
		 */
        public static function randomSign():Number
        {
            return (Math.random() > 0.5) ? 1 : -1;
        }
		
		/**
		 * Returns true if the number given is odd.
		 * 
		 * @param	n	The number to check
		 * 
		 * @return	True if the given number is odd. False if the given number is even.
		 */
		public static function isOdd(n:Number):Boolean
		{
			if (n & 1)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		/**
		 * Returns true if the number given is even.
		 * 
		 * @param	n	The number to check
		 * 
		 * @return	True if the given number is even. False if the given number is odd.
		 */
		public static function isEven(n:Number):Boolean
		{
			if (n & 1)
			{
				return false;
			}
			else
			{
				return true;
			}
		}
		
		/**
		 * Keeps an angle value between -180 and +180<br>
		 * Should be called whenever the angle is updated on the FlxSprite to stop it from going insane.
		 * 
		 * @param	angle	The angle value to check
		 * 
		 * @return	The new angle value, returns the same as the input angle if it was within bounds
		 */
		public static function wrapAngle(angle:Number):int
		{
			var result:int = int(angle);
			
			if (angle > 180)
			{
				result = -180;
			}
			else if (angle < -180)
			{
				result = 180;
			}
			
			return result;
		}
		
		/**
		 * Keeps an angle value between the given min and max values
		 * 
		 * @param	angle	The angle value to check. Must be between -180 and +180
		 * @param	min		The minimum angle that is allowed (must be -180 or greater)
		 * @param	max		The maximum angle that is allowed (must be 180 or less)
		 * 
		 * @return	The new angle value, returns the same as the input angle if it was within bounds
		 */
		public static function angleLimit(angle:int, min:int, max:int):int
		{
			var result:int = angle;
			
			if (angle > max)
			{
				result = max;
			}
			else if (angle < min)
			{
				result = min;
			}
			
			return result;
		}
		
		/**
		 * Converts a Radian value into a Degree
		 * <p>
		 * Converts the radians value into degrees and returns
		 * </p>
		 * @param radians The value in radians
		 * @return Number Degrees
		 */
		public static function asDegrees(radians:Number):Number
		{
			return radians * RADTODEG;
		}
		
		/**
		 * Converts a Degrees value into a Radian
		 * <p>
		 * Converts the degrees value into radians and returns
		 * </p>
		 * @param degrees The value in degrees
		 * @return Number Radians
		 */
		public static function asRadians(degrees:Number):Number
		{
			return degrees * DEGTORAD;
		}
		
	}

}