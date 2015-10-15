$signatures[:java] ||= {}
$signatures[:java][:file_access] = [
    # File access
    Signature.new({:literal => 'new FileInputStream'}),
    Signature.new({:literal => 'new FileOutputStream'}),
    Signature.new({:literal => 'new FileReader'}),
    Signature.new({:literal => 'new FileWriter'}),
    Signature.new({:literal => 'new File'}),
]

$signatures[:java][:db_access] = [
    # DB access
    # no PreparedStatement -> potentially vulnerable
    Signature.new({:literal => 'createStatement'}),
    Signature.new({:literal => 'execute'}),
    Signature.new({:literal => 'executeQuery'}),
    Signature.new({:literal => 'Statement.execute'}),
    Signature.new({:literal => 'Statement.executeQuery'}),
]

$signatures[:java][:external_process] = [
    # External Process
    Signature.new({:literal => 'Runtime.getRuntime'}),
    Signature.new({:literal => 'Runtime.Exec'}),
    Signature.new({:literal => 'Process'}),
]

$signatures[:java][:HTTP_request] = [
    # HTTP redirect/playing with response headers
    Signature.new({:literal => 'sendRedirect'}),
    Signature.new({:literal => 'setStatus'}),
    Signature.new({:literal => 'addHeader'}),
    Signature.new({:literal => 'getParameter'}),
    Signature.new({:literal => 'getHeader'}),
]

$signatures[:java][:Crypto_and_Keystore]= [
    # Keystore/Crypto usage
    Signature.new({:literal => 'KeyStore.'}),
    Signature.new({:literal => 'PrivateKey'}),
    Signature.new({:literal => 'SamlAuthToken'}),
    Signature.new({:literal => 'KeyPairGenerator.initialize'}),
    Signature.new({:literal => 'random'}),
    Signature.new({:literal => 'secureRandom'}),
]
$signatures[:java][:Entries_potential_vuln_Injection]= [
    # XSS and others injections
    Signature.new({:literal => 'getAttribute'}),
    Signature.new({:literal => 'getContextPath'}),
    Signature.new({:literal => 'getParameter'}),
    Signature.new({:literal => 'setAttribute'}),
]
$signatures[:java][:Potential_SQLI]= [
    # SQL Injections
    Signature.new({:literal => 'java.sql'}),
    Signature.new({:literal => 'java.xml'}),
]
$signatures[:java][:Potential_bypass_java_secu_policy]= [
    # Privileged
    Signature.new({:literal => 'doPrivileged'}),
    Signature.new({:literal => 'defineClassInPackage'}),
    Signature.new({:literal => 'private static final'}),
    Signature.new({:literal => 'serialVersionUID'}),
    Signature.new({:literal => 'java.security.AllPermission'}),
    Signature.new({:literal => 'DriverManager.getConnection'}),
    Signature.new({:literal => 'PrivilegedAction'}),
    Signature.new({:literal => 'MessageDigest.getInstance'}),
]
$signatures[:java][:Object_potential_vuln]= [
    # Object management
    Signature.new({:literal => 'transient'}),
    Signature.new({:literal => 'serialPersistentFields'}),
    Signature.new({:literal => 'writeObject'}),
    Signature.new({:literal => 'writeReplace'}),
    Signature.new({:literal => 'writeExternal'}),
    Signature.new({:literal => 'readExternal'}),
    Signature.new({:literal => 'SignedObject'}),
    Signature.new({:literal => 'SealedObject'}),
    Signature.new({:literal => 'GuardedObject'}),
]