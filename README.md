#simulator

######Install dependencies

Install excel support lib xlsxwriter
MacOS has this lib installed by default. In ubuntu, do the following:
sudo apt-get install zlib1g-dev
git clone https://github.com/jmcnamara/libxlsxwriter.git
cd libxlsxwriter/
mkdir build
cd build
cmake ..
make
sudo make install

######config
```
CXXFLAGS="-std=c++11 -DDEBUG -g" ./waf configure --build-profile=debug --with-pybindgen=~/Workspace/ns3_simulator/ns-allinone-3.25/pybindgen-0.17.0.post49+ng0e4e3bc --enable-mpi --enable-static
```
######compile
```
./waf
```
######run
```
./waf --run "bitcoin-test --noBlocks=200 --nodes=14 --miners=14 --test=true -blockIntervalMinutes=0.1 -blockSize=130000 -runTime=2 -unsolicited=true -majorityCount=10"
```
**noBlocks**: total number of blocks (not used at this moment)<br>
**nodes**: total number of nodes<br>
**miners**: total number of witnesses<br>
**test**: true if use constant block intervals<br>
**blockIntervalMinutes**: block interval<br>
**runTime**: total run time of the simulation (not the time in the real world)<br>
**unsolicited**: witness send transactions automatically, keep it be true<br>
**majorityCount**: number of witness needs for consensus<br>
**duration**: 观察推进速度单元时间间隔，默认为100

######set debug environment variable
```
export 'NS_LOG=BitcoinMiner=level_all'
```

######debug in vscode
```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "(lldb) Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "/Users/sichaoy/Workspace/src/e.coding.net/simulator/ns-allinone-3.25/ns-3.25/build/scratch/bitcoin-test",
            "args": ["--noBlocks=200", "--nodes=14", "--miners=14", "--test=true", "-blockIntervalMinutes=0.05", "-blockSize=130000", "-runTime=1", "-unsolicited=true", "-majorityCount=10"],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [{"name": "NS_LOG", "value": "BitcoinNode=level_all"}],
            "externalConsole": true,
            "MIMode": "lldb"
        }
    ]
}
```
