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

    @NSManaged var nombre_usuario : String
    @NSManaged var password : String
    @NSManaged var dibujo : NSData?

    
    
}
