
MODDIR=${0%/*}

alias SWAPT='grep -i SwapTotal /proc/meminfo | tr -d [:alpha:]:" "'

until [ "$(getprop sys.boot_completed)" = 1 ]
   do
   sleep 1
   done

TL=60
Step=3
k=0

while [ $(SWAPT) -eq 0  ]
do
    k=$(( $k + $Step ))
    if [ $k -gt $TL  ] ; then
        exit 0
    fi
    sleep $Step
done

SR="\/dev\/"
PS="/proc/swap*"

if [ -f /system/bin/swapoff ] ; then
    SO="/system/bin/swapoff"
else
    SO="swapoff"
fi

DIE=$(awk -v SBD="$SR" ' $0 ~ SBD {
      for ( i=1;i<=NF;i++ )
        {
          if ( $i ~ ( "^" SBD ) )
           {
              printf "%s;", $i
              break
           }
        }
      }' $PS)

saveifs=$IFS
IFS=';'

for i in $DIE
do
    case $i in
        *zram*)
              j=$(echo $i | sed 's/.*zram//')
              ( ( 
                 echo $j > /sys/class/zram-control/hot_remove
                 echo 1 > /sys/block/zram${j}/reset
                 $SO $i
              ) & )
              ;;
        *)
              if [ -n $i ]; then
                  ( ( $SO $i ) & ) 
              fi
              ;;
    esac
done

IFS=$saveifs

exit 0
