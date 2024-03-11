import sys
import os
import re
import time

CONFIGURATIONS = ['random', 'sipp', 'sippv2']

SEARCHES = ['-planner sat-hmrp', 
            '-planner sat-hadd',
            '-s gbfs -h hmax',
            # '-s wa_star_4 -h hmax',
            '-planner opt-hmax',
            '-s WAStar -h hmrp',
            '-s WAStar -h hadd']
# a star con hmrp, hadd

# SEARCHES = ['-planner opt-hmax']

FOLDERS_SEARCHES = {'-planner sat-hmrp': "sat-hmrp", 
                    '-planner sat-hadd': "sat-hadd",
                    '-s gbfs -h hmax': "gbfs-hmax",
                    '-s wa_star_4 -h hmax': "wa_star_4-hmax",
                    '-planner opt-hmax': "opt-hmax",
                    '-s WAStar -h hmrp': "wastar-hmrp",
                    '-s WAStar -h hadd': "wastar-hadd"}

MODELS = ['Fix Limit 2',
          'Fix Limit 2 without conditional effects',
          'Fix Limit 4',
          'Fix Limit 4 without conditional effects',
          'Fix Limit 6',
          'Fix Limit 6 without conditional effects',
          'No Limit',
          'No Limit without assign',
          'Variable Limit',
          'Variable Limit without assign',
          'Variable Limit without conditional effects']

LINKS_MODELS = {'Fix Limit 2':{
                    "domain": "domain-cyclelimitfisso.pddl",
                    "folder": "fixlen2"
                },
                'Fix Limit 2 without conditional effects':{
                    "domain": "domain-cyclelimitfisso-noeff.pddl",
                    "folder": "fixlen2"
                },
                'Fix Limit 4':{
                    "domain": "domain-cyclelimitfisso.pddl",
                    "folder": "fixlen4"
                },
                'Fix Limit 4 without conditional effects':{
                    "domain": "domain-cyclelimitfisso-noeff.pddl",
                    "folder": "fixlen4"
                },
                'Fix Limit 6':{
                    "domain": "domain-cyclelimitfisso.pddl",
                    "folder": "fixlen6"
                },
                'Fix Limit 6 without conditional effects':{
                    "domain": "domain-cyclelimitfisso-noeff.pddl",
                    "folder": "fixlen6"
                },
                'No Limit':{
                    "domain": "domain.pddl",
                    "folder": "nolen"
                },
                'No Limit without assign':{
                    "domain": "domain-nolimit-noassign.pddl",
                    "folder": "nolen"
                },
                'Variable Limit':{
                    "domain": "domain-varcyclelimit.pddl",
                    "folder": "varlen"
                },
                'Variable Limit without assign':{
                    "domain": "domain-varcycle-noassign.pddl",
                    "folder": "varlen_noassign"
                },
                'Variable Limit without conditional effects':{
                    "domain": "domain-varcycle-noeff.pddl",
                    "folder": "varlen"
                },
                'Variable Limit without assign and conditional effects':{
                    "domain": "domain-varcycle-noassign-noeff.pddl",
                    "folder": "varlen_noassign"
                }}

INSTANCES = ["26morn", "26eve", "26noon", "30morn", "30eve", "30noon"]

confgreentime = {}
activeconf = {}
interlimit = {}
next_stage = {}


