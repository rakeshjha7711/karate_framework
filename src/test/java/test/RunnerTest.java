package test;

import com.intuit.karate.junit5.Karate;

class RunnerTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run("processPayment").relativeTo(getClass());
    }

}
