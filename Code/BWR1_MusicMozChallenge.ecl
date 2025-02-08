#OPTION('obfuscateOutput', TRUE);
IMPORT $;
MozMusic := $.File_Music.MozDS;

//display the first 150 records

//Moz_MusicDs:
OUTPUT(CHOOSEN(MozMusic, 150), NAMED('Moz_MusicDS'));

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY ONE 

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Count all the records in the dataset:

//CountAllRecords
OUTPUT(COUNT(MozMusic), NAMED('CountAllRecords'));

//Result: Total count is 136510

//*********************************************************************************
//*********************************************************************************
//Challenge: 

//Sort by "name",  and display (OUTPUT) the first 50(Hint: use CHOOSEN):
//You should see a lot of songs by NSync 

//Sort:
sortMozMusic := SORT(MozMusic, name);
OUTPUT(CHOOSEN(sortMozMusic, 50), NAMED('Sort'));



//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count total songs in the "Rock" genre and display number:

//Result 4
OUTPUT(COUNT(MOZMUSIC(genre='Rock')), NAMED('Rock_Genre'));
//Result should have 12821 Rock songs

//Display your Rock songs (OUTPUT):



//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count how many songs was released by Depeche Mode between 1980 and 1989

//Filter ds for "Depeche_Mode" AND releasedate BETWEEN 1980 and 1989

// Count and display total
//Result should have 127 songs 

//Result 5
file := COUNT(MOZMUSIC(name = 'Depeche_Mode' AND releasedate BETWEEN '1980' AND '1989'));
OUTPUT(file, NAMED('NumberOfDepeche_Mode'));

//Bonus points: filter out duplicate tracks (Hint: look at DEDUP):

somefile := MOZMUSIC(name = 'Depeche_Mode' AND releasedate BETWEEN '1980' AND '1989');
duplicateFile := DEDUP(somefile, title); //filter out the title

//filterOutDupulicate
OUTPUT(duplicateFile, NAMED('filterOutDepulicate'));

//Result 7
OUTPUT(COUNT(duplicateFile), NAMED('numberOFFilterDuplicates'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Who sang the song "My Way"?
//Filter for "My Way" tracktitle

myWay := MOZMUSIC(tracktitle = 'My Way');
duplicateArtistMyWay := DEDUP(myWay, name);
countArtistMyWay := COUNT(duplicateArtistMyWay);
countMyWay := COUNT(myWay);

myWayArtist := DATASET(countArtistMyWay, TRANSFORM({String name}, SELF.name := duplicateArtistMyWay[COUNTER].name));
OUTPUT(myWayArtist, Named('List_Artist_made_MyWay'));

// Result should have 136 records 
//Display count and result 
OUTPUT(countMyWay, NAMED('Number_OF_My_Way'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//What song(s) in the Music Moz Dataset has the longest track title in CD format?

//Get the longest description (tracktitle) field length in CD "formats"


//Filter dataset for tracktitle with the longest value


//Display the result

//Longest track title is by the "The Brand New Heavies"    

cdFile := MozMusic(formats = 'CD');
maxcdMusic := MAX(MozMusic, tracktitle);
trackCDFILE := cdFile(tracktitle = maxcdMusic);

// Output the song(s) with the longest tracktitle
OUTPUT(trackCDFILE, NAMED('LongestTrackTitle'));



//*********************************************************************************
//*********************************************************************************

//                                CATEGORY TWO

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display all songs produced by "U2" , SORT it by title.

//Filter track by artist
//Sort the result by tracktitle
u2_songs := MozMusic(name = 'U2');
sortTitleU2 := SORT(u2_songs, title, tracktitle);

//Output the result
OUTPUT(sortTitleU2, NAMED('Sort_U2_Songs'));

//Count result 

//Result has 190 records
OUTPUT(COUNT(sortTitleU2), NAMED('Number_U2_Track'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count all songs where guest musicians appeared 

//Hint: Think of the filter as "not blank" 

greatMusician := MozMusic(guestmusicians != '');

//Filter for "guestmusicians"


//Display Count result
                             

//Result should be 44588 songs  
OUTPUT(COUNT(greatMusician), NAMED('number_Of_Musician'));




//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Create a new recordset which only has "Track", "Release", "Artist", and "Year"
// Get the "track" value from the MusicMoz TrackTitle field
// Get the "release" value from the MusicMoz Title field
// Get the "artist" value from the MusicMoz Name field
// Get the "year" value from the MusicMoz ReleaseDate field

//Result should only have 4 fields. 

//Hint: First create your new RECORD layout  



//Next: Standalone Transform - use TRANSFORM for new fields.


//Use PROJECT, to loop through your music dataset


// Display result  
      

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY THREE

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display number of songs per "Genre", display genre name and count for each 

//Hint: All you need is a 2 field TABLE using cross-tab

//Display the TABLE result      


//Count and display total records in TABLE


//Result has 2 fields, Genre and TotalSongs, count is 1000

//*********************************************************************************
//*********************************************************************************
//What Artist had the most releases between 2001-2010 (releasedate)?

//Hint: All you need is a cross-tab TABLE 

//Output Name, and Title Count(TitleCnt)

//Filter for year (releasedate)

//Cross-tab TABLE


//Display the result      
