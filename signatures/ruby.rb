$signatures[:ruby] ||= {}

$signatures[:ruby][:dangerous_functions] = [
      Signature.new({:literal => 'eval'}),
      Signature.new({:literal => 'exec'}),
      Signature.new({:literal => '`'}),
      Signature.new({:literal => 'system'}),
      Signature.new({:literal => 'syscall'}),
      Signature.new({:literal => 'constantize'}),
      Signature.new({:literal => 'render'}),
      Signature.new({:literal => 'send'}),
]

$signatures[:python][:deserialize] = [
      Signature.new({:literal => 'YAML.load'}),
      Signature.new({:literal => 'Marshal.load'}),
]
