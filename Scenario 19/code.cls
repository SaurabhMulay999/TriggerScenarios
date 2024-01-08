/*
public class without sharing helper{


    public static void method(list<opplineitem>olilist){
        
        set<id>oppids=new set<id>();
        for(opplineitem op:olilist){
            if(op.opportunity.productcategory!=op.productcategory){
                op.addError('Fuck off!!!!Bro the field productcategory aint match');
            }
        }

  
  }
}
*/


public class helper{
    public static void method(list<opplineitem> olilist){
        set<id>oppid=new set<id>();

        set<id>productid=new set<id>();
        
        for(opplineitem op:olilist){
            oppid.add(op.opportunityid);
            productid.add(op.product2Id);
        }

        map<id,opportunity> opmap=new map<id,opportunity>([select id, productCategory from opportunity where id in :oppid]);
        map<id,product2> productmap=mew map<id,product2>([select id, productCategory from product where id in: productid]);

        for(opplineitem oli:olilist){
            if(opmap.containskey(oli,opportunityid)  and productmap.containskey(oli.product2id) and 
            opmap.get(oli.opportunityid).productCategory!=productmap.get(oli.product2id).productCategory){
                oli.addError('product's productCategory and opportunity productCategory must be same!!! fuckoff!');
            }
        }
    }
}

trigger opplineitemtrg on opplineitem(before insert){
    helper.method(trigger.new);
}