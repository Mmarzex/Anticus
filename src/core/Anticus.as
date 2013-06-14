package core {

import citrus.core.starling.StarlingCitrusEngine;
import states.Title;

[SWF(width="800", height="600", frameRate="60", backgroundColor="#000000")]
public class Anticus extends StarlingCitrusEngine {

    public function Anticus() {
        setUpStarling(true);

        Assets.init();

        sound.addSound("title", Assets.themeMus);

        state = new Title();

    }
}
}
