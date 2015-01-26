### Packages ###
This script should import **data.table** package.

### Data Source ###
It read origin data from **train** and **test** folder and use rbind/cbind to merge them together.

**features** descripts its column name while **activity_labels** shows *_y's value

### Logic ###
Rbinding train and test's x and greping 'mean()|std()', we get extractdata.x.

Rbinding train and test's y and replacing their id with activity_label, we get alldata.y.

Rbinding train and test's subject, we get alldata.subject.

Cbinding three data above, we get extractdata finally.