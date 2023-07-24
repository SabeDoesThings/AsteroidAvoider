import hxd.res.DefaultFont;
import h2d.Text;
import h2d.Scene;

class MainMenu extends Scene {
    var mainMenuText: Text;

    public function new() {
        super();

        var font = DefaultFont.get();
        this.addChild(Game.background1);
        mainMenuText = new Text(font, this);
        mainMenuText.text = "Asteroid Avoider\n\nPress 'SPACE' to start";
        mainMenuText.x = Game.WINDOW_WIDTH / 2.6;
        mainMenuText.y = Game.WINDOW_HEIGHT / 2.6;
        font.resizeTo(32);
    }
}