
% strong light intensity - 0.007
LLEs0 = [ 
        ];
difs = LLEs0(:,1) - LLEs0(:,2);
normalized_lle0 = 34*(1-difs./LLEs0(:,1));

% moderate light strong - 0.005
  
  % LLE matrix format : original period - LLE
 %LLEs = [
  %   ];
        
%difs = LLEs(:,1) - LLEs(:,2);
%normalized_lle = 34*(1-difs./LLEs(:,1));

        
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

%hold on;
%plot( t, normalized_lle);
%plot( t, normalized_lle1);

xlabel('Percent Damped Oscilators');
ylabel('LLE');
%legend('K = 0.007', 'K = 0.005', 'K = 0.002');