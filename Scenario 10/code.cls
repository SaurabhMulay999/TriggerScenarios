tigger contrige on contact(before insert, before update){
    //store contacts phone and emails
    map<string,contact>email=new map<string,contact>();
    map<string, contact>phone=new map<string,contact>();

    //store the emails and phone for insert operation

    if(isinsert and isbefore){
        for(contact c: trigger.new){
            email.put(c.email,c);
            phone.put(c.phone,c);
        }
    }

    if(isupdate and isbefore){
        for(contact c:trigger.new){
            //here compare the values of old versions
            if(trigger.oldmap.get(c.id).email!=c.email){
                email.put(c.email,c);
            }
            if(oldmap.get(c.id).phone !=c.phone){
                phone.put(c.phone,con);
            }
        }
    }
    string error='';
    //we need existing records and there emails and phones
    list<contact> econtacts=[select id, email, phone from contact where email IN:email.keyset() or phone In: phone.keyset()];

    for(contact c: econtacts){
        if(email.get(c.email)!=NULL){
            //we'll get contact from the email.get()
            error='email';
        }
        if(phone.get(c.phone)!=NULL){
            error=error+(error!=''?' and phone':'phone');

        }
    }

    for(contact c: trigger.new){
        if(error!=''){
            c.addError('contact already exist in the system.');
        }
    }



}