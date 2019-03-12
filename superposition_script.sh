COUNT=5
X=1
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

printf "${GREEN}==================\n%s\n==================${NC}\n" "BIG SUPERPOSITION"
while [ $X -le $COUNT ]
do
    printf "${YELLOW}TRY %d${NC}\n" $X
    ./generator --big-superposition | ./lem-in > test.txt
    printf "%-12s" "ANSWER:"
    grep -m 1 "#Here is the number of lines required:" test.txt | cut -d ":" -f 2 | awk '{$1=$1};1'
    printf "%-12s" "OUR ANSWER:"
    grep "^L" test.txt | wc -l | awk '{$1=$1};1'
    start=$(date +%s)
    ./lem-in < test.txt > /dev/null
    end=$(date +%s)
    runtime=$((end-start))
    printf "%-12s" "RUNTIME:"
    echo $runtime
    X=$(( $X + 1 ))
done

rm test.txt
