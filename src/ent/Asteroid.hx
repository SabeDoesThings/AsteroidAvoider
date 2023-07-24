package ent;

import h2d.Tile;
import h2d.Bitmap;

class Asteroid extends Bitmap {
    public static var speed: Float = 1000;
    public static var asteroidWidth = 114;

    public function new(x: Float, y: Float, tile: Tile) {
        super();
        this.x = x;
        this.y = y;
        this.tile = tile;
    }
}