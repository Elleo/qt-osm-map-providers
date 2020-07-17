if [ -z "$1" ]
then
    echo "Usage: ./set_api_key.sh your_api_key"
    exit -1
fi
echo "Setting API key to $1"
for file in cycle cycle-hires hiking hiking-hires night-transit night-transit-hires satellite street street-hires terrain terrain-hires transit transit-hires
do
    sed -i -- "s/YOUR_API_KEY/$1/g" $file
done
