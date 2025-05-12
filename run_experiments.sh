#!/bin/bash

echo "Running Experiments"

VERSION="1.1.16-fairness-rev"
FAIR_MODE="2"
FAIR_METRIC="$1"
MINING_TARGET="afg"
TIME_BUDGET="3600"
KB_NAME="kb_reb_nodd"
ITERATIONS="4"

cp /home/HAMLET4FAIRNESS-eval/resources/hamlet-1.1.16-fairness-rev-all.jar ./hamlet-1.1.16-fairness-rev-all.jar

python run_hamlet.py --fair-mode "$FAIR_MODE" --workspace /test/hamlet/ika --fair_metric "$FAIR_METRIC" --mining_target "$MINING_TARGET" --batch_size 999999 --time_budget $(expr $TIME_BUDGET / $ITERATIONS) --version $VERSION --iterations $ITERATIONS --kb /home/HAMLET4FAIRNESS-eval/resources/$KB_NAME.txt
python run_hamlet.py --fair-mode "$FAIR_MODE" --workspace /test/hamlet/pkb_ika --fair_metric "$FAIR_METRIC" --mining_target "$MINING_TARGET" --batch_size 999999 --time_budget $(expr $TIME_BUDGET / $ITERATIONS) --version $VERSION --iterations $ITERATIONS --kb /home/HAMLET4FAIRNESS-eval/resources/p$KB_NAME.txt
python run_hamlet.py --fair-mode "$FAIR_MODE" --workspace /test/hamlet/baseline --fair_metric "$FAIR_METRIC" --mining_target "$MINING_TARGET" --batch_size 999999 --time_budget $TIME_BUDGET --version $VERSION --iterations 1 --kb /home/HAMLET4FAIRNESS-eval/resources/$KB_NAME.txt
python run_hamlet.py --fair-mode "$FAIR_MODE" --workspace /test/hamlet/pkb --fair_metric "$FAIR_METRIC" --mining_target "$MINING_TARGET" --batch_size 999999 --time_budget $TIME_BUDGET --version $VERSION --iterations 1 --kb /home/HAMLET4FAIRNESS-eval/resources/p$KB_NAME.txt

cp -r /test/* /results/