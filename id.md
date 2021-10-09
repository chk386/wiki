## core
### unused
PriorityEnum, RedisKey, PriorityEnum 등 안쓰는것들이 많이 보여요

### NotFoundDispatcherHandler
용도에 안맞는거 같아요.
AbstractWebExceptionHandler가 낫지 않나요? 혹시 404일때 응답이 달라지나요?

### Topic-Name
공용 카프카라 BACKOFFICE-NOTIFICATION-REQUEST 토픽명이 중복될수 있을것 같아요(나~~~중에)
모듈(또는 프로젝트)단위로 prefix를 같은 룰을 정해보는것도 좋을것 같아요.

### ide warning
노란색으로 뜨는게 많군요.

### package
exceptions들과 enums들은 패키지 만들어서 그안으로 넣는게 좋지 않나요? 
extention은 패키지에 모아져 있네요.
요새 개발을 안해서 이게 룰인건지 모르겠네요 ^^;

com.nhncommerce.servicedev.application.ssl.nhncommerce 패키지명이 이상해요..
아이디어 내보시죠.

### zip
java내장 압축 api는 blocking이라 느려요.
google에서 c++로 만든 snappy의 java port를 사용하시죠.
[snappy-java](https://github.com/xerial/snappy-java)

압축률보다는 속도죠. (200~400MB/sec)
내부적으로 jni로 c++모듈을 호출해서 압축하기 때문에 겁나 빠릅니다.
검색해보니 ubuntu에서도 잘 동작합니다. [OSInfo](https://github.com/xerial/snappy-java/blob/master/src/main/java/org/xerial/snappy/OSInfo.java)
얼마나 쉽습니까!
```java
String input = "Hello snappy-java! Snappy-java is a JNI-based wrapper of "
     + "Snappy, a fast compresser/decompresser.";
byte[] compressed = Snappy.compress(input.getBytes("UTF-8"));
byte[] uncompressed = Snappy.uncompress(compressed);

String result = new String(uncompressed, "UTF-8");
System.out.println(result);
```

### SslFileService
개인적으로는 kotlin way로 코드를 수정했으면 좋겠어요.
[Writing tot a File in Kotlin](https://www.baeldung.com/kotlin/write-file)
[File extentions](FileReadWrite.kt)

```kotlin
ZipMakerUtils.archiveZip(files = targetFilePath.listFiles().toList(), destination = File(zipFileFullPathString))
```
targetFilePath.listFiles() 이게 null일수 있어서 (물론 안쪽에서 .forEach라 큰문제는 없는데) 좀 별로 에요. 경고뜸..
제 생각엔 functional하게 짯으면 좋겠어요.
```kotlin
// 대충 생각해봄
targetFilePath.listFiles()
  .flatMap {`압축을 하고 리턴을 zipFileFullPathString로 하는 Function`}
  .run { 'sslUpload' }
```
targetFilePath.listFiles()부분이 monad라 비어 있으면 아무것도 하지 않기 때문에 안전하고 sideEffects가 발생하지 않습니다.


```kotlin
targetFileNumberPath.exists().takeIf { it }?.let {
  targetFileNumberPath.deleteRecursively()
} 

targetZipNumberPath.exists().takeIf { it }?.let {
  targetZipNumberPath.deleteRecursively()
}

// 한줄로하시죠 ㅋ
arrayOf(targetFileNumberPath, targetZipNumberPath).forEach {
  it.exists().takeIf { file -> file }?.let {
    targetFileNumberPath.deleteRecursively()
  }
}
```