def readConf(problem_path):
    global confgreentime
    global activeconf
    global interlimit
    global next_stage

    confgreentime = {}
    confgreentime['wrac1'] = {}
    confgreentime['wrbc1'] = {}
    confgreentime['wrcc1'] = {}
    confgreentime['wrdc1'] = {}
    confgreentime['wrec1'] = {}
    confgreentime['wrfc1'] = {}

    activeconf = {}
    activeconf['wrac1'] = {}
    activeconf['wrbc1'] = {}
    activeconf['wrcc1'] = {}
    activeconf['wrdc1'] = {}
    activeconf['wrec1'] = {}
    activeconf['wrfc1'] = {}

    interlimit = {}
    interlimit['wrac1'] = {}
    interlimit['wrbc1'] = {}
    interlimit['wrcc1'] = {}
    interlimit['wrdc1'] = {}
    interlimit['wrec1'] = {}
    interlimit['wrfc1'] = {}

    next_stage = {}


    pattern = r"\(= \(confgreentime (\S+) (\S+)\) (\d+\.*\d*)\)"

    with open(problem_path, 'r') as file:
        for line in file:
            matches = re.findall(pattern, line)
            for match in matches:
                stage, conf, val = match
                junction = stage.split("_")[0]

                if stage not in confgreentime[junction]:
                    confgreentime[junction][stage] = {}
                
                confgreentime[junction][stage][conf] = int(val)
    
    pattern = r"\(next (\S+) (\S+)\)"
    with open(problem_path, 'r') as file:
        for line in file:
            matches = re.findall(pattern, line)
            for match in matches:
                prevstage, nextstage = match
                next_stage[prevstage] = nextstage
    
    pattern = r"\(= \(interlimit (\S+) \)(\d+\.*\d*)\)"

    with open(problem_path, 'r') as file:
        for line in file:
            matches = re.findall(pattern, line)
            for match in matches:
                stage, val = match
                junction = stage.split("_")[0]
                
                interlimit[junction][stage] = val
    
    pattern = r"\(= \(interlimit (\S+)\) (\d+\.*\d*)\)"

    with open(problem_path, 'r') as file:
        for line in file:
            matches = re.findall(pattern, line)
            for match in matches:
                stage, val = match
                junction = stage.split("_")[0]
                
                interlimit[junction][stage] = val
    
    pattern = r"\(activeconf (\S+) (\S+)\)"

    with open(problem_path, 'r') as file:
        for line in file:
            matches = re.findall(pattern, line)
            for match in matches:
                junction, conf = match
                
                activeconf[junction] = conf

def writeValidationProblem(problem_validation_path):
    global interlimit
    global next_stage
    global confgreentime
    global activeconf

    for junction in interlimit:
        for stage in interlimit[junction]:
            pattern = r"\(= \(defaultgreentime {}\) (\d+\.*\d*)\)".format(stage)
            replacement = r"(= (defaultgreentime {}) {})".format(stage, confgreentime[junction][stage][activeconf[junction]])

            with open(problem_validation_path, 'r') as file:
                lines = file.readlines()

            with open(problem_validation_path, 'w') as file:
                for line in lines:
                    modified_line = re.sub(pattern, replacement, line)
                    file.write(modified_line)


            pattern = r"\(= \(interlimit {}\) (\d+\.*\d*)\)".format(stage)
            replacement = r"(= (interlimit {}) {})".format(stage, interlimit[junction][stage])

            with open(problem_validation_path, 'r') as file:
                lines = file.readlines()

            with open(problem_validation_path, 'w') as file:
                for line in lines:
                    modified_line = re.sub(pattern, replacement, line)
                    file.write(modified_line)

            pattern = r"\(next {} (\S+)\)".format(stage)
            replacement = r"(next {} {})".format(stage, next_stage[stage])

            with open(problem_validation_path, 'r') as file:
                lines = file.readlines()

            with open(problem_validation_path, 'w') as file:
                for line in lines:
                    modified_line = re.sub(pattern, replacement, line)
                    file.write(modified_line)

