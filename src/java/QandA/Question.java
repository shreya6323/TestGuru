/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package QandA;

/**
 *
 * @author shreya gandhi
 */
public class Question {
    private int queid;
    private String que;
    private String op1;
    private String op2;
    private String op3;
    private String op4;
    private String ans;
    private String sub;
    public int getQueid() {
        return queid;
    }

    public void setQueid(int queid) {
        this.queid = queid;
    }

    public String getQue() {
        return que;
    }

     public String getSub() {
        return sub;
    }
     
      public void setSub(String sub) {
        this.sub = sub;
    }
     
    public void setQue(String que) {
        this.que = que;
    }

    public String getOp1() {
        return op1;
    }

    public void setOp1(String op1) {
        this.op1 = op1;
    }

    public String getOp2() {
        return op2;
    }

    public void setOp2(String op2) {
        this.op2 = op2;
    }

    public String getOp3() {
        return op3;
    }

    public void setOp3(String op3) {
        this.op3 = op3;
    }

    public String getOp4() {
        return op4;
    }

    public void setOp4(String op4) {
        this.op4 = op4;
    }

    public String getAns() {
        return ans;
    }

    public void setAns(String ans) {
        this.ans = ans;
    }
    
    
}
