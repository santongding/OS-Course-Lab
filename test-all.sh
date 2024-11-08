#!/usr/bin/bash
set -e

code_path=out/code
lab=Lab0
alernative_dirs="OS-Course-Lab . canvas"
func_import() {
    name=$1
    rm $lab/student-number.txt ; rm $lab/ans.txt || true
   for dir in $alernative_dirs; do 
    cp $code_path/$dir/student-number.txt $lab > /dev/null
    cp $code_path/$dir/ans.txt $lab > /dev/null
    done

}

func_grade() {
    score=$((cd $lab && make clean && make bomb && make grade) | tee /dev/tty | tail -n 2 | head -n 1 | sed -r 's/\x1b\[[0-9;]*m//g')
    score=$(echo $score | sed -E 's/.* ([^ ]+)\/.*/\1/')
    if [[ ! "$score" =~ ^-?[0-9]+$ ]]; then
        score="failed"
        echo "failed on $1" 1>&2
    fi
    echo $score
}

func_unzip() {
    name=$1
    rm -rf $code_path ; mkdir $code_path ; (tar -xzvf out/$name.tar.gz -C $code_path || tar -xvf out/$name.tar.gz -C $code_path) > /dev/null
}

name=522030910135陈元杰_415695_9548060_bomb-lab



func_eval_one_stu() {
    name=$1
    func_unzip $name
    func_import $name
    func_grade $name
}

# ./update-score.py $(echo $name | sed -n 's/^\([0-9]*\).*/\1/p') $(func_eval_one_stu $name)
ids=$(find out -type f -name "*.tar.gz" | sed -n 's/^out\/\([0-9]*\).*/\1/p')
# ids=523021910427
for id in $ids; do
        name=$(find out -type f -name "$id*" | sed -n 's!.*/\([^/.]*\)\..*!\1!p')
        echo "Processing $name"
        ./update-score.py $(echo $name | sed -n 's/^\([0-9]*\).*/\1/p') $(func_eval_one_stu $name)
done