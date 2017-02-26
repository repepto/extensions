package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class MegagunSync {

	public static function save (value:String, key:String):Void {
		
		megagunsync_save(value, key);
	}

	public static function load(key:String):String
	{
		return megagunsync_load(key);
	}
	
	
	private static var megagunsync_save = Lib.load ("megagunsync", "megagunsync_save", 2);
	private static var megagunsync_load = Lib.load ("megagunsync", "megagunsync_load", 1);
	
	#if (android && openfl)
	private static var megagunsync_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.MegagunSync", "sampleMethod", "(I)I");
	#end
	
	
}