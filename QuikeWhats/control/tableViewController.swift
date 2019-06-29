

import UIKit
import Firebase
class tableViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource,UITextFieldDelegate{
    
    var mesArray = [ModelViewController]()
     @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var txtChat: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
table.delegate = self
        table.dataSource = self
        txtChat.delegate = self
    // table.register(UINib (nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "My cell")
         configration ()
      // self.table.rowHeight = UITableView.automaticDimension;
       RetriveData ()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.height.constant=308
            self.view.layoutIfNeeded()    // m3naha  if something chang on layout redraw da ersem da
        }
  
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        UIView.animate(withDuration: 0.5) {
            self.height.constant=50
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        do{
       try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch{
            print("error")
        }
        
    }
    
    @IBAction func sendMsg(_ sender: Any) {
        
        txtChat.endEditing(true)
        txtChat.isEnabled = false
        sendButton.isEnabled = false
         let Messge = Database.database().reference().child("message")
        let dic = ["Sender" : Auth.auth().currentUser?.email , "Msg" : txtChat.text!]
        Messge.childByAutoId().setValue(dic) {
            (error , Reference) in
            if error != nil
            {
                print ("error")
            }
            else {
                self.txtChat.isEnabled = true
               self.sendButton.isEnabled = true
                self.txtChat.text=""
            }
        }
            
        
      
        
    }
    
    func RetriveData ()
    {
        let messageDB = Database.database().reference().child("message")
        
        messageDB.observe(.childAdded) { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            let text = snapshotValue["Msg"]!
            let sender = snapshotValue["Sender"]!
            
            let message = ModelViewController()
            message.textmsg = text
            message.name = sender
            
            self.mesArray.append(message)
            
            
            
            self.table.reloadData()
        }
            
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "TableViewCell2", for: indexPath) as! TableViewCell2
        // 3lshan ana bst5dem custoum cell lazem a7ded class  bta3t el cell de 3lshan y3raf ay class feh el componant bta3t el cell
        //indexpath is a location identifier for this cell and indexpath consist of row and section each indexpath
        
        cell.msg.text = mesArray[indexPath.row].textmsg
        cell.name.text = mesArray[indexPath.row].name
        return cell
    
    }
    func configration ()
    {
       
        self.table.estimatedRowHeight = 120
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
