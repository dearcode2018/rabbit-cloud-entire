@ rem ----- 信息 -----
@ rem @filename StartRabbitCloud.bat
@ rem @version 1.0
@ rem @description 启动云兔
@ rem @author qye.zheng

@ rem @warning 为了防止中文环境乱码，保存文件的时候，应该保存为ANSI编码格式.
@ rem ################################################################################


@ rem 标题
@ title 启动云兔
@ rem ########## begin  ##########



@ rem 关闭显示命令，使所有命令执行前不显示
@ rem @ echo off
@ echo off
@ rem 打开命令显示 @ echo on

@ rem ----- 变量声明区
@ rem JVM 参数配置，-Xms最小内存，-Xmx最大内存
set JAVA_OPTS="-Xms1024m -Xmx2048m \
-XX:MetaspaceSize=128m \
-XX:MaxMetaspaceSize=256m \
-Xss768k \
-Xmn1024m \
-XX:+AggressiveOpts \
-XX:+UseBiasedLocking \
-XX:+CMSParallelRemarkEnabled \
-XX:+UseConcMarkSweepGC \
-XX:ParallelGCThreads=2 \
-XX:SurvivorRatio=4 \
-XX:TargetSurvivorRatio=80 \
-verbose:gc \
-XX:+PrintGCDetails \
-XX:+PrintGCDateStamps \
-XX:+PrintHeapAtGC \
-Xloggc:gc.log \
-XX:+HeapDumpOnOutOfMemoryError \
-XX:HeapDumpPath=dump.logs"

set SVC_JAR_NAME="-1.0.0.jar"

@ rem ----- 程序设计区

:: 进入 home 路径所在的磁盘驱动器
%diskDriver%
java -Dserver.port=%SVC_PORT% -Denv=${SVC_ENV% -DES_SERVER=${ES_SERVER% -jar %SVC_JAR_NAME% %PROGRAM_OPTS% 
@ rem pause

@ rem

@ rem
@ rem 输出提示信息

::
:: 1) 
:: 2)
:: 3)
:: 4)
:: 5)
:: 6)
:: 7)
:: 8)
:: 9)
:: 10)

:: 在程序的末尾，可以根据执行的结果(成功或失败) 给出提示信息，成功可以直接执行exit，而失败
:: 可以执行pause，然后可以通过控制台输出信息来调试、定位问题.
:: 可以在程序中设置一个成功或失败的标志-布尔值，来决定最后程序的执行流程.

@ rem echo
@ rem exit
@ rem ########## end of ##########

@ rem 注释说明: @ rem 注释内容  或者 :: 注释内容
@ rem rem 或两个冒号 后面 都可以写注释
