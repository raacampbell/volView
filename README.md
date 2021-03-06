# volView
This is a simple image stack visualizer for MATLAB. 
It is based upon [imshow3Dfull](https://www.mathworks.com/matlabcentral/fileexchange/47463-imshow3dfull). 
Compared to that project this has the following significant changes:
* `imshow3Dfull` is now a class called `volView` to ease further development
* Code massively refactored, mainly to remove redundancy, and also cleaned up to get rid of things like unnecessary type conversions.
* Most variables renamed for clarity
* Renamed views from Coronal, Sagittal and Axial since the validity of these labels depends on the orientation of the dataset and there is no reason to expect datasets to be anatomical. 


<img src="images/screenShot.jpg" />

### Features
* Last viewed slice in other views displayed with a colored line
* Optional overlay of line data over image


### Usage
To quickly try the viewer using a demo mouse brain dataset run:
```
>> volView;
```
The data set is downloaded from the web but cached locally to allow the command to be re-run faster in future.
You can use the methods of the class to load a different image to an already started session as follows:

```
>> load mri % Loads MRI image as matrix "D"
>> V=volView; % Displays demo mouse brain
Loading demo stack from disk...................
>> V.displayNewImageStack(squeeze(D)) % Now display the MRI image
>> V.displayNewImageStack(squeeze(D),[5,30]) % Again but with different look-up table
>> delete(V) % Close the GUI at the command line
```

A further example:
```
>> cd examples
>> v=volView(makeSpheres); %Scroll and look at different views
% Generate new sphere data and view it
>> v.displayNewImageStack(makeSpheres);
>> v.displayNewImageStack(makeSpheres);
```

### Installation
Simply add the repository's `code` directory to your MATLAB path. 
There is no need to add the `examples` or `images` directories to your path. 


### Planned changes
* Improved slider behavior with listener and `PostSet` so image updates whilst slider is being moved.
* Add a true auto-contrast button, possibly with a histogram. 
* Allow for non-square pixels.
* Explore whether the `figureResized` callback can be removed by using relative positioning.


### Contributing
Clone. Checkout `dev` branch. Make changes. File pull request. 
