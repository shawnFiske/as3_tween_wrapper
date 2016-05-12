package app.motion {
	
	import fl.transitions.*
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	//Usage////////////////////////////////////////////////////////////////
	//
	//	import app.motion.TweenIt;
	//
	//	var TRANSITION_TIME:Number = 1.0;
	//
	//	TweenIt.transition("tween1", ball, TRANSITION_TIME, {"rotation":90, "x":300, "alpha":0.5}, TweenIt.NONE_EASE_IN_OUT, tweenFinished);
	//	
	//  function tweenFinished():void{
	//		trace("tween tweenFinished");
	//		TweenIt.transition("tween2", ball, TRANSITION_TIME, {"rotation":180, "y":300}, TweenIt.BACK_EASE_IN_OUT);
	//	}
	//
	///////////////////////////////////////////////////////////////////////
	
	public class TweenIt {
	
		//Easy Types
		public static var NONE_EASE_NONE:Function 			= None.easeNone;
		public static var NONE_EASE_IN:Function 			= None.easeIn;
		public static var NONE_EASE_IN_OUT:Function 		= None.easeInOut;
		public static var NONE_EASE_OUT:Function 			= None.easeOut;
		
		public static var BACK_EASE_IN:Function 			= Back.easeIn;
		public static var BACK_EASE_IN_OUT:Function 		= Back.easeInOut;
		public static var BACK_EASE_OUT:Function 			= Back.easeOut;
		
		public static var BOUNCE_EASE_IN:Function 			= Bounce.easeIn;
		public static var BOUNCE_EASE_IN_OUT:Function 		= Bounce.easeInOut;
		public static var BOUNCE_EASE_OUT:Function 			= Bounce.easeOut;
		
		public static var ELASTIC_EASE_IN:Function 			= Elastic.easeIn;
		public static var ELASTIC_EASE_IN_OUT:Function 		= Elastic.easeInOut;
		public static var ELASTIC_EASE_OUT:Function 		= Elastic.easeOut;
		
		public static var REGULAR_EASE_IN:Function 			= Regular.easeIn;
		public static var REGULAR_EASE_IN_OUT:Function 		= Regular.easeInOut;
		public static var REGULAR_EASE_OUT:Function 		= Regular.easeOut;
		
		public static var STRONG_EASE_IN:Function 			= Strong.easeIn;
		public static var STRONG_EASE_IN_OUT:Function 		= Strong.easeInOut;
		public static var STRONG_EASE_OUT:Function 			= Strong.easeOut;
		
		public function TweenIt() {
			// constructor
		}
		
		public static function transition(tweenName:String, item:DisplayObject, time:Number, params:Object, ease:Function = null, callback:Function = null):void{
			
			if(ease == null){
				ease = None.easeNone;
			}
				
			//Set first tween flag
			var isFirstTween:Boolean = true;
			
			//iterate through the params object building a tween for each property
			for(var prop:String in params){
				
				trace(prop, " = ", params[prop]);
				
				var tween:Tween = new Tween(item, prop, ease, getCurrentAttribute(item, prop), params[prop], time, true);
				tween.FPS = 60;
				
				if(isFirstTween && callback != null){
					tween.addEventListener(TweenEvent.MOTION_FINISH, onTweenFinish);
					isFirstTween = false;
				}
			}
			
			//get current value of items properity based on parsed parameter from passed in object
			function getCurrentAttribute(item:DisplayObject, attribute:String):Number{
				switch(attribute){
					case "x":
						return item.x;
						break;
					case "y":
						return item.y;
						break;
					case "z":
						return item.z;
						break;
					case "alpha":
						return item.alpha;
						break;
					case "width":
						return item.width;
						break;
					case "height":
						return item.height;
						break;
					case "scaleX":
						return item.scaleX;
						break;
					case "scaleY":
						return item.scaleY;
						break;
					case "scaleZ":
						return item.scaleZ;
						break;
					case "rotation":
						return item.rotation;
						break;
					case "rotationX":
						return item.rotationX;
						break;
					case "rotationY":
						return item.rotationY;
						break;
					case "rotationZ":
						return item.rotationZ;
						break;
				}
				
				return 0;
			}
			
			function onTweenFinish(e:TweenEvent):void{
				e.currentTarget.removeEventListener(TweenEvent.MOTION_FINISH, onTweenFinish);
				callback();
			}
		}
	}
}
