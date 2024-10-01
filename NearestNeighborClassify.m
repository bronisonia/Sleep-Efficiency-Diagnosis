% This function reads in normalized training data (xNormal, yNormal) and their
% labels (class). It reads in test data (xtest, ytest) and classifies them
% using the Nearest Neighbors technique. xtest and ytest may be scalars or 
% vectors.

function [classification] = NearestNeighborClassify ( xNormal, yNormal, class, xtest, ytest)

classification = [];

    for i = 1:length(xtest)

        distance = sqrt ( ( xtest(i) - xNormal ).^2 + ( ytest(i) - yNormal ).^2 );

        [ distanceMinVal, distanceMinIndex ] = min ( distance );

        classification = [ classification class( distanceMinIndex )];

    end

end
