# Shell Script
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

