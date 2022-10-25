import sys
code = sys.argv[1]
code = [ord(code) for code in code]
lxd = ['chr('+str(sttr)+')+' for sttr in code]
print(''.join(lxd)[:-1])