package prova_inatel.pokemon;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testPokemon() {
        return Karate.run("pokemon").relativeTo(getClass());
    }    

}
