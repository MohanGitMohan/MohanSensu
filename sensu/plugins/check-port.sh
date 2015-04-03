if [ $# -ne 3 ]
then
	echo "Usage: $0 host port timeout-in-seconds     Eg: $0 localhost 22 1"
	exit 1
fi

nc -z -w$3 $1 $2 > /dev/null 2>&1
if [ $? -ne 0 ]
then
	echo "FAILURE - Attempted connection to $1 on port $2 timed out after $3 seconds"
	exit 2
else
	echo "SUCCESS - Connection to $1 on port $2"
	exit 0
fi
