#!/bin/bash

for i in {00000..05000};
do
	time puppet agent -t --certname "node$i"
done

