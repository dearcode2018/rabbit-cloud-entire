@ rem ----- ��Ϣ -----
@ rem @filename StartPackage.bat
@ rem @version 1.0
@ rem @description ����/���Դ��
@ rem @author qye.zheng

@ rem @warning Ϊ�˷�ֹ���Ļ������룬�����ļ���ʱ��Ӧ�ñ���ΪANSI�����ʽ.
@ rem ################################################################################


@ rem ����
@ title ���
@ rem ########## begin  ##########

@ rem �ر���ʾ���ʹ��������ִ��ǰ����ʾ
@ rem @ echo off
@ rem echo off
@ rem ��������ʾ @ echo on

@ rem �ֹ��޸Ļ������� NODE_HOME=D:\software\node-v8.12.0-win-x64  | �߰汾��node�ݲ�֧��

set scriptPath=%~dp0
@ rem ����ű����ڵĴ���
%scriptPath:~0,2%

@ rem ����ű����ڵ�Ŀ¼
cd %scriptPath%

:: ɾ��distĿ¼ /S�ݹ�ɾ�� /Q ֱ��ɾ������ȷ��
rd /S /Q dist

@ rem ִ�� node����Կ���ģʽ���� 
@rem npm run build --prod
:: cnpm run build --dev
cnpm run build --qa
@ rem ----- ����������
:: ������ͣ��ʶ
set stopFlag=true

:: �������� bat ֮����Ҫ�������ñ��⣬���ⱻ��һ��bat���򸲸�


@ rem ----- ���������

:: �ɶ����ſ��԰Ѷ���Ҫִ�е�����Χ������else ����� if ��֧����������ͬһ�У����� else ������Ϊ��ͬ���



@ rem pause
if "true"=="%stopFlag%" (pause)
@ rem
:: �˳�
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
