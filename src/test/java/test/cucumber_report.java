package test;

import com.ibm.icu.impl.locale.XCldrStub.FileUtilities;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.io.IOException;
import java.io.*;
import java.util.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class cucumber_report {


  @Test
  void testParallel() {
    Results results = Runner.path("classpath:test").parallel(5);
    //.outputCucumber.json(value:true);
    generateReport(results.getReportDir());
    assertEquals(results.getFailCount(),results.getErrorMessages());
  }

  public static void generateReport(String karateOutputPath) {
		 /*   //Collection<File> jsonFiles = FileUtilities.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration();
        ReportBuilder reportBuilder = new ReportBuilder();
        reportBuilder.generateReports();*/
    }
  
  }