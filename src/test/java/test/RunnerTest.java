package test;

import com.intuit.karate.junit5.Karate;

class RunnerTest {

    @Karate.Test
    Karate process_payment() {
        return Karate.run("readJSON").relativeTo(getClass());
    }


}
