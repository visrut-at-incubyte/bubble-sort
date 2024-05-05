objdump -D "$(readlink -f "$(which firefox)")" | grep -E '^[0-9]+.*:$' | sort -n | python gap.py
ls /usr/bin | xargs which | xargs du -sh | grep -e '^[0-9].*M.*' | sort -n
