% Starter code prepared by James Hays for CS 143, Brown University

%This function will train a linear SVM for every category (i.e. one vs all)
%and then use the learned linear classifiers to predict the category of
%every test image. Every test feature will be evaluated with all 15 SVMs
%and the most confident SVM will "win". Confidence, or distance from the
%margin, is W*X + B where '*' is the inner product or dot product and W and
%B are the learned hyperplane parameters.

function [w, b] = svm_classify(features_positive, features_negative)
% features_positive is an N x d matrix, where d is the dimensionality of the
%  feature representation.
% features_negative is an M x d matrix, where d is the dimensionality of the
%  feature representation.

%{
Useful functions:
 matching_indices = strcmp(string, cell_array_of_strings)
 
  This can tell you which indices in train_labels match a particular
  category. This is useful for creating the binary labels for each SVM
  training task.

[W B] = vl_svmtrain(features, labels, LAMBDA)
  http://www.vlfeat.org/matlab/vl_svmtrain.html

  This function trains linear svms based on training examples, binary
  labels (-1 or 1), and LAMBDA which regularizes the linear classifier
  by encouraging W to be of small magnitude. LAMBDA is a very important
  parameter! You might need to experiment with a wide range of values for
  LAMBDA, e.g. 0.00001, 0.0001, 0.001, 0.01, 0.1, 1, 10.

  Matlab has a built in SVM, see 'help svmtrain', which is more general,
  but it obfuscates the learned SVM parameters in the case of the linear
  model. This makes it hard to compute "confidences" which are needed for
  one-vs-all classification.

%}


train_data = [features_positive; features_negative];
train_labels = [ones(size(features_positive,1),1); -1*ones(size(features_negative,1),1)];
train_data_VLformat = train_data';
LAMBDA = 0.0001;
%train this
[w, b] = vl_svmtrain(train_data_VLformat, train_labels, LAMBDA);

end

