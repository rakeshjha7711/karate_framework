package test;

import com.intuit.karate.junit5.Karate;

class RunnerTest {

    @Karate.Test
    Karate getAPI() {
        return Karate.run("classpath:/api/apitest.feature").relativeTo(getClass());
    }


}
