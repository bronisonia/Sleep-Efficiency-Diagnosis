% SONIA BRONI
% May 9, 2024
% ES2 FINAL PROJECT: SLEEP EFFICIENCY

% ---- READ IN TABLE ----

Lifestyle = readtable("Sleep_health_and_lifestyle_dataset.csv");

%% --- Question 1: Stress Levels & Sleep Disorder ---

age = Lifestyle.Age;
stresslvl = Lifestyle.StressLevel;    % identifying variables
sleepdisorder = Lifestyle.SleepDisorder;

insomnia = find(sleepdisorder=="Insomnia");        %locating the category of "SleepDisorder", then
sleep_apnea = find(sleepdisorder=="Sleep Apnea");  % finding the rows of each sleep disorder specifically. 
none = find(sleepdisorder=="None");

figure()   % graphing age vs. stresslevel, but using different color markers to indicate which type of sleep disorder.
           % if the individual does not have a sleep disorder, it will plot
           % as a green marker. 
hold on
plot(age(insomnia), stresslvl(insomnia), 'ro');
plot(age(sleep_apnea), stresslvl(sleep_apnea), 'bo');
plot(age(none), stresslvl(none), 'go');

legend(["Insomnia", "Sleep Apnea", "None"]);   % A legend is necessarily to properly see which sleep disorder is which as a plot mark
xlabel('Age');                                 % Red Marker: Insomnia ; Blue Marker: Sleep Apnea ; Green Marker: None.  
ylabel('Stress Levels (1-10)');
title('Stress Levels vs Age vs Sleep Disorder')
hold off

%% --- Begin Analysis Method (NearestNeighborClassify) ---

% --- Plotting Normalized Data ---

ageNormalFactor = max(age);
stresslvlNormalFactor = max(stresslvl);

% --- Normalize age and stress level vectors ---
ageNormalized = age / ageNormalFactor;
stresslvlNormalized = stresslvl / stresslvlNormalFactor;

figure()

plot( ageNormalized(insomnia), stresslvlNormalized(insomnia), 'ro');
hold on
plot( ageNormalized(sleep_apnea), stresslvlNormalized(sleep_apnea), 'bo');
hold on 
plot( ageNormalized(none), stresslvlNormalized(none), 'go');
title('Normalized: Stress Level vs. Age');
xlabel('Age');
ylabel('Stress Level (1-10)');
legend(["Insomnia", "Sleep Apnea", "None"]);

% ---- Test Data - Single Value ----

% USER INPUT (I used my own statistics for this test data.)
ageTest = 18; 
stresslvlTest = 5;

% Normalize Age and Stress Levels
ageTestNormalized = ageTest / ageNormalFactor;
stresslvlTestNormalized = stresslvlTest / stresslvlNormalFactor;

hold on
% This section is to display the normalized plot from the previous section.
plot(ageTestNormalized, stresslvlTestNormalized, 'gs', 'markersize', 14);

classTest = NearestNeighborClassify (ageNormalized, stresslvlNormalized, sleepdisorder, ageTestNormalized, stresslvlTestNormalized);

% A loop to display whether the conditions (i.e. age and stress level) of
% an individual would be classified as having insomnia, sleep apnea, or
% neither. 

if classTest=="Insomnia"
    disp('We predict that Sonia has insomnia.');
elseif classTest=="Sleep Apnea"
    disp('We predict that Sonia has sleep apnea.');
else
    disp('We predict that Sonia does not have a sleep disorder.');
end

%% --- User Input for Sara ---

% This is applicable with many different statistics! Below is the use input
% for Sara. Sara is actually diagnosed with insomnia and so let's see if it
% will correctly diagnose her!

ageTest_Sara = 21;
stresslvlTest_Sara = 6;

% Normalize Age and Stress Levels
ageTestNormalized_Sara = ageTest_Sara / ageNormalFactor;
stresslvlTestNormalized_Sara = stresslvlTest_Sara / stresslvlNormalFactor;

hold on

plot(ageTestNormalized_Sara, stresslvlTestNormalized_Sara, 'gs', 'markersize', 14);

classTest = NearestNeighborClassify (ageNormalized, stresslvlNormalized, sleepdisorder, ageTestNormalized_Sara, stresslvlTestNormalized_Sara);

if classTest=="Insomnia"
    disp('We predict that Sara has insomnia.');
elseif classTest=="Sleep Apnea"
    disp('We predict that Sara has sleep apnea.');
else
    disp('We predict that Sara does not have a sleep disorder.');
end

