/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpddltrafficsim;

import com.hstairs.ppmajal.conditions.AndCond;
import com.hstairs.ppmajal.conditions.PDDLObject;
import com.hstairs.ppmajal.conditions.Predicate;
import com.hstairs.ppmajal.domain.PddlDomain;
import com.hstairs.ppmajal.domain.SchemaParameters;
import com.hstairs.ppmajal.expressions.NumFluent;
import com.hstairs.ppmajal.expressions.PDDLNumber;
import com.hstairs.ppmajal.pddl.heuristics.BlindHeuristic;
import com.hstairs.ppmajal.problem.EPddlProblem;
import com.hstairs.ppmajal.problem.PDDLSearchEngine;
import com.hstairs.ppmajal.problem.PDDLState;
import com.hstairs.ppmajal.transition.TransitionGround;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.lang3.tuple.Pair;

/**
 *
 * @author enrico
 */
public class Jpddlsim {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        final Options options = new Options();
        options.addRequiredOption("d","domain", true, "PDDL+ Domain file");
        options.addRequiredOption("p","problem", true, "PDDL+ Problem file");
        options.addRequiredOption("sp","solution-plan", true, "PDDL+ Plan file");
        options.addOption("ptt","print-traffic-trace", false, "Print Traffic Trace");
        options.addOption("delta","delta-simulation", true, "Set custom discretisation delta (default = 1.0)");
        
        final CommandLineParser parser = new DefaultParser();
        try {
            final CommandLine cmd = parser.parse(options, args);
            final String d = cmd.getOptionValue("d");
            final String p = cmd.getOptionValue("p");
            final String plan = cmd.getOptionValue("sp");
            String delta = cmd.getOptionValue("delta");
            
            if (delta == null){
                delta = "1.0";
            }
            boolean ptt = cmd.hasOption("ptt");
            final Pair<PddlDomain, EPddlProblem> res = parseDomainProblem(d, p, delta, new PrintStream(new OutputStream() {public void write(int b) {}}));
            final EPddlProblem problem = res.getValue();
            final List<Pair<BigDecimal, TransitionGround>> timedPlan = getPlan(problem,plan);
            long start = System.currentTimeMillis();
            final PDDLSearchEngine searchEngine = new PDDLSearchEngine(new BlindHeuristic(problem), problem);
            final List<PDDLState> simulatedTrace = searchEngine.simulate(timedPlan,delta, (PDDLState) problem.getInit(),problem,ptt);
            final Set<NumFluent> actualFluents = getOccupancyFluents(problem.getActualFluents());
            int i = 0;
            if (ptt) {
                for (final var s : simulatedTrace) {
                    for (final var v : actualFluents) {
                        System.out.print(s.time+" ");
                        for (var v1 : ((NumFluent) v).getTerms()) {
                            if (v1 instanceof PDDLObject){
                                System.out.print(((PDDLObject) v1).getName()+" ");
                            }
                        }
                        System.out.println(s.fluentValue((NumFluent) v));
                    }
                    i++;
                }
            }
            System.out.println("Simulation Time:"+(System.currentTimeMillis()-start)/1000.0);
            System.out.println("\n =============================================== \n");
            System.out.println("Goal Reached: "+problem.getGoals().isSatisfied(simulatedTrace.get(simulatedTrace.size()-1)));
            
        } catch (ParseException ex) {
            HelpFormatter formatter = new HelpFormatter();
            formatter.printHelp("jpddltrafficsim", options);
        } 

    }
    
    static public Pair<PddlDomain, EPddlProblem> parseDomainProblem(String domainFile, String problemFile, String delta, PrintStream out) {
        try {
            final PddlDomain localDomain = new PddlDomain(domainFile);
            addRelation(localDomain);
            final EPddlProblem localProblem = new EPddlProblem(problemFile, localDomain.getConstants(), localDomain.types, localDomain, out, "internal", false);
            if (!localDomain.getProcessesSchema().isEmpty()) {
                localProblem.setDeltaTimeVariable(delta);
            }
            addRelationInit(localProblem);
            localProblem.groundingSimplication(false, false);
            return Pair.of(localDomain, localProblem);
        } catch (Exception ex) {
            Logger.getLogger(Jpddlsim.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private static List<Pair<BigDecimal,TransitionGround>> getPlan(EPddlProblem problem, String plan) {
        Path path = Paths.get(plan);
        final ArrayList<Pair<BigDecimal,TransitionGround>> pddlPlan = new ArrayList();
        try {
            final List<String> readAllLines = Files.readAllLines(path,StandardCharsets.UTF_8);
            for (var v: readAllLines){
                String actionName = v.split(":")[1];
                actionName = actionName.trim();
                final BigDecimal time = new BigDecimal(v.split(":")[0]);
                TransitionGround pddlAction = problem.getActionsByName(actionName);
                if (pddlAction == null && !actionName.equals("@PlanEND")){
                    throw new RuntimeException("Action "+actionName+" is either not present in the domain or not applicable at time "+time);
                }
                pddlPlan.add(Pair.of(time,pddlAction));
            }
        } catch (IOException ex) {
            Logger.getLogger(Jpddlsim.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pddlPlan;
    }

    private static Set<NumFluent> getOccupancyFluents(Set actualFluents) {
        Set<NumFluent> res = new HashSet();
        for (var v : actualFluents) {
            if (v instanceof NumFluent) {
                if (((NumFluent) v).getName().contains("counter")) {
                    res.add((NumFluent) v);
                }
            }
        }
        return res;

    }

    private static void addRelation(PddlDomain localDomain) {

        for (var p: localDomain.getProcessesSchema()) {
            if (p.getName().equals("flowrun_green")) {
                AndCond preconditions = (AndCond) p.getPreconditions();
                SchemaParameters parameters = p.getParameters();
                preconditions.addConditions(Predicate.createPredicate("relation", parameters));
            }
        }
        
    }

    private static void addRelationInit(EPddlProblem localProblem) {
        HashMap<NumFluent, PDDLNumber> initNumFluentsValues = localProblem.getInitNumFluentsValues();
        HashMap<Predicate, Boolean> initBoolFluentsValues = localProblem.getInitBoolFluentsValues();
        for (var v: initNumFluentsValues.entrySet()){
            if (v.getKey().getName().equals("turnrate")){
                initBoolFluentsValues.put(Predicate.createPredicate("relation",v.getKey().getTerms()),true);
            }
        }
    }
    
}
