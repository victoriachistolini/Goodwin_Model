
% strong light intensity - 0.007
LLEs0 = [ 34  32.30
          34  32.60
          34.7 32.60
          33.24 31.9
          33.53 32
          33.4  31.78
          34.15 33
          33.5 32.5
          33.93 32.2
          33.64 32.5
          35.525 33.46
        ];
difs = LLEs0(:,1) - LLEs0(:,2);
normalized_lle0 = 34*(1-difs./LLEs0(:,1));

% moderate light strong - 0.005
  
  % LLE matrix format : original period - LLE
 LLEs = [34.85 33.87
         34.575 33.10
         34.775 33.6
         34.80  33.50
         33.83 33.12
         31.90 31.52
         32.96 32.1
         33    32
         33.33 32.0
         33.35 32.52
         34.65 33.24
     ];
        
difs = LLEs(:,1) - LLEs(:,2);
normalized_lle = 34*(1-difs./LLEs(:,1));

        
% light intensity is weak 0.002
  
  LLE1s = [ 36.05 35.72
            34  33.7
            34.95 34.2
            32.65 32.2
            35.95 35.56
            33.2  33.175
            33.725 33.16
            33.90 33
            33.875 33
            32.80 32.5
            32.62 31.24
            ];

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
plot( t, normalized_lle0);

hold on;
plot( t, normalized_lle);
plot( t, normalized_lle1);

xlabel('Percent Damped Oscilators');
ylabel('LLE');
legend('K = 0.007', 'K = 0.005', 'K = 0.002');