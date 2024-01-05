# hugepage
echo 16384 > /proc/sys/vm/nr_hugepages

# cgroup

mkdir /sys/fs/cgroup/memory/kv128
echo 128G > /sys/fs/cgroup/memory/kv128/memory.limit_in_bytes
echo 0 > /sys/fs/cgroup/memory/kv128/memory.swappiness


chown -R root:root /sys/fs/cgroup/memory/kv*



# Mount the devices if they exist
if [ -b /dev/sda1 ]; then
    [ ! -d /mnt/ssd ] && mkdir -p /mnt/ssd
    mount /dev/sda4 /mnt/ssd # where the store writes log
else
    echo "Device /dev/sda4 does not exist."
fi

if [ -b /dev/nvme0n1 ]; then
    [ ! -d /mnt/nvm ] && mkdir -p /mnt/nvm
    mount /dev/nvme0n1 /mnt/nvm # where the store keeps all the records
else
    echo "Device /dev/nvme0n1 does not exist."
fi

# # turn off the journaling
tune2fs -O ^has_journal /dev/nvme0n1
tune2fs -O ^has_journal /dev/sda4

# set CPU in performance mode
cmd='-g powersave'
MAX_CPU=$((`nproc --all` - 1))
for i in $(seq 0 $MAX_CPU); do
    echo "Changing CPU " $i " with parameter "$cmd;
    cpufreq-set -c $i $cmd ;
done