# SnowStudio project for project


## Overview

VerticaDB

## Repository Structure

This repository has the following structure:

+ Project Folder
  + Source
    + src (put your original untouched source here)
    + src_modified (put your modified source here **)
  + Target (the migrated code should go here)

> NOTE: About the source code...
> Sometimes the original could be made up of several big DDLS extracts, and it might be needed to review that source, perform some "clean up " and some "code arrangement". We recommend that your put your original files in the src folder for further reference, but that you put the source that will be used for migration under src_modified.

## Repository Conventions

Both the `Source\src_modified` folder and the `Target` folder follow this convention:

Code inside this folder will be split by object type and source schema. A folder for each object type will be created:

* function
* procedure
* table
* view
* macro
* script

Inside each folder a subfolder will be created for each source database.

All folder names will be **lowercase**.
