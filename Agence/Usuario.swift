//
//  Usuario.swift
//  Agence
//
//  Created by Gerardo Lupa on 23-03-18.
//  Copyright © 2018 Gerardo Lupa. All rights reserved.
//

import UIKit
import CoreData

class Usuario: NSManagedObject {
    
    //orientado a Objeto y a la vez mapeando la base de Datos en el CoreData
    @NSManaged var nombre_usuario : String
    //almacenamos la variable password de tipo string
    @NSManaged var password : String
    //aqui se almacena el dibujo de tipo NSData permite guardar todo tipo de archivos
    @NSManaged var dibujo : NSData?

    
    
}
