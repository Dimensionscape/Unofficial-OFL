package openfl.utils;
import haxe.Json;
import haxe.ds.StringMap;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;
import openfl.display.Tile;
import openfl.display.Tileset;
import openfl.utils.Object;

/**
The TileAtlas class allows you to import packaged tilesheets into 
Tileset using the TileAtlas data format. 

The `TileAtlas()` constructor creates a new TileAtlas object that
maps verbose identifiers to Tileset rectangles and provides a 
BitmapData reference for Tileset. Use the `Tileset.fromTileAtlas()`
method to intantiate a new Tileset from TileAtlas after the 
TileAtlas object is created.
 **/
#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
#if !flash
@:access(openfl.geom.Rectangle)
#end
class TileAtlas
{
	#if flash
	private var __data:Dynamic;
	#else
	private var __data:Object;
	#end
	
	
	private var __bitmapData:BitmapData;
	private var __tilesetMap:StringMap<Int>;
	private var __tileset:Tileset;
	public function new(bitmapData:BitmapData, data:String) 
	{
		__data = Json.parse(data);
		__tilesetMap = new StringMap<Int>();	
		__populateRectangles(__tileset = new Tileset(__bitmapData = bitmapData));		
	}
	
	private function __populateRectangles(tileset:Tileset):Void
	{
		#if cpp
		var rect:Rectangle = new Rectangle();
		#end
		for (i in 0...__data.numTiles)
		{
			
			var tileObj:Object = __data['$i'];
			
			#if cpp
			rect.setTo(tileObj.rect.x, tileObj.rect.y, tileObj.rect.width, tileObj.rect.height);			
			__tilesetMap.set(tileObj.name, tileset.addRect(rect));	
			#else
			__tilesetMap.set(tileObj.name, tileset.addRect(tileObj.rect));		
			#end
		}		
	}
	
	public function getTile(name:String):Tile{
		var tile:Tile = new Tile(__tilesetMap.get(name));
		tile.tileset = __tileset;		
		return tile;
	}
	
	public function getRect(name:String):Rectangle{
		return __tileset.getRect(__tilesetMap.get(name));
	}
	
	public function getRectID(name:String):Int{
		return __tilesetMap.get(name);
	}
	
}