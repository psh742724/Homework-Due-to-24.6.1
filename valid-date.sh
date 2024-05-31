#!/bin/bash


month="$1"
day="$2"
year=$3


#거절 코드 - 인수의 개수가 3이 아닐 경우:
if [ $# -ne 3 ]
then
	echo 입력값 오류
	exit 1
fi

#대문자로 바꾸기 - month 인수
case $month in
	1|jan|january|Jan) month="Jan" ;;
	2|feb|february|Feb) month="Feb" ;;
	3|mar|march|Mar) month="Mar" ;;
	4|apr|april|Apr) month="Apr" ;;
	5|may|May) month="May" ;;
	6|jun|june|Jun) month="Jun" ;;
	7|jul|july|Jul) month="Jul" ;;
	8|aug|august|Aug) month="Aug" ;;
	9|sep|september|Sep) month="Sep" ;;
	10|oct|october|Oct) month="Oct" ;;
	11|nov|november|Nov) month="Nov" ;;
	12|dec|december|Dec) month="Dec" ;;
      *) echo 올바른 달이 아닙니다 $month $day $year 은/는 유효하지 않습니다.
	exit 2 ;;
esac


#윤년 계산 코드(판별 인수: junct, 윤년 == junct=1, 윤년 != junct=0)
if [ $((year % 4)) -eq 0 ]
then
	if [ $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]
	then
		junct=1
	else
		junct=0
	fi
else
	junct=0
fi



#결과 출력 코드

#마지막 날짜가 31일인 month 인수들의 경우:
case $month in
	Jan|Mar|May|Jul|Aug|Oct|Dec)
		if [ $day -le 31 ] && [ $day -ge 1 ]
		then
			echo $month $day $year
		else
			echo $month $day $year 는 유효한 날짜가 아닙니다. 입력한 날짜가 해당 달에 존재하지 않습니다.
		fi;;

	Feb) month="Feb"
        #2월(윤년 계산: 28일 = 윤년, 29일 = 윤년이 아님)
	if [ $junct -eq 1 ]
	then
		if [ $day -le 29 ] && [ $day -ge 1 ]
		then
			echo $month $day $year
		else
			echo $month $day $year 는 유효한 날짜가 아닙니다. 입력한 날짜가 해당 달에 존재하지 않습니다.
		fi
	else
		if [ $day -le 28 ] && [ $day -ge 1 ]
		then
			echo $month $day $year
		else
			echo $month $day $year 는 유효한 날짜가 아닙니다. 입력한 날짜가 해당 달에 존재하지 않습니다.
		fi
              fi;;

         Apr|Jun|Sep|Nov)   
	       if [ $day -le 30 ] && [ $day -ge 1 ]
	         then
                 echo $month $day $year
               else
	         echo $month $day $year 는 유효한 날짜가 아닙니다. 입력한 날짜가 해당 달에 존재하지 않습니다.
	       fi;;
esac




	  
