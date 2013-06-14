/**
 * Created with IntelliJ IDEA.
 * User: maxmarze
 * Date: 5/21/13
 * Time: 5:19 PM
 * To change this template use File | Settings | File Templates.
 */
package states {
import citrus.core.starling.StarlingState;
import citrus.objects.platformer.box2d.Hero;
import citrus.objects.platformer.box2d.Platform;
import citrus.physics.box2d.Box2D;
import citrus.utils.objectmakers.ObjectMaker2D;
import citrus.utils.objectmakers.ObjectMakerStarling;
import citrus.utils.objectmakers.tmx.TmxMap;

import flash.display.Bitmap;

import flash.filesystem.File;
import flash.filesystem.FileMode;

import flash.filesystem.FileStream;

import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class StarlingTiledMapGameState extends StarlingState
{
//    [Embed(source="/../Assets/levelOne_working_two.tmx", mimeType="application/octet-stream")]
//    private const _Map:Class;
//
//    [Embed(source="/../Assets/working_tileset_atlas.xml", mimeType="application/octet-stream")]
//    private const _MapAtlasConfig:Class;
//
//    [Embed(source="/../Assets/working_tileset_atlas.png")]
//    private const _MapAtlasPng:Class;
//
//    [Embed(source="/../Assets/working_tileset.png")]
//    private const _IMG:Class;
//
//    [Embed(source="/../Assets/working_tileset_two.png")]
//    private const _IMGTWO:Class;

    [Embed(source="/../Assets/test/levTwo.tmx", mimeType="application/octet-stream")]
    private const _Map:Class;

    [Embed(source="/../Assets/test/tile_atlas.xml", mimeType="application/octet-stream")]
    private const _MapAtlasConfig:Class;

    [Embed(source="/../Assets/test/tile_atlas.png")]
    private const _MapAtlasPng:Class;

    private var map:TmxMap;
    public function StarlingTiledMapGameState()
    {
        super();
        var objects:Array = [Hero, Platform];
    }

    override public function initialize():void
    {
        super.initialize();

        var box2D:Box2D = new Box2D("box2d");
        add(box2D);
        trace("New State Loaded");
//        var file:File = File.applicationStorageDirectory.resolvePath("SaveFile.txt");
//        var stream:FileStream = new FileStream();
//        stream.open(file, FileMode.READ);
//        trace(stream.readUTFBytes(10));

//        var bmp:Bitmap = new _IMG();
//        var bmpt:Bitmap = new _IMGTWO();
//        bmp.name = "working_tileset";
//        bmpt.name = "working_tileset_two";
//        ObjectMaker2D.FromTiledMap(XML(new _Map()), [bmp, bmpt]);

        var bitmap:Bitmap = new _MapAtlasPng();
        var texture:Texture = Texture.fromBitmap(bitmap);
        var xml:XML = XML(new _MapAtlasConfig());
        var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);

        ObjectMakerStarling.FromTiledMap(XML(new _Map()), sTextureAtlas);

        //map = new TmxMap(XML(new _maptmx()));

    }
}
}
