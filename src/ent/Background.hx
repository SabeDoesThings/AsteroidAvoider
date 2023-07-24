package ent;

import h2d.Tile;
import h2d.Bitmap;

class Background extends Bitmap {
    public static var bgWidth = 1280;
    public static var speed = 300;

    public function new(x: Float, y: Float, tile: Tile) {
        super();
        this.x = x;
        this.y = y;
        this.tile = tile;
    }
}