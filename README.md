StormCpp
========

A small C++ wrapper for Storm.
This is wrapper made by EPSRC CROSS project but patched by me for Apache 1.0.1 storm.
Earlier this was working only till 0.8 storm. But I have corrected it for this

How to Work
===============
This already consist of Json library from : https://github.com/open-source-parsers/jsoncpp
I have used "python amalgamate.py" to generate two .h and one .cpp file for json
There are two files, one that uses only Bolts and other which have Spout also.

1. Download the this Storm CPP wrapper 
2. Inherit the BasicBolt class and implement the Process method
3. "main" function calls this class instance and call the run() method
4. Write a Java Topology file and put the file at > \<(location of storm starter)>\/src/jvm/org/apache/storm/starter
5. In Java Topology file: Presently it is not possible to run binaries directly from storm toplogy, thus create a bash file.
   This bash file should run the binary created earlier from cpp files. For example: in CPPWordCount.java line 43:
			super("bash","split_sentence.sh");
6. Copy the bash script (eg. split\_sentence.sh) to > \<(location of storm starter)>\/target/classes/resources/ 
7. Create the bash script(eg. random\_sentence.sh) to > \<(location of storm starter)>\/target/classes/resources/
   This is for random sentence spout to work
8. Run the topology: storm jar target/storm-starter-2.0.0-SNAPSHOT.jar org.apache.storm.starter.CPPWordCount cppwct



Compiling codes
===============

For compling this example:
```
make
```

Acknowledgments
===============

I have patched on the work which was conducted as part of the EPSRC CROSS project
(http://demeter.inf.ed.ac.uk/cross), a joint venture between
School of Informatics, University of Edinburgh, and School of
Computing Science, University of Glasgow.
