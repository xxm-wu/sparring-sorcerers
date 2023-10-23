use src::sorcerer::Sorcerer;
use src::sorcerer_duel::duel;
use debug::PrintTrait;

fn battle(
    ref team1: Array<Sorcerer>, 
    ref team2: Array<Sorcerer>
) {
    let mut round = 1;
    let mut team1Sorcerer = team1.pop_front().unwrap();
    let mut team2Sorcerer = team2.pop_front().unwrap();
    loop {
        'Round is: '.print();
        round.print();
        duel(ref team1Sorcerer, ref team2Sorcerer);
        'The team1Sorcerer health is: '.print();
        team1Sorcerer.health.print();
        'The team2Sorcerer health is: '.print();
        team2Sorcerer.health.print();
        if team1Sorcerer.health <= 0 {
            if team1.is_empty() {
                break ();
            }else{
                team1Sorcerer = team1.pop_front().unwrap();
            }
            
        }
        if team2Sorcerer.health <= 0 {
            if team2.is_empty() {
                break ();
            }else{
                team2Sorcerer = team2.pop_front().unwrap();
            }
            
        }
        round = round + 1;
    }
}
