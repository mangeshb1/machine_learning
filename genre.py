import os, shutil, random

path = 'all'

blues_songs = []
classical_songs = []
country_songs = []
disco_songs = []
hiphop_songs = []
jazz_songs = []
metal_songs = []
pop_songs = []
reggae_songs = []
rock_songs = []

all_genres = [blues_songs, classical_songs, country_songs, disco_songs, hiphop_songs, jazz_songs, metal_songs, pop_songs, reggae_songs, rock_songs]

training_songs = []
validation_songs = []
testing_songs = []

for root, dirs, files in os.walk("genres"):
    for file in files:
        if file.startswith("blues"):
             src = os.path.join(root, file)
             blues_songs.append(src)
        elif file.startswith("classical"):
             src = os.path.join(root, file)
             classical_songs.append(src)
        elif file.startswith("country"):
             src = os.path.join(root, file)
             country_songs.append(src)
        elif file.startswith("disco"):
             src = os.path.join(root, file)
             disco_songs.append(src)
        elif file.startswith("hiphop"):
             src = os.path.join(root, file)
             hiphop_songs.append(src)
        elif file.startswith("jazz"):
             src = os.path.join(root, file)
             jazz_songs.append(src)
        elif file.startswith("metal"):
             src = os.path.join(root, file)
             metal_songs.append(src)
        elif file.startswith("pop"):
             src = os.path.join(root, file)
             pop_songs.append(src)
        elif file.startswith("reggae"):
             src = os.path.join(root, file)
             reggae_songs.append(src)
        elif file.startswith("rock"):
             src = os.path.join(root, file)
             rock_songs.append(src)

i = 0

for genre in all_genres:
	i+=70
	print 'Length: %d' % i
	while len(training_songs) < i:
		rand = random.choice(genre)
		if rand not in training_songs:
			training_songs.append(rand)

print len(training_songs)

j = 0

for genre in all_genres:
	j+=15
	print 'Length: %d' % j
	while len(validation_songs) < j:
		rand = random.choice(genre)
		if rand not in validation_songs and rand not in training_songs:
			validation_songs.append(rand)

print len(validation_songs)

k = 0

for genre in all_genres:
	k+=15
	print 'Length: %d' % k
	while len(testing_songs) < k:
		rand = random.choice(genre)
		if rand not in testing_songs and rand not in training_songs and rand not in validation_songs:
			testing_songs.append(rand)
		

print len(testing_songs)


for song in training_songs:
	shutil.copy(song, path+'/train')

for song in validation_songs:
	shutil.copy(song, path+'/validate')

for song in testing_songs:
	shutil.copy(song, path+'/test')
