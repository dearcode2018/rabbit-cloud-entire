@ rem ----- ��Ϣ -----
@ rem @filename StartRabbitCloud.bat
@ rem @version 1.0
@ rem @description ��������
@ rem @author qye.zheng

@ rem @warning Ϊ�˷�ֹ���Ļ������룬�����ļ���ʱ��Ӧ�ñ���ΪANSI�����ʽ.
@ rem ################################################################################


@ rem ����
@ title ��������
@ rem ########## begin  ##########



@ rem �ر���ʾ���ʹ��������ִ��ǰ����ʾ
@ rem @ echo off
@ echo off
@ rem ��������ʾ @ echo on

@ rem ----- ����������
@ rem JVM �������ã�-Xms��С�ڴ棬-Xmx����ڴ�
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

@ rem ----- ���������

:: ���� home ·�����ڵĴ���������
%diskDriver%
java -Dserver.port=%SVC_PORT% -Denv=${SVC_ENV% -DES_SERVER=${ES_SERVER% -jar %SVC_JAR_NAME% %PROGRAM_OPTS% 
@ rem pause

@ rem

@ rem
@ rem �����ʾ��Ϣ

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

:: �ڳ����ĩβ�����Ը���ִ�еĽ��(�ɹ���ʧ��) ������ʾ��Ϣ���ɹ�����ֱ��ִ��exit����ʧ��
:: ����ִ��pause��Ȼ�����ͨ������̨�����Ϣ�����ԡ���λ����.
:: �����ڳ���������һ���ɹ���ʧ�ܵı�־-����ֵ���������������ִ������.

@ rem echo
@ rem exit
@ rem ########## end of ##########

@ rem ע��˵��: @ rem ע������  ���� :: ע������
@ rem rem ������ð�� ���� ������дע��
