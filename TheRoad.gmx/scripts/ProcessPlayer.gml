var xx,yy,c1,c2;



// Apply gravity (and jumping)
y = y+grav;
grav+=0.4;
if( grav>=15 ) grav=10;

// If falling, check UNDER the player
if( grav<0 )
{
    if( dir=1){
        sprite_index = Sprite_Chicken_Right;
    }else{
        sprite_index = Sprite_Chicken_Left;
    }
    c2 = -1;
    c1 = GetCollision(x,y);
    if( (x&$1f)>0 ) {
        c2=GetCollision(x+32,y);
    }
    if( c1>=0 || c2>=0 )
    {
        grav=0;
        y = (y&$ffffffe0)+32;
    }
}
else{
    // Otherwise, check above player
    if( jump )
    {
        if( dir=1){
            sprite_index = Sprite_Chicken_Fall_Right;
        }else{
            sprite_index = Sprite_Chicken_Fall_Left;
        }    
    }else{
        grav=0;
        jump=true;
        double_jump = false;
    }
    c2 = -1;
    c1 = GetCollision(x,y+32);
    if( (x&$1f)>0 ) {
        c2=GetCollision(x+32,y+32);
    }
    if( c1>=0 || c2>=0 )
    {
        y = (y&$ffffffe0);
        jump=0;
        double_jump=0;
        
        if( dir=1){
            sprite_index = Sprite_Chicken_Right;
        }else{
            sprite_index = Sprite_Chicken_Left;
        }           
    }
}    




// If moving left, check LEFT collision
if( keyboard_check(vk_left) ) 
{
    dir=-1;
    if(!jump){
        sprite_index = Sprite_Chicken_Right;
    }
    x=x-xspeed;
    c2=-1;
    c1 = GetCollision(x,y);
    if( (y&$1f)>0 ) c2=GetCollision(x,y+32);
    if(  c1>=0 ) || ( c2>=0 )
    {
        x = (x&$ffffffe0)+32;
    }    
}else if( keyboard_check(vk_right) )
{
    // Otherwise, check collision to the right
    dir=1;
    if(!jump){
        sprite_index = Sprite_Chicken_Right;
    }
    x=x+xspeed;
    c2 = -1;
    c1 = GetCollision(x+32,y);
    if( (y&$1f)>0 ) c2=GetCollision(x+32,y+32);
    if(  c1>=0 ) || ( c2>=0 )
    {
        x = (x&$ffffffe0);
    }    
} else {
    // If standing still, don't animate
    image_index =0;
}




