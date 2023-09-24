USE GENZDATASET;
SELECT *
FROM learning_aspirations AS l
JOIN manager_aspirations AS m 
ON m.responseid = l.responseid
JOIN mission_aspirations AS mi
ON mi.responseid = l.responseid
JOIN personalized_info AS pi
ON pi.responseid = l.responseid;

# How many males have responded to the survey from India? #
SELECT COUNT(responseid) AS No_of_males
FROM personalized_info 
WHERE gender LIKE 'Male%' AND  currentcountry = 'India';

# How many Females have responded to the survey from India? #
SELECT COUNT(responseid) AS No_of_females
FROM personalized_info 
WHERE gender LIKE 'Female%' AND  currentcountry = 'India';

# How many of the Gen-Z are influenced by their parents in regards to their career choices from India? #
SELECT count(l.responseid) AS Count_of_genz
FROM learning_aspirations AS l
JOIN personalized_info AS pi
ON pi.responseid = l.responseid
WHERE l.careerinfluencefactor = 'My Parents' AND pi.currentcountry = 'India';

# How many of the Female Gen-Z are influenced by their parents in regards to their career choices from India? #
SELECT count(l.responseid) AS No_of_females
FROM learning_aspirations AS l
JOIN personalized_info AS pi
ON pi.responseid = l.responseid
WHERE l.careerinfluencefactor = 'My Parents' 
AND pi.currentcountry = 'India' 
AND pi.gender Like 'Female%';

# How many of the Male Gen-Z are influenced by their parents in regards to their career choices from India? #
SELECT count(l.responseid) AS No_of_males
FROM learning_aspirations AS l
JOIN personalized_info AS pi
ON pi.responseid = l.responseid
WHERE l.careerinfluencefactor = 'My Parents' 
AND pi.currentcountry = 'India' 
AND pi.gender Like 'Male%';

# How many of the Male and Female Gen-Z are influenced by their parents in regards to their career choices from India? #
SELECT pi.gender, count(l.responseid) AS Count_of_genz
FROM learning_aspirations AS l
JOIN personalized_info AS pi
ON pi.responseid = l.responseid
WHERE l.careerinfluencefactor = 'My Parents' 
AND pi.currentcountry = 'India' 
GROUP BY pi.gender;

# How many GenZ are influenced by both social media and influencers together from India? #
SELECT count(l.responseid) AS Count_of_genz
FROM learning_aspirations AS l
JOIN personalized_info AS pi
ON pi.responseid = l.responseid
WHERE  pi.currentcountry = 'India' AND CareerInfluenceFactor LIKE ('%influencer%') OR
CareerInfluenceFactor LIKE('%social%');

# How many GenZ are influenced by both social media and influencers together from India?, Display Male and Female Seperately #
SELECT pi.gender, count(l.responseid) AS Count_of_genz
FROM learning_aspirations AS l
JOIN personalized_info AS pi
ON pi.responseid = l.responseid
WHERE l.careerinfluencefactor = 'My Parents' 
AND pi.currentcountry = 'India' AND CareerInfluenceFactor LIKE ('%influencer%') OR
CareerInfluenceFactor LIKE('%social%')
GROUP BY pi.gender;

# How many GenZ influenced by the social media are looking forward to go abroad? #
SELECT count(l.responseid) AS Count_of_genz
FROM learning_aspirations AS l
JOIN personalized_info AS pi
ON pi.responseid = l.responseid
WHERE CareerInfluenceFactor LIKE('%social%') AND highereducationabroad LIKE ('%yes%');

# How many GenZ influenced by "people in their circle" are looking forward to go abroad? #
SELECT count(l.responseid) AS Count_of_genz
FROM learning_aspirations AS l
JOIN personalized_info AS pi
ON pi.responseid = l.responseid
WHERE CareerInfluenceFactor LIKE('%people from my circle%') and highereducationabroad like ('%yes%');




