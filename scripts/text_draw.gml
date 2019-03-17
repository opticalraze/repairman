///text_draw(x,y,string,sprite)
var _sprite, _fontLayout, _x, _y, _string, i, _offsetX, _offsetY;

_x = argument0;
_y = argument1;
_string = argument2;
_sprite = argument3;

_fontLayout = "0123456789$";

if (!variable_global_exists("_charMap"))
{
    for(i = 0; i <= 255; i++)
    {
        global._charMap[i] = -1;
    }
    for(i = 1; i <= string_length(_fontLayout); i++)
    {
        global._charMap[ord(string_char_at(_fontLayout, 1))] = i;
    }
}

_offsetX = 0;
_offsetY = 0;
for(i = 1; i <= string_length(_string); i++)
{
    var c;
    c = ord(string_char_at(_string, i));
    
    if(global._charMap[c] != -1)
    {
        draw_sprite(_sprite, global._charMap[c]-1, _x + _offsetX, _y + _offsetY);
        _offsetX += sprite_get_width(_sprite);
    }
    
    if(string_char_at(_string, i) == '#')
    {
        _offsetX = 0;
        _offsetY = sprite_get_height(_sprite);
    }
}
