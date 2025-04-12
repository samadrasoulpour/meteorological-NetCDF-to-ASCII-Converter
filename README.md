# NetCDF to ASCII Converter

This MATLAB script converts NetCDF (.nc) files containing meteorological data (e.g., evaporation and total precipitation) into an ASCII text file format.

## Description
- **Input**: NetCDF file (`Evaporation, Total precipitation.nc`)
- **Output**: ASCII text file (`TotalPrecipitation.txt`) with precipitation data formatted for specific requirements.
- **Dependencies**: Requires the [NCTOOLBOX](https://github.com/nctoolbox/nctoolbox) MATLAB library.
- **Author**: Samad Rasoulpour
- **Date**: 1401/02/30 (Persian calendar, ~May 20, 2022)

## Functionality
1. Reads variables (`tp`, `latitude`, `longitude`, `time`) from the NetCDF file.
2. Converts precipitation data (`tp`) from meters to millimeters.
3. Adjusts time data based on ECMWF's 1900/1/1 origin.
4. Writes data to an ASCII file with headers defining:
   - Geographic coordinates (origin: 48.0869, 22.0041)
   - Time axis (equidistant)
   - Grid points and spacing
   - Precipitation rate in mm/h
5. Outputs a structured ASCII file with precipitation data for each time step, latitude, and longitude.

## Usage
1. Ensure NCTOOLBOX is installed in MATLAB.
2. Place the NetCDF file (`Evaporation, Total precipitation.nc`) in the same directory as the script.
3. Run the script in MATLAB:
>> run('netcdf_to_ascii_Precip.m')

The output file TotalPrecipitation.txt will be generated in the same directory.

Notes
The script assumes the NetCDF file follows ECMWF conventions for time origin (1900/1/1).

The output ASCII format includes specific metadata (e.g., Geo, Time, Spacing) tailored for a particular application.

Elapsed time for processing is displayed using tic and toc.


This README provides a clear overview of the script's purpose, usage, and structure without modifying the original code. Save it as `REA