%% --- User Input for MOM ---

ageTest_Mom = 53;
stresslvlTest_Mom = 8;

% Normalize Age and Stress Levels
ageTestNormalized_Mom = ageTest_Mom / ageNormalFactor;
stresslvlTestNormalized_Mom = stresslvlTest_Mom / stresslvlNormalFactor;

hold on

plot(ageTestNormalized_Mom, stresslvlTestNormalized_Mom, 'gs', 'markersize', 14);

classTest = NearestNeighborClassify (ageNormalized, stresslvlNormalized, sleepdisorder, ageTestNormalized_Mom, stresslvlTestNormalized_Mom);

if classTest=="Insomnia"
    disp('We predict that Mom has insomnia.');
elseif classTest=="Sleep Apnea"
    disp('We predict that Mom has sleep apnea.');
else
    disp('We predict that Mom does not have a sleep disorder.');
end

%% --- Question 2: Occupation & Quality of Sleep ---

qualityofsleep = Lifestyle.QualityOfSleep;    % identifying variables

% calcualting the average of quality of sleep for every occupation in order to compare the qualities of
% sleep with the other occupations. 

ACCNT = find((Lifestyle.Occupation=="Accountant"));
ACCNT_QOS = qualityofsleep(ACCNT);
MeanACCNTsleep = mean(ACCNT_QOS);

DCTR = find((Lifestyle.Occupation=="Doctor"));
DCTR_QOS = qualityofsleep(DCTR);
MeanDCTRsleep = mean(DCTR_QOS);

ENG = find((Lifestyle.Occupation=="Engineer"));
ENG_QOS = qualityofsleep(ENG);
MeanENGsleep = mean(ENG_QOS);

LWYR = find((Lifestyle.Occupation=="Lawyer"));
LWYR_QOS = qualityofsleep(LWYR);
MeanLWYRsleep = mean(LWYR_QOS);

MNGR = find((Lifestyle.Occupation=="Manager"));
MNGR_QOS = qualityofsleep(MNGR);
MeanMNGRsleep = mean(MNGR_QOS);

NRSE = find((Lifestyle.Occupation=="Nurse"));
NRSE_QOS = qualityofsleep(NRSE);
MeanNRSEsleep = mean(NRSE_QOS);

SLSPRSN = find((Lifestyle.Occupation=="Salesperson"));
SLSPRSN_QOS = qualityofsleep(SLSPRSN);
MeanSLSPRSNsleep = mean(SLSPRSN_QOS);

SLSREP = find((Lifestyle.Occupation=="Sales Representative"));
SLSREP_QOS = qualityofsleep(SLSREP);
MeanSLSREPsleep = mean(SLSREP_QOS);

SCNTST = find((Lifestyle.Occupation=="Scientist"));
SCNTST_QOS = qualityofsleep(SCNTST);
MeanSCNTSTsleep = mean(SCNTST_QOS);

SFTENG = find((Lifestyle.Occupation=="Software Engineer"));
SFTENG_QOS = qualityofsleep(SFTENG);
MeanSFTENGsleep = mean(SFTENG_QOS);

TCHR = find((Lifestyle.Occupation=="Teacher"));
TCHR_QOS = qualityofsleep(TCHR);
MeanTCHRsleep = mean(TCHR_QOS);

% bar graph (display)

figure()

axis_label = ["Accountant" "Doctor" "Engineer" "Lawyer" "Manager" "Nurse" "Salesperson" "Sales Respresentative" "Scientist" "Software Engineer" "Teacher"];
bar(axis_label, [MeanACCNTsleep, MeanDCTRsleep, MeanENGsleep, MeanLWYRsleep, MeanMNGRsleep, MeanNRSEsleep, MeanSLSPRSNsleep, MeanSLSREPsleep, MeanSCNTSTsleep, MeanSFTENGsleep, MeanTCHRsleep]);
xlabel('Occupation');
ylabel('Quality of Sleep (1-10)');
title('Occupation vs Quality of Sleep'); 

%% --- Question 3: Physical Activity & Sleep Duration ---

physicalactivity = Lifestyle.PhysicalActivityLevel;
sleepduration = Lifestyle.SleepDuration;    % identifying variables

figure()

hold on 

plot(physicalactivity, sleepduration, '*', 'LineWidth', 1);
xlim([20 100])    % Changing the limits to better see the plots in a more specified range. 
ylim([4 10])
xlabel('Physical Activity (Minutes)');
ylabel('Sleep Duration (Hours)');
title('Physical Activity vs. Sleep Duration');
hold off
