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




















































