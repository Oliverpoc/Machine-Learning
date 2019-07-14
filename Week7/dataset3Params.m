function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
% q0 = [C; sigma];
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
    error = @(q) mean(double(svmPredict(svmTrain(X, y, q(1), @(x1, x2) gaussianKernel(x1, x2, q(2))), Xval) ~= yval));
    pool = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
    record = 1;
    for C_cur = pool
        for sigma_cur = pool
            tmp = error([C_cur;sigma_cur]);
            if (tmp < record)
                record = tmp;
                C = C_cur;
                sigma = sigma_cur;
            end
        end
    end
    % res = fmincon(error, q0, [], [], [], [], [0; 0]);
    % C = res(1);
    % sigma = res(2);



% =========================================================================

end
