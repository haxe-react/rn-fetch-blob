package react.native.fetch_blob;

import js.Promise;
import js.Error;
import haxe.extern.EitherType;
import haxe.DynamicAccess;
import haxe.Constraints;

@:jsRequire('rn-fetch-blob', 'default')
	extern class RNFetchBlob {
	static var fetch:Fetch;
	static var android:Android;
	static var ios:Ios;
	static var session:Session;
	static var fs:Fs;
	static var wrap:Wrap;
	static var polyfill:Polyfill;
	static var JSONStream:JSONStream;

	static function config(opt:{}):{fetch:Fetch};
}

typedef Fetch = String->String->?DynamicAccess<String>->?Dynamic->StatefulPromise<RNFBResponse>;
extern class Base64 {}
extern class Android {}
extern class Ios {}
extern class Session {}
extern class Fs {
	var dirs:{
		DocumentDir:String,
		CacheDir:String,
		MainBundleDir:String,
		DCIMDir:String,
		DownloadDir:String,
		MusicDir:String,
		PictureDir:String,
		MovieDir:String,
		RingtoneDir:String,
		SDCardDir:String,
	};
	
	@:overload(function(path:String, encoding:String, bufferSize:Int, interval:Int):Promise<RNFBReadStream> {})
	@:overload(function(path:String, encoding:String, bufferSize:Int):Promise<RNFBReadStream> {})
	function readStream(path:String, encoding:String):Promise<RNFBReadStream>;
	
	@:overlaod(function(path:String, encoding:String, append:Bool):Promise<RNFBWriteStream> {})
	function writeStream(path:String, encoding:String):Promise<RNFBWriteStream>;
	
	function ls(path:String):Promise<Array<String>>;
	function mv(from:String, to:String):Promise<Dynamic>;
	function cp(src:String, dst:String):Promise<Dynamic>;
	function exists(path:String):Promise<Bool>;
	function isDir(path:String):Promise<Bool>;
	function unlink(path:String):Promise<Dynamic>;
	function stat(path:String):Promise<RNFBStat>;
	
}
extern class Wrap {}
extern class Polyfill {}
extern class JSONStream {}

extern class RNFBReadStream {
	function open():Void;
	function onData(f:Dynamic->Void):Void;
	function onError(f:Error->Void):Void;
	function onEnd(f:Void->Void):Void;
}

extern class RNFBWriteStream {
	function write(data:EitherType<String, Array<Int>>):Promise<RNFBWriteStream>;
	function close():Promise<Dynamic>;
}

extern class RNFBStat {
	
}

extern class RNFBResponse {
	
}

extern class StatefulPromise<T> extends Promise<T> {
	function cancel():StatefulPromise<T>;
	function progress(f:Int->Int->Void):StatefulPromise<T>;
	function uploadProgress(f:Int->Int->Void):StatefulPromise<T>;
}