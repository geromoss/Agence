//
//  RegisteredUsersTableViewController.swift
//  Agence
//
//  Created by Gerardo Lupa on 24-03-18.
//  Copyright © 2018 Gerardo Lupa. All rights reserved.
//

import UIKit
import CoreData

class RegisteredUsersTableViewController: UITableViewController {
    //array de usuarios inicializado en vacio
    var usuarios : [Usuario] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //conectamos con la base de datos
        if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer{
        //inicializamos el contexto hacia el coreData
        let context = container.viewContext
        
        //recuperar los usuarios que hay en la base de datos
        let fetchrequest = NSFetchRequest<Usuario>(entityName: "Usuario")
        
            do{
                self.usuarios = try context.fetch(fetchrequest)
                print("Obtenemos datos del CoreData")
                print("datos obtenido en CoreData: \(self.usuarios)")
                self.tableView.reloadData()
            
            }catch{
                print("Error no se pudo hacer el fetch \(error.localizedDescription)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("imprimiendo cantidad de usuarios \(self.usuarios.count)")
        return self.usuarios.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //con esto recorremos en el array todos los nombres que hay en el Array de tipo usuario
        let Elusuario = usuarios[indexPath.row]
        let cellID = "cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)

        //mostrara el nombre de usuario uno por uno hasta que se termine el array Usuario[]
        cell.textLabel?.text = Elusuario.nombre_usuario
        return cell
    }
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
