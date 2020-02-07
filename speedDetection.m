foregroundDetector = vision.ForegroundDetector('NumGaussians', 3, ...
    'NumTrainingFrames', 50);

videoReader = vision.VideoFileReader('visiontraffic.avi');
implay('visiontraffic.avi');

blobAnalysis = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', 150);

centroidAnalysis = vision.BlobAnalysis('AreaOutputPort', false, 'CentroidOutputPort', true, ...
    'MinimumBlobArea', 150);
videoPlayer = vision.VideoPlayer('Name', 'Detected Cars');
videoPlayer.Position(3:4) = [650,400];  % window size: [width, height]
se = strel('rectangle', [3 5]); % morphological filter for noise removal

nsize=0;
k=0;
j=0;
cnt=1;
while ~isDone(videoReader)

    frame = step(videoReader); % read the next video frame
    k=k+1;
    nframes=k;
    % Detect the foreground in the current video frame
    foreground = step(foregroundDetector, frame);

    % Use morphological opening to remove noise in the foreground
    filteredForeground = imopen(foreground, se);

    % Detect the connected components with the specified minimum area, and
    % compute their bounding boxes
        
    bbox = step(blobAnalysis, filteredForeground);
    
    cbox = step(centroidAnalysis, filteredForeground);
    % Draw bounding boxes around the detected cars
    result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');
        
    j=1;
    % Display the number of cars found in the video frame
    numCars = size(bbox, 1);
    if(numCars>0)
        i=1;
        
         nsize=size(cbox,1)+nsize;    
          prev_x=zeros(nsize,1);
          prev_y=zeros(nsize,1);
%         while(j<=(size(cbox,1)))
%                        
%             prev_x(nsize,1)=cbox(j,1); 
%              prev_y(nsize,1)=cbox(j,2);
%             j=j+1;
%          end
%       if(k>1)      
%           Dist(k)=((prev_x(k,1)-prev_x(k-1,1))^2+(prev_y(k,1)-prev_y(k-1,1))^2)^(1/2);
%            Speed(k)=3.6*Dist(k)* 30/531;
%       end
         
      result=insertText(result, [10 10],numCars,'BoxOpacity', 1, ...
           'FontSize', 14);
%         while(i~=numCars)
%             result = insertText(result, [cbox(i,1) cbox(i,2)], i, 'BoxOpacity', 1, ...
%             'FontSize', 14);
%         i=i+1;
%      
%         end
    else
        fsum=0;
         result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
        'FontSize', 14);
    
    end

    
    
    
    
    
    
    
    step(videoPlayer, result);  % display the results
end
release(videoReader); % close the video file
nsize=0;
k=0;
j=0;
cnt=1;

videoReader = vision.VideoFileReader('visiontraffic.avi');
while ~isDone(videoReader)

    frame = step(videoReader); % read the next video frame
    k=k+1;
    nframes=k;
    % Detect the foreground in the current video frame
    foreground = step(foregroundDetector, frame);

    % Use morphological opening to remove noise in the foreground
    filteredForeground = imopen(foreground, se);

    % Detect the connected components with the specified minimum area, and
    % compute their bounding boxes
        
    bbox = step(blobAnalysis, filteredForeground);
    
    cbox = step(centroidAnalysis, filteredForeground);
    % Draw bounding boxes around the detected cars
    result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');
        
    j=1;
    % Display the number of cars found in the video frame
    numCars = size(bbox, 1);
    if(numCars>0)
        i=1;
        
         nsize=size(cbox,1)+nsize;    
%           prev_x=zeros(nsize,1);
%           prev_y=zeros(nsize,1);
        while(j<=(size(cbox,1)))
                       
            prev_x(nsize,1)=cbox(j,1); 
             prev_y(nsize,1)=cbox(j,2);
            j=j+1;
         end
      if(k>1)      
          Dist(k)=((prev_x(k,1)-prev_x(k-1,1))^2+(prev_y(k,1)-prev_y(k-1,1))^2)^(1/2);
           Speed(k)=3.6*Dist(k)* 30/531;
      end
         
      result=insertText(result, [10 10],numCars,'BoxOpacity', 1, ...
           'FontSize', 14);

    else
        fsum=0;
         result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
        'FontSize', 14);
    
    end

    
    
    
    
    
    
    
    step(videoPlayer, result);  % display the results
end
release(videoReader); % close the video file
videoReader = vision.VideoFileReader('visiontraffic.avi');
kk=0;
max=0;
pos1=1;
pos2=1;
find11=1;
kp=1;
j=1;
fspeed(find11)=0;
while ~isDone(videoReader)

            frame = step(videoReader); % read the next video frame
            kk=kk+1;
            % Detect the foreground in the current video frame
            foreground = step(foregroundDetector, frame);

            % Use morphological opening to remove noise in the foreground
            filteredForeground = imopen(foreground, se);

            bbox = step(blobAnalysis, filteredForeground);

            cbox = step(centroidAnalysis, filteredForeground);
            result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');
            numCars = size(bbox, 1);
     
            
            
            if(numCars>0)

              result=insertText(result, [10 10],numCars,'BoxOpacity', 1, ...
                   'FontSize', 14);
            else
                fsum=0;
                 result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
                'FontSize', 14);

            end

            
            
            
            
        while(kp<nframes)

            if(Speed(kp)~=0)
                pos1=kp;
                pos2=kp;
                kp=kp+1;
                while(Speed(kp)~=0 && kp<nframes)
                    pos2=pos2+1;
                    if(kp<nframes)
                        kp=kp+1;
                    end
                end
                for ii=pos1:1:pos2
                    if(Speed(ii)>Speed(ii-1))
                        max=Speed(ii);
                    end
                end
               % disp(max)
                fspeed(find11)=max;
                
              
                find11=find11+1;
            
            else                  
                kp=kp+1;
            end
            
        end
  
    step(videoPlayer, result);
        
end

release(videoReader); % close the video file
