import time
from datetime import datetime, timezone, timedelta

WIB = timezone(timedelta(hours=7))
birth = datetime(2004, 2, 11, 2, 0, 0, tzinfo=WIB)

while True:
    now = datetime.now(WIB)
    delta = now - birth

    days = delta.days
    seconds = delta.seconds

    hours = days * 24 + seconds // 3600
    minutes = hours * 60 + (seconds % 3600) // 60
    total_seconds = int(delta.total_seconds())

    print(f"\rHari: {days} | Jam: {hours} | Menit: {minutes} | Detik: {total_seconds}", end="")
    time.sleep(1)