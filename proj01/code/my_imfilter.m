function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% See 'help imfilter' or 'help conv2'. While terms like "filtering" and
% "convolution" might be used interchangeably, and they are indeed nearly
% the same thing, there is a difference:
% from 'help filter2'
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should work for color images. Simply filter each color
% channel independently.

% Your function should work for filters of any width and height
% combination, as long as the width and height are odd (e.g. 1, 7, 9). This
% restriction makes it unambigious which pixel in the filter is the center
% pixel.

% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' and 'help imfilter' you see that they have
% several options to deal with boundaries. You should simply recreate the
% default behavior of imfilter -- pad the input image with zeros, and
% return a filtered image which matches the input resolution. A better
% approach is to mirror the image content over the boundaries for padding.

% % Uncomment if you want to simply call imfilter so you can see the desired
% % behavior. When you write your actual solution, you can't use imfilter,
% % filter2, conv2, etc. Simply loop over all the pixels and do the actual
% % computation. It might be slow.
% output = imfilter(image, filter);


%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

% (1) support grayscale and color images 
% (2) support arbitrary shaped filters, as long as both dimensions are odd (e.g. 7x9 filters but not 4x5 filters) 
% (3) pad the input image with zeros or reflected image content and 
% (4) return a filtered image which is the same resolution as the input image.
 
[width, height, channels] = size(image);
[k,l] = size(filter);
assert( k/2 ~= 0 && l/2 ~= 0, 'both dimensions of kernel must be odd');
	

output = zeros(width, height, channels);
extendImage = zeros(width+k-1, height+l-1, channels);

extendImage((k-1)/2 + 1:(k-1)/2 + width,(l-1)/2 + 1:(l-1)/2 + height,:) = image;
imshow(extendImage);
for channelIndex = 1:channels
	for m = (k-1)/2 + 1:(k-1)/2 + width
		for n = (l-1)/2 + 1:(l-1)/2 + height
			for kernelIndex1 = -(k-1)/2 : (k-1)/2
				for kernelIndex2 = -(l-1)/2 : (l-1)/2
						output(m-(k-1)/2,n-(l-1)/2,channelIndex) = output(m-(k-1)/2,n-(l-1)/2,channelIndex) + filter(kernelIndex1 + (k-1)/2 + 1,kernelIndex2+ (l-1)/2 + 1) * extendImage(m+kernelIndex1,n+kernelIndex2,channelIndex);

				end
			end
		end
	end
end
imshow(output);

end

