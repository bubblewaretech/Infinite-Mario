package com.mojang.mario {

import java.awt.Color;
import java.awt.JGraphics;

import com.mojang.mario.sprites.Mario;

public class LoseScene extends Scene
{
    private var component:MarioComponent;
    private var _tick:int;
    private var scrollMessage:String = "Game over!";
    
    public function LoseScene(component:MarioComponent)
    {
        this.component = component;
    }

    override public function init():void
    {
    }

    override public function render(g:JGraphics, alpha:Number):void
    {
        g.setColor(0xA07070);
        g.fillRect(0, 0, 320, 240);
        var f:int = _tick/3%10;
        if (f>=6) f = 10-f;
        g.drawImage(Art.gameOver[f][0], 160-48, 100-32);
        drawString(g, scrollMessage, 160-scrollMessage.length*4, 160, 0);
    }

    private function drawString(g:JGraphics, text:String, x:int, y:int, c:int):void
    {
        //var ch:Array = text.toCharArray(); // char[] 
        for (var i:int = 0; i < text.length; i++)
        {
            g.drawImage(Art.font[text.charCodeAt(i) - 32][c], x + i * 8, y);
        }
    }

    private var wasDown:Boolean = true;

    override public function tick():void
    {
        _tick++;
        if (!wasDown && keys[Mario.KEY_JUMP])
        {
            component.toTitle();
        }
        if (keys[Mario.KEY_JUMP])
        {
            wasDown = false;
        }
    }

    override public function getX(alpha:Number):Number
    {
        return 0;
    }

    override public function getY(alpha:Number):Number
    {
        return 0;
    }
}
}