def convertPlan(planfile, convertedPlanfile):

    with open(planfile, 'r') as file:
        lines = file.readlines()

    convertedPlan = []
   
    # read the plan
    for line in lines:
        if "changeConfiguration" in line:
            pattern = r'([\d.]+):\s+\(changeConfiguration\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)(?:\s+(\S+))?\)'

            # Use the re.search() method to find the matches
            match = re.search(pattern, line)

            if match:
                timestamp = float(match.group(1))
                stage = match.group(2)
                junction = match.group(3)
                prevconf = match.group(4)
                nextconf = match.group(5)

                for stage in confgreentime[junction]:
                    if confgreentime[junction][stage][prevconf] != confgreentime[junction][stage][nextconf]:
                        num_steps = abs(confgreentime[junction][stage][prevconf] - confgreentime[junction][stage][nextconf])

                        if num_steps > 0:
                            action = "extendStage"
                            if confgreentime[junction][stage][prevconf] > confgreentime[junction][stage][nextconf]:
                                action = "reduceStage"
                            for i in range(num_steps):
                                line = f"{timestamp}: ({action} {stage} {junction})"
                                convertedPlan.append(line)
            else:
                print("No match:"+line)

        elif "@PlanEND" in line:
            convertedPlan.append(line)       
    
    with open(convertedPlanfile, 'w') as file:
        for i,line in enumerate(convertedPlan):
            if i < len(convertedPlan) -1:
                file.write(line+"\n")
            else:
                file.write(line)

    print("The file was converted successfully!")

def validatePlan(fileplan, outputfile, validateproblem):
    fileplan = re.sub(" ", "\ ", fileplan)
    outputfile = re.sub(" ", "\ ", outputfile)
    os.system(f"java -cp .:lib/* Jpddlsim.java -d validate/domain/domain-cycleTime.pddl -p {validateproblem} -sp {fileplan} -ptt 2>&1 | tee {outputfile}")
    print("Validation done!")
    time.sleep(1)


instances_path = "minsky/Instancesv2"
results_folder = "minsky/Resultsv4"
converted_results_folder = "minsky/ConvertedResults"
validate_problems_folder = "validate/problem"

def main():
    num = 0
    for instance in INSTANCES:
        instance_path = os.path.join(results_folder, instance)
        for problem in os.listdir(instance_path):
            problem_path = os.path.join(instance_path, problem) 
            for methodology in os.listdir(problem_path):
                methodology_path = os.path.join(problem_path, methodology)
                if methodology == "M_CONF":
                    for model in MODELS:
                        model_path = os.path.join(methodology_path, model)
                        for search in os.listdir(model_path):
                            search_path = os.path.join(model_path, search)
                            for configuration in CONFIGURATIONS:
                                configuration_path = os.path.join(search_path, configuration)
                                for timestamp in os.listdir(configuration_path):
                                    timestamp_path = os.path.join(configuration_path, timestamp)
                                    if os.path.isdir(timestamp_path):
                                        for log in os.listdir(timestamp_path):
                                            if log.startswith("plan") and log.endswith(".txt"):
                                                plan_path = os.path.join(timestamp_path, log)
                                                problem_log_path = get_problem_path(configuration, model, instance, log)

                                                converted_folder_path = timestamp_path.replace(results_folder, converted_results_folder)
                                                if not os.path.exists(converted_folder_path):
                                                    os.makedirs(converted_folder_path, exist_ok=True)

                                                converted_plan_path = plan_path.replace(results_folder, converted_results_folder)
                                                sim_converted_plan_path = converted_plan_path.replace("plan_", "output_")

                                                validate_problem_path = os.path.join(validate_problems_folder, instance, "problem-swapTime-validate-"+problem+".pddl")

                                                # legge le configurazioni di verde dal problema
                                                readConf(problem_log_path)

                                                # sistema il problema di validazione assegnando ad esempio il defaultgreentime di partenza
                                                # con la configurazione di verde di default del problema originale
                                                writeValidationProblem(validate_problem_path)

                                                # conversione del piano in ExRe
                                                convertPlan(plan_path, converted_plan_path)

                                                # validazione
                                                validatePlan(converted_plan_path, sim_converted_plan_path, validate_problem_path)

                                                # num += 1
                                                # if num == 300:
                                                #     sys.exit()

                                                

def get_problem_path(configuration, model, instance, log):
    model_folder = LINKS_MODELS[model]["folder"]
    log_name = (str(log).split(".")[0]).split("_")[1]

    return os.path.join(instances_path, configuration, model_folder, instance, f"{log_name}[count=350].pddl")

if __name__ == "__main__":
    main()