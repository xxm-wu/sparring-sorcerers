use src::sorcerer::Sorcerer;
use src::sorcerer_duel::duel;
use debug::PrintTrait;

fn battle(
    ref team1: Array<Sorcerer>, 
    ref team2: Array<Sorcerer>
) {
    let mut round = 1;
    let mut team1Sorcerer = *team1.at(0);
    let mut team2Sorcerer = *team2.at(0);
    loop {
        duel(ref team1Sorcerer, ref team2Sorcerer);

        if team1Sorcerer.health <= 0 {
            team1.pop_front();
            if team1.is_empty() {
                round = 0;
            } else {
                team1Sorcerer = *team1.at(0);
            } 
        } 
        if team2Sorcerer.health <= 0 {
            team2.pop_front();
            if team2.is_empty() {
                round = 0;
            } else {
                team2Sorcerer = *team2.at(0);
            }
        } 
        if round == 0 {
            break ();
        }
        round = round + 1;
    };


    let mut team1Result = ArrayTrait::new();
    if team1Sorcerer.health > 0 {
        team1.pop_front();
        team1Result.append(team1Sorcerer);
    }
   
    loop {
        if team1.is_empty() { 
            break (); 
        }

        let s1 = team1.pop_front().unwrap();

         team1Result.append(s1);
    };


    let mut team2Result = ArrayTrait::new();
    if team2Sorcerer.health > 0 {
        team2.pop_front();
        team2Result.append(team2Sorcerer);
    }
   
    loop {
        if team2.is_empty() { 
            break (); 
        }

        let s2 = team2.pop_front().unwrap();

         team2Result.append(s2);
    };

    team1 = team1Result;
    team2 = team2Result;

}
