import pexpect
import sys

log = open('pexpectits.log','wb')

p = pexpect.spawn("/bin/bash", ["/home/its/captive_its.sh"])
p.logfile = log

p.expect("DSKDMP")
print("got dskdmp")
p.sendline("its")
p.send('\033g')
print("sent boot complete")

p.expect('SHUTDOWN COMPLETE', timeout=None)
print("got shutdown")
p.sendcontrol('\\')
p.expect('sim>')
p.sendline("quit")
print("sent quit")
p.interact()
while(p.isalive()):
	pass
print("process dead")
p.close()

