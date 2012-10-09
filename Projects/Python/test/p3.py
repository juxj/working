import thread
import time
import sys

def work():
    time.sleep( 5 )

def locked_call( func, lock ):
    lock.acquire()
    func()
    lock.release()

lock = thread.allocate_lock()
thread.start_new_thread( locked_call, ( work, lock, ) )

# This part is icky...
while( not lock.locked() ):
    time.sleep( 0.1 )

while( lock.locked() ):
    sys.stdout.write( "*" )
    sys.stdout.flush()
    time.sleep( 1 )
print "\nWork Done"
