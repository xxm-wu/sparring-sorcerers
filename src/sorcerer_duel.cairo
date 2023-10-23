use src::sorcerer::Sorcerer;
use src::sorcerer::SorcererTrait;
use src::sorcerer::Talent;


fn duel(ref sorcerer1: Sorcerer, ref sorcerer2: Sorcerer) {
    let mut round = 0;
    loop {
        let mut sorcerer1Attack = sorcerer1.attack;
        let mut sorcerer1Health = sorcerer1.health;
        let sorcerer1Talent = sorcerer1.talent;
        let mut sorcerer2Attack = sorcerer2.attack;
        let mut sorcerer2Health = sorcerer2.health;
        let sorcerer2Talent = sorcerer2.talent;

        if (sorcerer1Health <= 0){
            break ();
        }
        if (sorcerer2Health <= 0) {
            break ();
        }

        match sorcerer2Talent {
            Talent::Talentless => {},
            Talent::Venomous => { 
                sorcerer2.attack = sorcerer2.attack + 1;
            },
            Talent::Swift => {
                 if sorcerer1Attack < 4 {
                    sorcerer1Attack = 1;
                }
            },
            Talent::Guardian => { 
                if (round == 0) {   
                    sorcerer1Attack = 0;
                } 
            },  
        }
        
        match sorcerer1Talent {
            Talent::Talentless => {},
            Talent::Venomous => { 
                sorcerer1.attack = sorcerer1.attack + 1;
            },
            Talent::Swift => {
                 if sorcerer2Attack < 4 {
                    sorcerer2Attack = 1;
                }
            },
            Talent::Guardian => { 
                if (round == 0) {
                    sorcerer2Attack = 0;
                }
            },  
        }   

        if (sorcerer1Attack > sorcerer2Health){
            sorcerer2Health = 0;
        } else {
            sorcerer2Health = sorcerer2Health - sorcerer1Attack;
        }
        
        if (sorcerer2Attack > sorcerer1Health) {
            sorcerer1Health = 0;
        } else {
            sorcerer1Health = sorcerer1Health - sorcerer2Attack;
        }

        sorcerer1.health = sorcerer1Health;
        sorcerer2.health = sorcerer2Health;
      
        round = round + 1;

    }
    
}
