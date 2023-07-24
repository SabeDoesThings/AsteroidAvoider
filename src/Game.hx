import haxe.Timer;
import h2d.Scene;
import hxd.Key;
import hxd.Math;
import ent.Asteroid;
import ent.Background;
import hxd.Res;
import ent.Player;

class Game extends hxd.App {
    private var player: Player;
    private var background2: Background;
    private var asteroid: Asteroid;
    private var mainMenu: Scene;
    private var gameScene: Scene;

    public static var background1: Background;

    public static final WINDOW_WIDTH = 1280;
    public static final WINDOW_HEIGHT = 720;

    var asteroidYPos: Float = Random.int(0, 700);
    var asteroidRadius: Float = 50;
    var playerRadius: Float = 50;
    var defaultPlayerPosX: Float = 50;
    var defaultPlayerPosY: Float = 50;
    var deathTimer = new Timer(2000);

    override function init() {
        //load contents
        var backgroundSprite = Res.space.toTile();
        background1 = new Background(0, 0, backgroundSprite);
        background2 = new Background(Background.bgWidth, 0, backgroundSprite);

        var shipSprite = Res.ship.toTile();
        player = new Player(defaultPlayerPosX, defaultPlayerPosY, shipSprite);

        var asteroidSprite = Res.asteroid.toTile();
        asteroid = new Asteroid(WINDOW_WIDTH, asteroidYPos, asteroidSprite);

        gameScene = s2d;

        mainMenu = new MainMenu();

        //draw
        s2d.addChild(background1);
        s2d.addChild(background2);

        setScene2D(mainMenu);
    }
    
    override function update(dt: Float) {
        if (Key.isPressed(Key.SPACE)) {
            setScene2D(gameScene);

            Background.speed = 300;

            s2d.addChild(player);
            s2d.addChild(asteroid);
    
            player.x = defaultPlayerPosX;
            player.y = defaultPlayerPosY;
            Player.speed = 400;
    
            asteroid.x = WINDOW_WIDTH;
            asteroid.y = asteroidYPos;
        }

        player.update(dt);

        background1.x -= Background.speed * dt;
        background2.x -= Background.speed * dt;

        asteroid.x -= Asteroid.speed * dt;

        if (background1.x + Background.bgWidth < 0) {
            background1.x = background2.x + Background.bgWidth;
        }
        if (background2.x + Background.bgWidth < 0) {
            background2.x = background1.x + Background.bgWidth;
        }

        if (asteroid.x + Asteroid.asteroidWidth < 0) {
            asteroid.x = WINDOW_WIDTH + 200;
            asteroid.y = Random.int(0, 720);
        }

        var dx: Float = player.x - asteroid.x;
        var dy: Float = player.y - asteroid.y;
        var distance: Float = Math.sqrt(dx * dx + dy * dy);

        if (distance < playerRadius + asteroidRadius) {
            Player.speed = 0;

            s2d.removeChild(player);

            deathTimer.run();
            deathTimer.stop();

            setScene2D(mainMenu);
        }
    }
}