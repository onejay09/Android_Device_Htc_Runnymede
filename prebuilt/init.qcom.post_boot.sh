#!/system/bin/sh

target=`getprop ro.board.platform`

# Target msm7x30: HTC Runnymede, Bliss, Mecha, Flyer, Ace, Saga, etc.
case "$target" in
     "msm7x30")
        echo "conservative" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	echo 70 > /sys/devices/system/cpu/cpu0/cpufreq/conservative/up_threshold
	echo 30 > /sys/devices/system/cpu/cpu0/cpufreq/conservative/down_threshold
	echo 200000 > /sys/devices/system/cpu/cpu0/cpufreq/conservative/sampling_rate
	echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/conservative/sampling_down_facto
	echo 15 > /sys/devices/system/cpu/cpu0/cpufreq/conservative/freq_step
	echo 245760 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
	echo 1516800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        # /system/lib/libqct-opt JNI native will write mfreq to set CPU freq to max for performance
        #chown root.system /sys/devices/system/cpu/mfreq
        #chmod 220 /sys/devices/system/cpu/mfreq
        # Allow PowerManagerService to acquire perflock and enable perf mode
        chown system /sys/power/perflock
        ;;
esac

chown system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate

emmc_boot=`getprop ro.emmc`
case "$emmc_boot"
    in "1")
        chown system /sys/devices/platform/rs300000a7.65536/force_sync
        chown system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown system /sys/devices/platform/rs300100a7.65536/force_sync
        chown system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac
