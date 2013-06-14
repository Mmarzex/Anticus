package states {

import Box2D.Common.Math.b2Vec2;

import citrus.core.starling.StarlingState;
import citrus.math.MathVector;
import citrus.objects.platformer.box2d.Hero;
import citrus.objects.platformer.box2d.Platform;
import citrus.physics.box2d.Box2D;
import citrus.utils.objectmakers.ObjectMakerStarling;
import citrus.view.starlingview.StarlingArt;

import starling.display.Quad;

import starling.textures.Texture;
import starling.textures.TextureAtlas;

import flash.display.Bitmap;
import flash.geom.Rectangle;

/**
 * @author Aymeric
 */
public class testTiledState extends StarlingState {

//    [Embed(source="/../Assets/tiledmap/map-atlas.tmx", mimeType="application/octet-stream")]
//    private const _Map:Class;
//
//    [Embed(source="/../Assets/tiledmap/Genetica-tiles-atlas.xml", mimeType="application/octet-stream")]
//    private const _MapAtlasConfig:Class;
//
//    [Embed(source="/../Assets/tiledmap/Genetica-tiles-atlas.png")]
//    private const _MapAtlasPng:Class;

    [Embed(source="/../Assets/test/levOne.tmx", mimeType="application/octet-stream")]
    private const _Map:Class;

    [Embed(source="/../Assets/test/tile_atlas.xml", mimeType="application/octet-stream")]
    private const _MapAtlasConfig:Class;

    [Embed(source="/../Assets/test/tile_atlas.png")]
    private const _MapAtlasPng:Class;

    public function testTiledState() {
        super();

        // Useful for not forgetting to import object from the Level Editor
        var objects:Array = [Hero, Platform];
    }

    override public function initialize():void {

        super.initialize();

        var box2D:Box2D = new Box2D("box2D");
        // box2D.visible = true;
        add(box2D);

        var bitmap:Bitmap = new _MapAtlasPng();
        var texture:Texture = Texture.fromBitmap(bitmap);
        var xml:XML = XML(new _MapAtlasConfig());
        var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);

        ObjectMakerStarling.FromTiledMap(XML(new _Map()), sTextureAtlas);

        var hero:Hero = getObjectByName("hero") as Hero;
        hero.view = new Quad(70, 70, 0x3366FF);
        hero.jumpHeight = 10;
        box2D.gravity = new b2Vec2(0.0, 0.0);
        view.camera.setUp(hero, new MathVector(stage.stageWidth / 2, 240), new Rectangle(0, 0, 1280, 640), new MathVector(.25, .05));

        (view.getArt(getObjectByName("foreground")) as StarlingArt).alpha = 0.3;
    }
}
}
