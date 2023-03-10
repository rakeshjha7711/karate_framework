package test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate.Test;

// important: do not use @RunWith(Karate.class) !
public class RunnerTest1 {

    @Test
    public void testParallel() {

        Results results = Runner.parallel(getClass(), 5);
    }
}