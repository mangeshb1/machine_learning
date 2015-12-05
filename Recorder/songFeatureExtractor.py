# Script to record audio from microphone and extract feature set
# Usage python songFeatureExtractor.py <PATH OF YOUR MARSYAS bin directory>
# OUTPUT: One folder named output will be generated in existing directory
# Three files single.mf, bextract_single.mf and MARSYAS_EMPTYsingleFeatures.arff will be generated


import record
import os, sys

libpath = sys.argv[1]
collectionFile = 'single.mf'
featureFile = 'singleFeatures.arff'
filepath = 'output/'
bextract_single = 'bextract_'+collectionFile
 
def createOutputDirectory():
	if not os.path.isdir('output'):
		os.system('mkdir {}'.format('output'))

def removeOldFiles():
	if os.path.exists('output/output.wav'):
		os.system('rm -r {}'.format('output/output.wav'))
	if os.path.exists(collectionFile):
		os.system('rm -r {}'.format(collectionFile))
	if os.path.exists('MARSYAS_EMPTY'+featureFile):
		os.system('rm -r {}'.format('MARSYAS_EMPTY'+featureFile))
	if os.path.exists(bextract_single):
		os.system('rm -r {}'.format(bextract_single))

def makeCollection():
	os.system('{}/mkcollection -c {} {}'.format(libpath, collectionFile, filepath))

def exractFeatures():
	os.system('{}/bextract -sv {} -w {}'.format(libpath, collectionFile, featureFile))


createOutputDirectory()
removeOldFiles()
record.recorder()
makeCollection()
exractFeatures()
