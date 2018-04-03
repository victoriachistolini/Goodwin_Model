
% light intensity is strong - 0.005
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
  
  % LLE matrix format : original period - LLE
  LLEs = [34.1 31.65
                        
  ];
        
        
% light intensity is moderate 0.001
  
  LLE1s = [34.1 33.02 
                        
  ];



        
% light intensity is weak 0.0005

  LLE2s = [34.1 33.4250
                        
  ];


figure;
plot( ts, FRPs_weak);

hold on;
plot( ts, FRPs_moderate);
plot( ts, FRPs_strong);

xlabel('Percent Damped Oscilators');
ylabel('FRP');
legend('Coupling = 1.5', 'Coupling = 2', 'Coupling = 2.3');