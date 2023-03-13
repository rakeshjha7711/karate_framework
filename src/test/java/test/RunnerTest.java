package test;

import com.intuit.karate.junit5.Karate;

class RunnerTest {

    @Karate.Test
    Karate process_payment() {
        return Karate.run("processPayment").relativeTo(getClass());
    }

     @Karate.Test
    Karate token_expired() {
        return Karate.run("processPayment_token expired").relativeTo(getClass());
    }

     @Karate.Test
    Karate invalid_merchantid() {
        return Karate.run("processPayment_invalid_merchantID").relativeTo(getClass());
    }

}
