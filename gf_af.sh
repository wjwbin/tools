find camx-lib-3a/system/statsalgo/haf -name *.cpp > af.txt
find camx-lib-3a/system/statsalgo/haf -name *.h >> af.txt
find camx-lib-3a/system/statsnn -name *.h >> af.txt
find camx-lib-3a/system/statsnn -name *.cpp >> af.txt
find camx-lib-stats/system/statsalgo/af -name *.cpp >> af.txt
find camx-lib-stats/system/statsalgo/af -name *.h >> af.txt
find camx-lib-stats/system/statsalgo/inc -name *.h >> af.txt
find camx-lib-stats/system/statsalgo/common -name *.h >> af.txt
find camx-lib-stats/system/statsalgo/common -name *.cpp >> af.txt
find camx/src/swl/stats/ -name *.cpp >> af.txt
find camx/src/swl/stats/ -name *.h >> af.txt
find chi-cdk -name *.h >> af.txt

cat af.txt | xargs zip af.zip
