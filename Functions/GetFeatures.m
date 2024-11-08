function Features = GetFeatures(window_size, D, signals)
    % Creates a feature matrix with mean, min, max from a window of data,
    % from whichever signal names are passed.
    arguments
        window_size double
        D table
        signals string
    end
    
    %Pre allocate feature matrix
    Features = NaN(9001,32);
    colIndex = 1;
    
    for i = 1:length(signals)
        if size(D.(signals(i)),2) > 1
            %iterate through signals with 3 axes
            
            for j = 1:min(size(D.(signals(i))))
                for k = 155:length(D.(signals(i))(:,j))
                    avg = mean(D.(signals(i))(k-window_size:k,j));
                    upperLim = max(D.(signals(i))(k-window_size:k,j));
                    lowerLim = min(D.(signals(i))(k-window_size:k,j));
                    inst = D.(signals(i))(k,j);

                    Features(k, colIndex:colIndex+3) = [avg, upperLim, lowerLim, inst];
                end
                colIndex = colIndex + 4; 
            end
        else
            %Else iterate through length of 1D array
            for k = 155:max(size(D.(signals(i))))
                avg = mean(D.(signals(i))(k-window_size:k));
                upperLim = max(D.(signals(i))(k-window_size:k));
                lowerLim = min(D.(signals(i))(k-window_size:k));
                inst = D.(signals(i))(k);

                Features(k, colIndex:colIndex+3) = [avg, upperLim, lowerLim, inst];
            end
            colIndex = colIndex + 4;
        end
    end
end

