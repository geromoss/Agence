//
//  RegistroViewController.swift
//  Agence
//
//  Created by Gerardo Lupa on 21-03-18.
//  Copyright © 2018 Gerardo Lupa. All rights reserved.
//

import UIKit
import CoreData

class RegistroViewController: UIViewController {
    //campo para ingresar el nombre del usuario
    @IBOutlet weak var UsuarioInput: UITextField!
    //campo para ingresar el password
    @IBOutlet weak var PasswordInput: UITextField!
    //campo para ingresar el Confirmacion password
    @IBOutlet weak var CpasswordInput: UITextField!
    //variable de tipo Usuario opcional
    var usuario : Usuario?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ocultamos la barra de NavitacionController para que no se vea en la pantalla
        self.navigationController?.isNavigationBarHidden = true
       
    }
    
    
    @IBAction func registrar(_ sender: Any) {
        //llamamos al metodo comparar
        comparar()
    }
    
    func comparar(){
        //compara si el "password" y el "confirmar password" son iguales, antes de registrar el usuario en el Core Data
        let nombre_usuario_input = self.UsuarioInput.text
        let password_input = self.PasswordInput.text
        
        //comparamos si los 2 campos son iguales
        if(self.PasswordInput.text == self.CpasswordInput.text){
            print("son iguales")
            //grabar datos en el core data
            if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer{
            //accedemos al contexto de la vista que se va a encargar de almacenar los datos de toda de la vista en el Core Data
            let context = container.viewContext
            //hacemos el vinculo con el Entity del correData
            self.usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context) as? Usuario
            //preparamos para insertar los datos en la Entidad
            self.usuario?.nombre_usuario = nombre_usuario_input!
            self.usuario?.password = password_input!
            //guardar en contexto
                do{
                    //esto permite guardar la persistencia del objeto hacia la base de datos CoreData
                    try context.save()
                    //mostramos al usuario el mensaje que se guardo el usuario con exito
                    self.MostrarMensajeAlUsuario(Title: "Alerta", msg: "User saved!")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        //mientras haya un anuncio o actividad se debe dejar en otro hilo la transision de mosterse a otra vista para que sea exitoso
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }catch{
                    print("Ha habido un error al guardar el usuario en el CoreData")
                }
            }
        }else{
            print("no son iguales")
            //mostramos al usuario que los campos password y confirmacion password no son iguales
            self.MostrarMensajeAlUsuario(Title: "Alerta", msg: "Password Don't match")
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
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
