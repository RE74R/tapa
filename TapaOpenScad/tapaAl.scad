/*
modelado de una tapa para el telescopio de AL
creado el juevs 9 de junio de 2022
© Alberto Sanz 
*/

//data
radio_interior=45;
grosor_paredes=2;
diametro_resaltes=4;
profundidad=30;
resolucion=150;
cantidadResaltes=20;


// para desactivar una linea usar *
// para hacer transparente un objeto usar %
// libro de referencia: https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#offset


//RESALTES

for (i=[0:cantidadResaltes-1]){
    rotate([0,0,360/cantidadResaltes*i])
    
color("green")
translate([radio_interior+(diametro_resaltes/2),0,5])
    
union(){
cylinder (h=20, d=diametro_resaltes,$fn=100);
sphere(d=diametro_resaltes,$fn=resolucion);
translate([0,0,20])// mueve el centro de coordenadas
sphere(d=diametro_resaltes,$fn=resolucion);
}

}


//TAPA RESTA DE CILINDRO EXTERIOR MENOS INTERIOR

difference(){ //esto es una booleana de resta
    cylinder(h=profundidad,r=radio_interior+(diametro_resaltes/2)+(grosor_paredes/2), $fn=resolucion);    //CILINDRO EXTERIOR

    color("red") //COLOR CILINDRO INTERIOR
        translate([0,0,grosor_paredes]) //DESPLAZAMIENTO HACIA ARRIBA, PARA QUE "SOBREPASE" AL EXTERIOR, EVITANDO LAS SUPERFICES TANGENTES EN LAS BOOLEANAS
            cylinder(h=profundidad, r=radio_interior+(diametro_resaltes/2)-(grosor_paredes/2), $fn=resolucion);//CILINDRO INTERIOR
    }