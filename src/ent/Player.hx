package ent;

import hxd.Key;
import h2d.Tile;

class Player extends h2d.Bitmap {
    public static var speed: Float;

    public function new(x: Float, y: Float, tile: Tile) {
        super();

        this.x = x;
        this.y = y;
        this.tile = tile;

        speed = 400;
    }

    public function update(dt: Float) {
        if (Key.isDown(Key.W)) {
            this.y -= speed * dt;
        }
        if (Key.isDown(Key.A)) {
            this.x -= speed * dt;
        }
        if (Key.isDown(Key.S)) {
            this.y += speed * dt;
        }
        if (Key.isDown(Key.D)) {
            this.x += speed * dt;
        }
    }
}