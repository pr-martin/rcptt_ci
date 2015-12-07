#! /bin/sh
# Set properties below
runnerPath=/usr/lfs/ssd_v0/opt/rcptt.runner-2.0.1/eclipse
autPath=./workspace/rcptt_ci/osate2-core/org.osate.build.product/target/products/osate2/linux/gtk/x86_64
project=./workspace/rcptt_ci/regressionSuite/rcpttSuite

# properties below configure all intermediate and result files
# to be put in "results" folder next to a project folder. If
# that's ok, you can leave them as is

testResults=$project/../results
runnerWorkspace=$testResults/runner-workspace
autWorkspace=$testResults/aut-workspace-
autOut=$testResults/aut-out-
junitReport=$testResults/results.xml
htmlReport=$testResults/results.html

rm -rf $testResults
mkdir $testResults

java -jar $runnerPath/plugins/org.eclipse.equinox.launcher_1.3.100.v20150511-1540.jar \
     -application org.eclipse.rcptt.runner.headless \
     -data $runnerWorkspace \
     -aut $autPath \
     -autWsPrefix $autWorkspace \
     -autConsolePrefix $autOut \
     -htmlReport $htmlReport \
     -junitReport $junitReport \
     -import $project
