
% strong light intensity - 0.007
LLEs0 = [ 34.625 33.475 
          33.725 32.78
          32.625 31.3
          33.875 33.55
          32.54  32.32
          34.45  32.90
          34.625  32.90
          30.625  29.9
          32.00 31
          31.85 26.60
          32.30  18.90
        ];
difs = LLEs0(:,1) - LLEs0(:,2);
normalized_lle0 = 34*(1-difs./LLEs0(:,1));

% moderate light strong - 0.005
  
  % LLE matrix format : original period - LLE
 LLEs = [ 33.75 32.4
          34.20 33.10
          35.20 33.20
          33.70 33.10
          33.30 32.80
          32.45 32.00
          33.00 32.25
          31.50 31.00
          31.20 30.50
          31.30 28.25
          32.35 21.10
     ];
        
difs = LLEs(:,1) - LLEs(:,2);
normalized_lle = 34*(1-difs./LLEs(:,1));

        
% light intensity is weak 0.002
  
 % LLE1s = [ 
  %          ];

%difs = LLE1s(:,1) - LLE1s(:,2);
%normalized_lle1 = 34*(1-difs./LLE1s(:,1));

        

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
%plot( t, normalized_lle1);

xlabel('Percent Damped Oscilators');
ylabel('LLE');
legend('K = 0.007', 'K = 0.005');