% strenght 1.5; 1800-2000 hrs percentages 0.1
FRPs_weak =[ 29.9200
        29.6000
        30.3000
        29.4400
        29.6000
        29.9000
        29.3600
        29.5600
        29.2600
        29.4
        29.8000
    ];

ts = [0
      0.1
      0.2
      0.3
      0.4
      0.5
      0.6
      0.7
      0.8
      0.9
      1.0];
  
  
  % strenght 2; 78000-80000; 0; 18000-20000  percentages 0.1 last three messed up!
  % 0.6 window is 7000-8000, 0.7 window 3500-4500, 0.8 3500-4500 0.9
  % 4000-5000 1 3000-4000
FRPs_moderate =[ 33.9500
        33.8000
        30.8200
        33.5250
        32.6750
        31.1400
        31
        31.4000
        30.4000
        31.7000
        32.7000
    ];


 % strenght 2.3
  
 FRPs_strong =[ 38.5500 
                37.5000 
                36.6750 
                36.8500 
                35.7000 
                35.3250 
                36.6500 
                34.9000 
                34.4000 
                34.5000 
                35.5 ]; 
  

figure;
plot( ts, FRPs_weak);

hold on;
plot( ts, FRPs_moderate);
plot( ts, FRPs_strong);

xlabel('Percent Damped Oscilators');
ylabel('FRP');
legend('Coupling = 1.5', 'Coupling = 2', 'Coupling = 2.3');
%ylim([29 34])

