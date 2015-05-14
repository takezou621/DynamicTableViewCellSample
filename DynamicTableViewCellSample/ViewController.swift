//
//  ViewController.swift
//  DynamicTableViewCellSample
//
//  Created by Takeshi Kawai on 2015/05/14.
//  Copyright (c) 2015年 Takeshi Kawai. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    // Delegates
    UITableViewDelegate,
    UITableViewDataSource,
    UITextFieldDelegate
{
    
    let item = ["first","second","third"]
    var secondLabel = ""             // エラーメッセージ
    var errorCellHeight = CGFloat(0) // エラー表示用のセルの高さ

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // ---- UITableViewDelegate ---- //
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("cellForFowAtIndexPath \(indexPath)")
        if indexPath.row == 1{
            // エラー表示用のセル
            var cell = tableView.dequeueReusableCellWithIdentifier(item[indexPath.row], forIndexPath: indexPath) as! CustomErrorCell
            cell.label.text = secondLabel
        }
        var cell = tableView.dequeueReusableCellWithIdentifier(item[indexPath.row],forIndexPath: indexPath) as! UITableViewCell
    
        return cell
    }
    
    /**
       セルの高さを返すメソッド
    */
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 1 {
            // エラー用のセル
            return errorCellHeight
        }
        return 44
    }
    
    // ---- UITextFieldDelegate ---- //
    /**
        編集終了時に呼ばれる
    */
    func textFieldDidEndEditing(textField: UITextField) {
        let indexPath = NSIndexPath(forRow: 1, inSection: 0)
        if textField.tag == 1 {
            println("first field did end editing.")
            errorCellHeight = 20
            secondLabel = "second"
        }else if textField.tag == 3 {
            println("third field did end editing.")
            errorCellHeight = 0
            secondLabel = ""
        }
        
        tableView.reloadRowsAtIndexPaths([indexPath],
            withRowAnimation: UITableViewRowAnimation.Automatic)
        
    }
}