function outputImage = warp_image_2d(inputImage,A)
% WARP_IMAGE_2D Apply a 2-by-2 matrix to image coordinates.
%
% outputImage = warp_image_2d(inputImage,A)
%
% The image centre is treated as the origin.  For each output pixel y, the
% code finds the source coordinate x from A*x = y and interpolates the input.
% This inverse mapping avoids gaps in the output image.

if ~isequal(size(A),[2 2])
    error('A must be a 2-by-2 matrix.')
end

if abs(det(A)) < 1e-12
    warning(['A is singular.  A complete inverse image warp is impossible. ' ...
             'A near-singular approximation will be used for display.'])
    A = A + 1e-6*eye(2);
end

[numberOfRows,numberOfColumns] = size(inputImage);
centreColumn = (numberOfColumns+1)/2;
centreRow = (numberOfRows+1)/2;

[columnGrid,rowGrid] = meshgrid(1:numberOfColumns,1:numberOfRows);

% Use ordinary Cartesian coordinates: x points right and y points upward.
xOutput = columnGrid-centreColumn;
yOutput = centreRow-rowGrid;

sourceCoordinates = A\[xOutput(:).'; yOutput(:).'];
xSource = reshape(sourceCoordinates(1,:),numberOfRows,numberOfColumns);
ySource = reshape(sourceCoordinates(2,:),numberOfRows,numberOfColumns);

columnSource = xSource+centreColumn;
rowSource = centreRow-ySource;

outputImage = interp2(columnGrid,rowGrid,inputImage, ...
                      columnSource,rowSource,'linear',0);
end