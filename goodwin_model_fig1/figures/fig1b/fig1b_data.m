
% strong light intensity - 0.007
LLEs0 = [ 
          34.175  32.04
          34.975  32.96
          32.725  29.74
          32.425  28.02
          34.20   30.4
          32.85   27
          32.325  18
          31.9    12
          32      13
          33.4    10.04
          32.625  8 

        ];
difs = LLEs0(:,1) - LLEs0(:,2);
normalized_lle0 = 34*(1-difs./LLEs0(:,1));

% moderate light strong - 0.005
  
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
          33.80    9.920];
        
difs = LLEs(:,1) - LLEs(:,2);
normalized_lle = 34*(1-difs./LLEs(:,1));

        
% light intensity is weak 0.002
  
  LLE1s = [ 34    32.8
            32.66 31.7
            33.02 31.6
            32.57  31.22
            35.1 33.15
            32.85 31.6
            31.58 30.64 
            31.6 21.05
            31.8 20.30
            33.4 17.00
            33.3 15.90 ];

difs = LLE1s(:,1) - LLE1s(:,2);
normalized_lle1 = 34*(1-difs./LLE1s(:,1));

        

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

hold on;
plot( t, normalized_lle1);
plot( t, normalized_lle0);

xlabel('Percent Damped Oscilators');
ylabel('LLE');
legend('K = 0.005', 'K = 0.002', 'K = 0.007');