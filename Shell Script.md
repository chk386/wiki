[#](#) Shell Script
참고 : [learnshell](https://www.learnshell.org/)
## HELLO
### 쉘이란?
unix, linux운영체제에서 쓰이는 Interpret방식으로 동작하는 컴파일 되지 않은 프로그램이다. 쉘 스크립트(.sh)와prompt에서 다이렉트로 실행할수 있으며 한 라인을 읽어 해석하고 실행하는 과정을 반족하도록 만들어진 프로그래밍 언어이다.

> 텍스트 형식으로 저장되는 프로그램으로서 한줄씩 순차적으로 읽어 실행되도록 작성된 프로그램이다.

### Shell 종류
Bash, sh, csh, tcdh등이 있으며 약간의 차이가 있다.
Bash Shell(Bourne Again Shell)이 일반적으로 많이 쓰이고 있으며 bash위주로 설명한다.

### #!/bin/bash
쉡스크립트의 첫라인은 "sha-bang" (#!)로 시작하며 쉘 인터프리터가 위치한 full path로 나타낸다. 앞의 path는 os에게 표시된 인터프리터에게 공급할 commands의 세트라는것을 알려준다.

텍스트 앞의 #은 주석을 간주된다.

## Variables
Shell 변수는 값이 할당될때 만들어진다. 변수는 number, character, string of characters를 포함할수 있다. 변수명은 대소문자를 구분하며 문자조합과 _로 구성할수 있다. 값 할당은 "="를 사용하는것으로 수행된다. 변수를 초기화 할때 = 부호 양쪽 사이드에 공백은 허용하지 않는다. 

```bash
PRICE_PER_APPLE=5
MyFirstLetters=ABC
greeting='Hello        world!'
```

backslash "\"는 특수문자를 escape를 위해 사용한다.                         
```bash
PRICE_PER_APPLE=5
echo "The pricec of an Apple today is: \$HK $PRICE_PER_APPLE"
```

${}로 변수명을 감싸는것은 모호함을 피하기 위해 사용된다.
```bash
MyFistLetters=ABC
echo "The first 10 letters in the alphabet are : ${MyFistLetters}DFKASD"
```

변수는 command 결과값을 할당 할 수 있고 이것이 substitution이다. substitution은 back-ticks라고 알려진 `` 또는 $()로 command를 캡슐화하여 수행할 수 있다.

```bash
FILELIST=`ls`
FileWithTimeStamp=/tmp/my-dir/file_$(/bin/date +%Y-%m-%d).txt

echo $FILELIST
```

## Passing Arguments to the Script
쉘 파일명 뒤로 공백으로 구분된 인자를 작성하여 스크립트로 전달한다.
예 : `/run.sh A B C`

아래는 6개의 인자를 나타내며 순서대로 $1 ~ $6으로 사용할수 있다.
`$#`는 인자 갯수의 합(6)을 의미하고 `$@`는 공백으로 구분된 문자열을 의미한다. 
```bash
./bin/my_shopping.sh apple 5 banana 8 "Fruit Basket" 15

echo $6
```

## Arrays
배열은 ()안에 공백 구분자 할당에 의해 초기화 된다.

```bash
my_array=(apple banana "Fruit Basket" orange)
new_array[2]=apricot
```

배열에서 엘리먼트의 총갯수는 ${#arrayName[@]}으로 참조된다.
```bash
# ARRAY_LENGTH=${arrayName[@]}
my_array=(apple banana "Fruit Basket" orange)
echo  ${#my_array[@]}                   # 4
echo ${#my_array[0]} # apple
my_array[4]="carrot" # 4번째 요소 변경
```

## Basic Operator
`+ - * / % **(exponentiation, 지수)`

## Basic String Operations

### String Length
```bash
STRING="this is a string"
echo ${#STRING} # length
```

### IndexOf
```bash
echo "abcdefg" | awk '{print index($0,"c")}' # indexOf, result = 3 


### Substring Extranction
```bash
TEXT="this is a string"
echo ${TEXT:1:3} #h is
echo ${TEXT:4} # is a string
```

### Simple data extraction example
```bash
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
```

### Substring Replacement
```bash
STRING="to be or not to be"
echo ${STRING[@]/be/eat} # 첫 문자열만 변경
echo ${STRING//be/eat} # 모든 문자열 변경
echo ${STRING// not/} # 모든 문자열 삭제
echo ${STRING[@]/#to be/AAA} # 첫 문자열 변경
echo ${STRING[@]/%to be/BBB} # 끝 문자열 변경
echo ${STRING[@]/%be/be on $(date +%Y-%m-%d)} # 쉘 커맨드의 output으로 변경
```

## Decision Making
```bash
if [ expression ]; then
  echo hi
elif [ expression ]; then
  echo hello
else
  echo world
fi
```

### Types of numeric comparisons
| comparison | Evaluated to true when |
|------------|------------------------|
| $a -lt $b  | $a < $b                |
| $a -lt $b  | $a < $b                |
| $a -gt $b  | $a > $b                |
| $a -le $b  | $a <= $b               |
| $a -ge $b  | $a >= $b               |
| $a -eq $b  | $a is equal to $b      |
| $a -ne $b  | $a is not equal to $b  |

### Types of string comparisons
| comparison   | Evaluated to true when  |
|--------------|-------------------------|
| "$a" = "$b"  | $a is the same as $b    |
| "$a" == "$b" | $a is the same as $b    |
| "$a" != "$b" | $a is different from $b |
| -z "$a"      | $a is empty             |

- 주의1 : = 양옆 공백은 필수
- 주의2 : *와 같은 특수문자의 쉘 확장을 피하기 위해 문자열 변수를 ""로 감싸여 사용하라

### Logical combinations
```bash
if [[ $VAR_A[0] -eq 1 && ($VAR_B = "bee" || $VAR_T = "tee") ]] ; then
    command...
fi
```

### case structure
```bash
case "$variable" in
    "$condition1" )
        command...
    ;;
    "$condition2" )
        command...
    ;;
esac
```
GitGutterLineHighlightsEnable
## simple case bash structure
```bash
mycase=1
case $mycase in
    1) echo "You selected bash";;
    2) echo "You selected perl";;
    3) echo "You selected phyton";;
    4) echo "You selected c++";;
    5) exit
esac
```











































