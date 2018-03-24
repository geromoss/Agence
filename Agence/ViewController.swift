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
    
    @IBOutlet weak var labelUsuario: UITextField!
    
    @IBOutlet weak var LabelPassword: UITextField!
    //login principal
    var login_usuario : String = ""
    var login_password: String = ""
    var usuario: [Usuario] = []
    var almacenado: Usuario!

    override func viewDidLoad() {
        super.viewDidLoad()
    //carga datos desde el Core data
    
    
    }
    
    @IBAction func logear(_ sender: Any) {
        
        self.login_usuario = self.labelUsuario.text!
        self.login_password = self.LabelPassword.text!
        
    if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer{
    let context = container.viewContext
    
    //obtenemos datos de la entidad
    let ed = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
    
    //filtramos los datos que queremos consultar
    let req = NSFetchRequest<NSFetchRequestResult>()
    req.entity = ed
    //ponemos una condicion para encontrar el usuario en el CoreData
    let condicion = NSPredicate(format: "nombre_usuario == %@ AND password == %@", login_usuario, login_password)
    req.predicate = condicion
        
        do{
            let resultado = try context.fetch(req)
            print("obtenido resultados")
            print(resultado)
            if(resultado.count > 0){
                //encontro el registro con usaurio y password correctos
                almacenado = resultado[0] as! Usuario
                print("datos encontrados en CoraData mostrar acceso")
                print("Nombre usuario: \(almacenado.nombre_usuario)")
                print("password :\(almacenado.password)")
              
                
            }else{
               self.MostrarMensajeAlUsuario(Title: "Alerta", msg: "Incorrect user/password combination.")
            }
        }catch{
            print("se produjo un error \(error.localizedDescription)")
        }

    }
        
    }
    
    func MostrarMensajeAlUsuario(Title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
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

