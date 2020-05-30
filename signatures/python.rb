# 6.9.2015 - Updated w/signatures from Bishop Fox PowerGrep templates.
# 7.31.2015 - Added swear words to custom signature strings
# Enumerate a hash containing all of the various signatures (grouped
# topically) for which one may want to scan.
$signatures[:python] ||= {}

$signatures[:python][:dangerous_functions] = [
      Signature.new({:literal => 'commands.getoutput'}),
      Signature.new({:literal => 'commands.getstatus'}),
      Signature.new({:literal => 'commands.getstatusouput'}),
      Signature.new({:literal => 'compile'}),
      Signature.new({:literal => 'eval'}),
      Signature.new({:literal => 'exec'}),
      Signature.new({:literal => 'execfile'}),
      Signature.new({:literal => 'os.execl'}),
      Signature.new({:literal => 'os.execle'}),
      Signature.new({:literal => 'os.execlp'}),
      Signature.new({:literal => 'os.execlpe'}),
      Signature.new({:literal => 'os.execv'}),
      Signature.new({:literal => 'os.execve'}),
      Signature.new({:literal => 'os.execvp'}),
      Signature.new({:literal => 'os.execvpe'}),
      Signature.new({:literal => 'os.popen'}),
      Signature.new({:literal => 'os.popen2'}),
      Signature.new({:literal => 'os.popen3'}),
      Signature.new({:literal => 'os.popen4'}),
      Signature.new({:literal => 'os.spawnl'}),
      Signature.new({:literal => 'os.spawnle'}),
      Signature.new({:literal => 'os.spawnlp'}),
      Signature.new({:literal => 'os.spawnlpe'}),
      Signature.new({:literal => 'os.spawnv'}),
      Signature.new({:literal => 'os.spawnve'}),
      Signature.new({:literal => 'os.spawnvp'}),
      Signature.new({:literal => 'os.spawnvpe'}),
      Signature.new({:literal => 'os.startfile'}),
      Signature.new({:literal => 'os.system'}),
      Signature.new({:literal => 'popen2.popen2'}),
      Signature.new({:literal => 'popen2.popen3'}),
      Signature.new({:literal => 'popen2.popen4'}),
      Signature.new({:literal => 'shelve.open'}),
      Signature.new({:literal => 'subprocess.call'}),
      Signature.new({:literal => 'subprocess.check_call'}),
      Signature.new({:literal => 'subprocess.check_output'}),
      Signature.new({:literal => 'subprocess.Popen'}),
]

$signatures[:python][:deserialize] = [
      Signature.new({:literal => 'yaml.load'}),
      Signature.new({:literal => 'pickle.load'}),
      Signature.new({:literal => 'pickle.loads'}),
      Signature.new({:literal => 'marshal.load'}),
      Signature.new({:literal => 'marshal.loads'}),
      Signature.new({:literal => 'cPickle.load'}),
      Signature.new({:literal => 'cPickle.loads'}),
]
