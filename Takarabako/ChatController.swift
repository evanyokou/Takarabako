//
//  ChatController.swift
//  Takarabako
//
//  Created by Yuhao on 2017/06/02.
//  Copyright © 2017年 Yuhao. All rights reserved.
//

import UIKit

class ChatController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var msgTextField: UITextField!
    
    
    var msg: [Msg] = [Msg]()
    let screenWidth = UIScreen.main.bounds.size.width
    var flag:Bool = false
    
    let dateFormatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "EEEE HH:mm"
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "MsgCell") as! MsgCell
        
        cell.setMsgModle(msg: (self.msg[indexPath.row]))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowHeight: CGFloat = 0
        let size = NSString(string: ((self.msg[indexPath.row]).text)!).boundingRect(with: CGSize(width:screenWidth-140,height:CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 14)], context: nil).size
        
        if size.height > 20 {
            rowHeight = size.height+70
        }else{
            rowHeight = 90
        }
        return rowHeight
    }
    
    
    @IBAction func forwardButtonClick(_ sender: UIButton) {
        if flag {
            let m = Msg()
            m.text = msgTextField.text
            m.time = dateFormatter.string(from: Date())
            self.msg.append(m)
            flag = !flag
        }else{
            let m = Msg()
            m.text = msgTextField.text
            m.time = dateFormatter.string(from: Date())
            m.target = 1
            self.msg.append(m)
            flag = !flag
        }
        self.tbView.reloadData()
        self.msgTextField.text = ""
        let indexPath = IndexPath(row: self.msg.count-1, section: 0)
        self.tbView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    @IBAction func backforwardView(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewControllerSBID")
        self.present(viewController, animated: true, completion: nil)
    }
    
}
