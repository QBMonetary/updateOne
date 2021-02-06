intv=0.1
for (( i = 0; i < 5; ++i )); do
for (( f = 3; f < 19; f=$(( f + 3 )) )); do
miners=$(( 3*f + 1 ))
majority=$(( 2*f + 1 ))
./waf --run "bitcoin-test --noBlocks=600 --nodes=$miners --miners=$miners --test=true -blockIntervalMinutes=$intv -blockSize=130000 -runTime=2 -unsolicited=true -majorityCount=$majority"
done
intv=$(echo "scale=5; $intv/2" | bc)
done

