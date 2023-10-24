use src::sorcerer::Sorcerer;
use src::sorcerer::SorcererTrait;
use src::sorcerer::Talent;
use debug::PrintTrait;

fn duel(ref sorcerer1: Sorcerer, ref sorcerer2: Sorcerer) {
    let mut round = 0;
    loop {
        let mut sorcerer1Attack = sorcerer1.attack;
        let mut sorcerer1Health = sorcerer1.health;
        let mut sorcerer2Attack = sorcerer2.attack;
        let mut sorcerer2Health = sorcerer2.health;

        if (sorcerer1Health <= 0){
            break ();
        }
        if (sorcerer2Health <= 0) {
            break ();
        }

        match sorcerer2.talent {
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
                    sorcerer2.talent = Talent::Talentless(());
                } 
            },  
        }
        
        match sorcerer1.talent {
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
                     sorcerer1.talent = Talent::Talentless(());
                }
            },  
        }   

        if (sorcerer2Health > sorcerer1Attack){
            sorcerer2Health = sorcerer2Health - sorcerer1Attack;
        } else {
            sorcerer2Health = 0;
        }
        
        if (sorcerer1Health > sorcerer2Attack) {
            sorcerer1Health = sorcerer1Health - sorcerer2Attack;
        } else {
            sorcerer1Health = 0;
        }

        sorcerer1.health = sorcerer1Health;
        sorcerer2.health = sorcerer2Health;
      
        round = round + 1;

    }
    
}
