#Need to get this to run tests based on the two input files:
#original-table-sample.txt
#reversed-table-sample.txt


returnStatus=0

# Only show colours on local "Git Bash" terminal
passFormat="if [ $TERM = "xterm" ]; then tput sgr0 && tput setaf 2; fi"
failFormat="if [ $TERM = "xterm" ]; then tput sgr0 && tput setaf 1; fi"
normalFormat="if [ $TERM = "xterm" ]; then tput sgr0; fi"

# If not on Linux set output to .exe
unameValue="$(uname -s)"
echo "Testing OS Platform: $unameValue"
fileExtension=".exe"
if [  $unameValue = "Linux" ] || [  $unameValue = "Darwin" ]; then
    fileExtension=".out"
fi

echo "Running tests..."
echo

output=$(./a$fileExtension)

if [ $? -eq 0 ] ; then
  eval "$passFormat"
  echo "Pass: Program exited zero"
else
  eval "$failFormat"
  echo "Fail: Program did not exit zero"
  returnStatus=1
fi

# Need to read in original file line by line and check it
testOneStatus=0
badLine=""
while read line
do
  if grep -q "$line" <<< "$output"; then
    continue
  else
    testOneStatus=1
    badLine="$line"
    break
  fi
done < original-table-sample.txt

if [ $testOneStatus -eq 0 ] ; then
  eval "$passFormat"
  echo "Output Test #1 - Pass: Normal Output is correct"
else
  eval "$failFormat"
  echo "Output Test #1 - Fail: Normal Output Missing Expected line: `echo $badLine`"
  returnStatus=1
fi

# Need to read in reversed file line by line and check it
testTwoStatus=0
badLine=""
while read line
do
  if grep -q "$line" <<< "$output"; then
    continue
  else
    testTwoStatus=1
    badLine="$line"
    break
  fi
done < reversed-table-sample.txt

# Use contains so we ignore additional output or input prompts
if [ $testTwoStatus -eq 0 ] ; then
  eval "$passFormat"
  echo "Output Test #2 - Pass: Reversed Output is correct"
else
  eval "$failFormat"
  echo "Output Test #2 - Fail: Reversed Output Missing Expected line: `echo $badLine`"
  returnStatus=1
fi

echo
if [ $returnStatus -eq 0 ] ; then
    eval "$passFormat"
    echo "All tests passed."
else
    eval "$failFormat"
    echo "One or more tests failed."
fi

eval "$normalFormat"

echo
exit $returnStatus