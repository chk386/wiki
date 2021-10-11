#!/bin/bash
echo 'Hello, World!'

PRICE_PER_APPLE=5
echo "The price today is : \$HK $PRICE_PER_APPLE"

MyFistLetters=ABC
echo "The first 10 letters in the alphabet are : ${MyFistLetters}DFKASD"
echo -e "\n\n\n\n"
# 백틱 or $()로 command를 실행할수 있다.
FILELIST=`ls`
FileWithTimeStamp=/tmp/my-dir/file_$(/bin/date +%Y-%m-%d).txt

echo $FILELIST

# arguments
echo $1
echo $#
echo $@
echo -e "\n\n\n\n"

# Array Length
arys=(A B C D E)
echo "length : ${#arys[@]}"
echo "\n\n\n\n"

# String Length
STRING="this is a string"
echo "String Length is ${#STRING}" # length
echo -e "\n\n\n\n"

# indexOf
echo "abcdefg" | awk '{print index($0,"c")}' # 3 
echo -e "\n\n\n\n"

# Substring
TEXT="this is a string"
echo ${TEXT:1:3} #his
echo ${TEXT:4} # is a string
echo -e "\n\n\n\n"

# first의 Johnny를 출력하자
DATARECORD="last=Clifford,first=Johnny Boy,state=CA"
FIRST=`echo $DATARECORD | awk '{print index($0, ",")}'`
CHOP1FIELD=${DATARECORD:FIRST}
END=`echo $CHOP1FIELD | awk '{print index($0, ",")}'`
FIRSTNAME=${CHOP1FIELD:0:END-1}
NAME=${FIRSTNAME:6}
echo $NAME

# 좀더 쉽게 해보자
CUT_FIRSTNAME=`echo $DATARECORD | cut -d"," -f 2`
echo ${CUT_FIRSTNAME:6:${#CUT_FIRSTNAME}}

# 문자열 변경
STRING="to be or not to be"
echo ${STRING[@]/be/eat} # 처음 만나는 문자열만 변경
echo ${STRING//be/eat} # 모든 문자열 변경
echo ${STRING// not/} # 모든 문자열 삭제
echo ${STRING[@]/#to be/AAA} # 첫 문자열 변경
echo ${STRING[@]/%to be/BBB} # 끝 문자열 변경
echo ${STRING[@]/%be/be on $(date +%Y-%m-%d)} # 쉘 커맨드의 output으로 변경

# 문자열 연습문제
BUFFETT="Life is like a snowball. The important thing is finding wet snow and a really long hill."
EXPECTED="Life is like a football. The important thing is getting wet"

REPLACED=${BUFFETT/snow/foot}
DELETED=${REPLACED/snow/}
REPLACED2=${DELETED/finding/getting}
START=`echo $REPLACED2 | awk '{print index($0, "wet")}'`
ISAY=${REPLACED2:0:START+3}

echo $ISAY

# loop 연습문제
## In this exercise, you will need to loop through and print out all even numbers from the numbers list in the same order they are received. Don't print any numbers that come after 237 in the sequence.

NUMBERS=(951 402 984 651 360 69 408 319 601 485 980 507 725 547 544 615 83 165 141 501 263 617 865 575 219 390 237 412 566 826 248 866 950 626 949 687 217 815 67 104 58 512 24 892 894 767 553 81 379 843 831 445 742 717 958 609 842 451 688 753 854 685 93 857 440 380 126 721 328 753 470 743 527)

for N in ${NUMBERS[@]}; 
do
  if [ $N -eq 237 ]; then
    break;
  fi
  if [[ $(($N % 2)) == 0 ]]; then
    echo $N
  fi
done

echo -e "\n\n\n\n"


# Array Comparison 연습문제
## In this exercise, you will need to compare three list of arrays and write the common elements of all the three arrays:

a=(3 5 8 10 6)
b=(6 5 4 12)
c=(14 7 5 7) 
# result is the common element 5.

for x in ${a[@]};
do
  matched=false
  
  for y in ${b[@]};
  do
    if [ $x -eq $y ]; then
      matched=true
      break
    fi
  done
   
  if $matched; then
    matched=false

    for z in ${c[@]};
    do
      if [ $x -eq $z ]; then
        matched=true
        break
      fi
    done
  fi

  if $matched; then
    echo ${x}
  fi
done

echo -e "\n\n\n\n"

# Functions
function funcA {
  echo $1 $2 $3 # arguments
  echo "파라미터를 정의 하지 않는다."
  echo "$(($1 + $2))"
}

funcA 1 2 3 # call function

echo -e "\n\n\n\n"
# Functions 연습문제
## In this exercise, you will need to write a function called ENGLISH_CALC which can process sentences such as:

## '3 plus 5', '5 minus 1' or '4 times 6' and print the results as: '3 + 5 = 8', '5 - 1 = 4' or '4 * 6 = 24' respectively.
function ENGLISH_CALC() {
  case $2 in
    "plus") echo "$1 + $3 = $(($1 + $3))" ;;
    "minus") echo "$1 - $3 = $(($1 - $3))" ;;
    "times") echo "$1 * $3 = $(($1 * $3))" ;;
  esac
}

## testing code
ENGLISH_CALC 3 plus 5
ENGLISH_CALC 5 minus 1
ENGLISH_CALC 4 times 6











































