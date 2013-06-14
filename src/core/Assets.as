/**
 * Created with IntelliJ IDEA.
 * User: maxmarze
 * Date: 5/22/13
 * Time: 12:17 AM
 * To change this template use File | Settings | File Templates.
 */
package core {
import flash.media.Sound;

public class Assets
{

    [Embed(source="/../Assets/story.mp3")]
    private static var themeMusC:Class;
    public static var themeMus:Sound;

    public static function init():void
    {
        themeMus = new themeMusC();
    }
}
}
