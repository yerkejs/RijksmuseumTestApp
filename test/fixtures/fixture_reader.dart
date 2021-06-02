import 'dart:io';


/// Returns [File] from the file's path
/// needs only [String name] parameter 
/// Default path is [test/fixtures/$name]
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();