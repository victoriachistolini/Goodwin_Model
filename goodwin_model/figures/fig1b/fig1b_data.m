
% light intensity is strong - 0.005
  
  % LLE matrix format : original period - LLE
  LLEs = [34.10    31.65
          34.95    30.92
          34.00    31.80
          33.70    30.04
          34.78    30.76
          33.40    28.70
          33.10    22.76
          33.30    22.06
          33.50    19.63
          32.50    10.00
          33.80    9.920
          
  ];
        
difs = LLEs(:,1) - LLEs(:,2);
normalized_lle = 34*(1-difs./LLEs(:,1));

        
% light intensity is moderate 0.001
  
  LLE1s = [34.10  33.02 
           34.95  34.05
           34.00  33.04
           33.70  32.2
           34.78  31.38
           33.40  32.65
           33.10  31.90
           33.30  31.30
           33.50  6
  ];

difs = LLE1s(:,1) - LLE1s(:,2);
normalized_lle1 = 34*(1-difs./LLE1s(:,1));

        
% light intensity is weak 0.0005

  LLE2s = [34.10  33.425
           34.95  34.75 
           34.00  33.1
           33.70  32.92
           34.78  33.50
           33.40  33.00
           33.10  32.80
           33.30  21.75
           33.50 6
           
           ];

difs = LLE2s(:,1) - LLE2s(:,2);
normalized_lle2 = 34*(1-difs./LLE2s(:,1));

t = [0
      0.1
      0.2
      0.3
      0.4
      0.5
      0.6
      0.7
      0.8
      0.9
      1];

figure;
plot( t, normalized_lle);

%hold on;
%plot( t, normalized_lle1);
%plot( t, normalized_lle2);

xlabel('Percent Damped Oscilators');
ylabel('LLE');
legend('K = 0.005');