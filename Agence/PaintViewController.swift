//
//  PaintViewController.swift
//  Agence
//
//  Created by Gerardo Lupa on 21-03-18.
//  Copyright © 2018 Gerardo Lupa. All rights reserved.
//

import UIKit
import CoreData

class PaintViewController: UIViewController {

    //crear una variable llamado canvasView de tipo CanvasView! (es un objeto)
    @IBOutlet weak var canvasView: CanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        self.navigationItem.hidesBackButton = true
        let nuevoBotonBack = UIBarButtonItem(title: "Home", style: UIBarButtonItemStyle.plain, target: self, action: #selector(PaintViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = nuevoBotonBack
        */
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func clearCanvas(_ sender: Any) {
        //llamamos al objeto el metodo clearCanvas declarado en el archivo CanvasView.swift
        canvasView.clearCanvas()

    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            //presionado el boton back aqui podemos guardar en el coreData
            print("presionado el boton back aqui se puede guardar en el coredata")
           
        }
    }
    
    
    func back(sender: UIBarButtonItem){
        print("presiona el boton back aqui podemos guardar en el coreData")
        _ = navigationController?.popViewController(animated: true)
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
