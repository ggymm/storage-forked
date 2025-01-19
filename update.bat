@echo off
setlocal enabledelayedexpansion

set "repos[0]=https://github.com/whuanle/lsm"
set "dirs[0]=lsm"

set "repos[1]=https://github.com/skyzh/mini-lsm"
set "dirs[1]=mini-lsm"

set "repos[2]=https://github.com/lotusdblabs/lotusdb"
set "dirs[2]=lotusdb"

set "repos[3]=https://github.com/rosedblabs/rosedb"
set "dirs[3]=rosedb"

set "repos[4]=https://github.com/facebook/rocksdb"
set "dirs[4]=rocksdb"

set "repos[5]=https://github.com/dgraph-io/badger"
set "dirs[5]=badger"

set "repos[6]=https://github.com/chaisql/chai"
set "dirs[6]=chai"

set "repos[7]=https://github.com/cockroachdb/pebble"
set "dirs[7]=pebble"

set "repos[8]=https://github.com/etcd-io/bbolt"
set "dirs[8]=bbolt"

set "repos[9]=https://github.com/syndtr/goleveldb"
set "dirs[9]=goleveldb"

set "repos[10]=https://github.com/auxten/go-sqldb"
set "dirs[10]=go-sqldb"

set "repos[11]=https://github.com/chenjiandongx/mandodb"
set "dirs[11]=mandodb"

set "repos[12]=https://github.com/kebukeYi/MVCC"
set "dirs[12]=MVCC"

set "repos[13]=https://github.com/nananatsu/simple-raft"
set "dirs[13]=simple-raft"

set "repos[14]=https://github.com/jojo-nica/MYDB"
set "dirs[14]=MYDB"

set "repos[15]=https://github.com/qw4990/NYADB2"
set "dirs[15]=NYADB2"

for /L %%i in (0,1,15) do (
    if not exist "!dirs[%%i]!" (
        call git clone --depth 1 !repos[%%i]! !dirs[%%i]!
    ) else (
        cd !dirs[%%i]!
        for /f "delims=" %%a in ('git rev-parse --abbrev-ref HEAD') do set "branch=%%a"
        call git fetch --depth 1
        call git reset --hard "origin/!branch!"
        cd ..
    )
)


call git add .
call git commit -m "update"
call git push

pause
