/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FileJava;

/**
 *
 * @author UserPC
 */
public class TraLoi {
    public String username;
    public int stt;
    public String cautraloi;
    
    public TraLoi(){
        this.username = "";
        this.stt = 1;
        this.cautraloi = "";
    }
    
    public TraLoi(String u, int so, String tl){
        this.username = u;
        this.stt = so;
        this.cautraloi = tl;
    }
}
