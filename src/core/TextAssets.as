/**
 * Created with IntelliJ IDEA.
 * User: maxmarze
 * Date: 5/22/13
 * Time: 1:02 AM
 * To change this template use File | Settings | File Templates.
 */
package core {
import flash.utils.ByteArray;

import starling.text.BitmapFont;

import starling.text.TextField;

import starling.textures.Texture;

public class TextAssets {

    [Embed(source="/../Assets/test.txt", mimeType="application/octet-stream")]
    private static var storyTextC:Class;
    public static var storyText:ByteArray;



    public static function init():void
    {
        storyText = new storyTextC();
    }
}
}
