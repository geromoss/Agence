//
//  CanvasView.swift
//  Agence
//
//  Created by Gerardo Lupa on 20-03-18.
//  Copyright © 2018 Gerardo Lupa. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    //variable para el color de la linea
    var lineColor: UIColor!
    //variable para el ancho de la linea
    var lineWidth:CGFloat!
    //la variable que sera el path del UIView donde se dibujara el canvas
    var path:UIBezierPath!
    //es donde estamos tocando nuestra vista
    var touchPoint:CGPoint!
    //variable punto de partida cuando se toca la pantalla
    var startingPoint:CGPoint!
    
    //es un tipo de inicialiacion para subVistas SubViews
    override func layoutSubviews() {
        //determinamos que la subvista esta al limite de los bordes, en caso de ser falso los limites de la vista van mas a alla de los bordes del receptos
        self.clipsToBounds = true
        //si es multiple touch la vista 1, 2 3.. 4 dedos al mismo tiempo, false solo 1 touch a la vez
        self.isMultipleTouchEnabled = true
        //asignamos de que color sera la linea que pintara el Canvas
        lineColor = UIColor.black
        //determinamos de que grosor sera la linea
        lineWidth = 5
        
    }
    //con ello trabajamos con cada touch en la pantalla, se llama a esta funcion cuando colocamos nuestro dedo en la pantalla
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //estamos creando un objeto que esta haciendo touching
        let touch = touches.first
        //con esto empezamos a usar el punto de partida del touch para convertirlo en linea
        startingPoint = touch?.location(in: self)
    }
    //aqui es cuando movemos nuestro dedo en la pantalla , llamara esta funcion
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //estamos creando un objeto que esta haciendo touching con el dedo
        let touch = touches.first
        //inicializamos el TouchPoint con lo que primero presiona el dedo en la variable touch en el canvas
        touchPoint = touch?.location(in: self)
        
        path = UIBezierPath()
        //mover la ruta en un punto especifico
        path.move(to: startingPoint)
        //agregamos una nueva linea en el punto especifico
        path.addLine(to: touchPoint)
        //con esto esta actualizando el punto de partida con el punto donde se esta moviendo el dedo, siguiendo la ruta (path) del dedo
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    //para dibujar a lo largo del movimiento
    func drawShapeLayer(){
        //creamos un objeto de tipo ShapeLayer que sera la figura
        let shapeLayer = CAShapeLayer();
        //le damos forma, seguira la ruta que tiene la variable path
        shapeLayer.path = path.cgPath
        //le asignamos que color tiene la linea
        shapeLayer.strokeColor = lineColor.cgColor
        //agisnamos que grosor tendra la linea
        shapeLayer.lineWidth = lineWidth
        //de que color sera la linea
        shapeLayer.fillColor = UIColor.clear.cgColor
        //agregamos el dibujo en un sublayer del Layer principal
        self.layer.addSublayer(shapeLayer)
        //lanzamos el dibujo para mostrar
        self.setNeedsDisplay()
        
    }
    
    func clearCanvas(){
        //remueve todos los puntos dibujados
        path?.removeAllPoints()
        //dejamos el Canvas vacio
        self.layer.sublayers = nil
        //refrescamos la vista del Canvas y estara vacio 
        self.setNeedsDisplay()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
