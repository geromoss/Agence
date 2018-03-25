//
//  ViewController.swift
//  Agence
//
//  Created by Gerardo Lupa on 20-03-18.
//  Copyright © 2018 Gerardo Lupa. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    //campo para ingresar el nombre de usuario
    @IBOutlet weak var labelUsuario: UITextField!
    //campo para ingresar el password
    @IBOutlet weak var LabelPassword: UITextField!
    //login principal
    var login_usuario : String = ""
    //almacena el passwrod
    var login_password: String = ""
    var usuario: [Usuario] = []
    var almacenado: Usuario!

    override func viewDidLoad() {
        super.viewDidLoad()
    //carga datos desde el Core data
    
    
    }
    
    @IBAction func logear(_ sender: Any) {
        //pasamos los que esta almacenado en la input text pasarlo a una variable String para hacer posteriores comparaciones
        self.login_usuario = self.labelUsuario.text!
        self.login_password = self.LabelPassword.text!
        
    //inicializador de CoreData
    if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer{
    //inicializamos el contexto hacia el coreData
    let context = container.viewContext
    
    //definidos que entidad queremos usar
    let ed = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
    
    //filtramos los datos que queremos consultar le llamamos Request o req.
    let req = NSFetchRequest<NSFetchRequestResult>()
    //le agregamos la entidad al Request
    req.entity = ed
    //ponemos una condicion para encontrar el usuario en el CoreData
    let condicion = NSPredicate(format: "nombre_usuario == %@ AND password == %@", login_usuario, login_password)
    //agregamos la condicion en el Request
    req.predicate = condicion
        
        do{
            
            let resultado = try context.fetch(req)
            print("obtenido resultados")
            //mostramos por consola el resultado
            print(resultado)
            if(resultado.count > 0){
                //encontro el registro con usaurio y password correctos
                almacenado = resultado[0] as! Usuario
                print("Nombre usuario: \(almacenado.nombre_usuario)")
                print("password :\(almacenado.password)")
            }else{
                //mostramos un mensaje de alerta en el iphone del usuario
               self.MostrarMensajeAlUsuario(Title: "Alerta", msg: "Incorrect user/password combination.")
            }
        }catch{
            print("se produjo un error \(error.localizedDescription)")
        }

    }
        
    }
    
    func MostrarMensajeAlUsuario(Title: String, msg: String){
        //definimos que tipo de alerta
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        //definimos las acciones que tendra la alerta es decir, mensajes y botones
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        //ejecutamos la alerta al usuario
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = true
    }


}

