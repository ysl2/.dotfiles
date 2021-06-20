URLS=(
  "https://github.com/ysl2"
)

RANDOM_URL=${URLS[$(( $RANDOM % ${#URLS[@]} + 1 ))]}

ysl () {

	if [[ -v BROWSER ]]; then
		$BROWSER $RANDOM_URL
	else
		firefox $RANDOM_URL || chrome $RANDOM_URL
	fi
}
