/**
 * Created with IntelliJ IDEA.
 * User: maxmarze
 * Date: 5/21/13
 * Time: 10:28 PM
 * To change this template use File | Settings | File Templates.
 */
package states {
import citrus.core.CitrusEngine;
import citrus.core.CitrusObject;
import citrus.core.starling.StarlingState;
import citrus.input.controllers.Keyboard;

import core.TextAssets;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

import flash.net.SharedObject;

import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.textures.Texture;

public class Title extends StarlingState
{

    [Embed(source="/../Assets/fonts/bit.fnt", mimeType="application/octet-stream")]
    public static const bitXML:Class;

    [Embed(source="/../Assets/fonts/bit.png")]
    public static const bitTexture:Class;

    private var textField:TextField;

    public function Title()
    {
        TextAssets.init();
        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    public function init(event:Event):void
    {
        TextField.registerBitmapFont(new BitmapFont(Texture.fromBitmap(new bitTexture()), XML(new bitXML())));
        var str:String = TextAssets.storyText.toString();
        textField = new TextField(300, 300, "0", "Veranda", 12, 0xFFFFFF);
        textField.fontName = "04b03";
        textField.fontSize = 18;
        textField.color = 0xFFFFFF;
        textField.autoScale = true;
        textField.hAlign = "center";
        textField.x = stage.stageWidth / 3;
        //textField.x = 300;
        textField.y = 40;
        textField.text = str;

        // game.soundManager.playSound("title", 1, 99);
        CitrusEngine.getInstance().sound.playSound("title");
        addChild(textField);

        stage.addEventListener(KeyboardEvent.KEY_DOWN, checkKey);
    }

    override public function update(timeDelta:Number):void
    {
        if(textField.y != -215)
        {
            textField.y -= .25;
            if(textField.y == -215)
            {
                textField.dispose();
            }
        }

    }

    override public function destroy():void
    {
        textField.dispose();
        textField.removeFromParent(textField);
        textField = null;
        removeEventListeners();
    }

    private function saveGameBrowser():void
    {
        var sharedObject:SharedObject = SharedObject.getLocal("saveData");
        trace(sharedObject.data.playerName);
        sharedObject.data.playerName = "AnticusTwo";
        sharedObject.data.level = "001";
        sharedObject.data.stageOn = "1";
        trace(sharedObject.data.playerName);
        sharedObject.flush();
    }

    private function saveGameAIR():void
    {
        var file:File = File.applicationStorageDirectory.resolvePath("SaveFile.txt");
        var stream:FileStream = new FileStream();
        stream.open(file, FileMode.WRITE);
        stream.writeUTFBytes("This is a test.");
        stream.close();
    }

    private function checkKey(event:KeyboardEvent):void
    {
        if(event.keyCode == Keyboard.ENTER || event.keyCode == Keyboard.X)
        {
            //game.changeState(Game.PLAY_STATE);
            trace("test");
            //saveGameBrowser();
            saveGameAIR();
            //CitrusEngine.getInstance().state = new testTiledState();
            CitrusEngine.getInstance().state = new StarlingTiledMapGameState();
        }

    }

}
}
