# -*- coding: utf-8 -*-
"""
Created on Sat May  4 23:28:00 2024

@author: HP
"""
# data.to_csv()

import pandas as pd
import numpy as np
from scipy.stats import skew
from scipy.stats import kurtosis
import matplotlib.pyplot as plt
import scipy.stats as stats
from feature_engine import transformation
from scipy import stats
import pylab                 
from scipy.stats import yeojohnson

material=pd.read_csv("Dataset.csv")

material.describe()

#Datatype Checks for Columns
data_type=material.dtypes
print(data_type)





#Duplicates Checks for Columns

#It checks each row in the DataFrame material and returns True for rows that are duplicates and False for rows that are not duplicates.
duplicates = material[material.duplicated(keep=False)]

#OR

#Checks duplicates by rows
duplicate = material.duplicated()     
sum(duplicate) 









#Checking for NullValues
material.isnull().sum()

#OR

null_count_mill_tph = material['Mill TPH'].isnull().sum()
null_count_clinker_tph = material['Clinker TPH'].isnull().sum()
null_count_clinker_tph = material['Gypsum TPH'].isnull().sum()
null_count_dfa_tph = material['DFA TPH'].isnull().sum()
null_count_wfa_tph = material['WFA TPH'].isnull().sum()
null_count_mill_kw = material['Mill KW'].isnull().sum()
null_count_mill_il_temp = material['Mill I/L Temp'].isnull().sum()
null_count_mill_ol_temp = material['Mill O/L Temp'].isnull().sum()
null_count_mill_ol_be_amp = material['Mill O/L BE Amp'].isnull().sum()
null_count_mill_vent_fan_rpm = material['Mill Vent Fan RPM'].isnull().sum()
null_count_mill_vent_fan_kw = material['Mill Vent Fan KW'].isnull().sum()
null_count_mill_vent_bf_il_draft = material['Mill Vent BF I/L Draft'].isnull().sum()
null_count_mill_vent_bf_ol_draft = material['Mill Vent BF O/L Draft'].isnull().sum()
null_count_reject = material['Reject'].isnull().sum()
null_count_sep_rpm = material['Sep RPM'].isnull().sum()
null_count_sep_kw = material['Sep KW'].isnull().sum()
null_count_sep_amp = material['Sep Amp'].isnull().sum()
null_count_ca_fan_rpm = material['CA Fan RPM'].isnull().sum()
null_count_ca_fan_kw = material['CA Fan KW'].isnull().sum()
null_count_mill_folaphone = material['Mill Folaphone'].isnull().sum()
null_count_mill_il_draft = material['Mill I/L Draft'].isnull().sum()
null_count_mill_ol_draft = material['Mill O/L Draft'].isnull().sum()
null_count_sep_vent_il_draft = material['Sep. Vent I/L Draft'].isnull().sum()
null_count_sep_vent_ol_draft = material['Sep. Vent O/L Draft'].isnull().sum()
null_count_sep_vent_bag_filter_kw = material['Sep.Vent bag filter fan kw'].isnull().sum()
null_count_sep_vent_bag_filter_kw = material['Sep.Vent bag filter fan rpm'].isnull().sum()
null_count_sep_vent_bag_filter_kw = material['Residue\n(45µ)'].isnull().sum()






plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill TPH'])
plt.title('Box Plot for {}'.format('Mill TPH'))  #Outliers
plt.xlabel('{}'.format('Mill TPH'))
plt.ylabel('Values')
plt.show()


plt.figure(figsize=(8, 6))
plt.boxplot(material['Clinker TPH'])
plt.title('Box Plot for Clinker TPH')            #Outliers
plt.xlabel('Clinker TPH')
plt.ylabel('Values')
plt.show()


plt.figure(figsize=(8, 6))
plt.boxplot(material['Gypsum TPH'])
plt.title('Box Plot for Gypsum TPH')            #Outliers
plt.xlabel('Gypsum TPH')
plt.ylabel('Values')
plt.show()



plt.figure(figsize=(8, 6))
plt.boxplot(material['DFA TPH'])
plt.title('Box Plot for DFA TPH')                #Outliers
plt.xlabel('DFA TPH')
plt.ylabel('Values')
plt.show()



# 'WFA TPH'

plt.figure(figsize=(8, 6))
plt.boxplot(material['WFA TPH'])
plt.title('Box Plot for WFA TPH')                 #Outliers
plt.xlabel('WFA TPH')
plt.ylabel('Values')
plt.show()

# 'Mill KW'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill KW'])
plt.title('Box Plot for Mill KW')                    #Outliers
plt.xlabel('Mill KW')
plt.ylabel('Values')
plt.show()


# 'Mill I/L Temp'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill I/L Temp'])
plt.title('Box Plot for Mill I/L Temp')              #Outliers
plt.xlabel('Mill I/L Temp')
plt.ylabel('Values')
plt.show()

# 'Mill O/L Temp'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill O/L Temp'])
plt.title('Box Plot for Mill O/L Temp')             #Outliers
plt.xlabel('Mill O/L Temp')
plt.ylabel('Values')
plt.show()

# 'Mill O/L BE Amp'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill O/L BE Amp'])
plt.title('Box Plot for Mill O/L BE Amp')          #Outliers
plt.xlabel('Mill O/L BE Amp')
plt.ylabel('Values')
plt.show()

# 'Mill Vent Fan RPM'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill Vent Fan RPM'])
plt.title('Box Plot for Mill Vent Fan RPM')             #Outliers
plt.xlabel('Mill Vent Fan RPM')
plt.ylabel('Values')
plt.show()

# 'Mill Vent Fan KW'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill Vent Fan KW'])
plt.title('Box Plot for Mill Vent Fan KW')                 #Outliers    
plt.xlabel('Mill Vent Fan KW')
plt.ylabel('Values')
plt.show()



plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill Vent BF I/L Draft'])
plt.title('Box Plot for Mill Vent BF I/L Draft')       #Outliers
plt.xlabel('Mill Vent BF I/L Draft')
plt.ylabel('Values')
plt.show()

# 'Mill Vent BF O/L Draft'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill Vent BF O/L Draft'])
plt.title('Box Plot for Mill Vent BF O/L Draft')          #Outliers
plt.xlabel('Mill Vent BF O/L Draft')
plt.ylabel('Values')
plt.show()

# 'Reject'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Reject'])
plt.title('Box Plot for Reject')                           #Outliers
plt.xlabel('Reject')
plt.ylabel('Values')
plt.show()

# 'Sep RPM'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Sep RPM'])
plt.title('Box Plot for Sep RPM')                          #Outliers
plt.xlabel('Sep RPM')
plt.ylabel('Values')
plt.show()



plt.figure(figsize=(8, 6))
plt.boxplot(material['Sep KW'])
plt.title('Box Plot for Sep KW')                      #Outliers
plt.xlabel('Sep KW')
plt.ylabel('Values')
plt.show()

# 'Sep Amp'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Sep Amp'])
plt.title('Box Plot for Sep Amp')                    #Outliers
plt.xlabel('Sep Amp')
plt.ylabel('Values')
plt.show()

# 'CA Fan RPM'
plt.figure(figsize=(8, 6))
plt.boxplot(material['CA Fan RPM'])
plt.title('Box Plot for CA Fan RPM')                 #Outliers
plt.xlabel('CA Fan RPM')
plt.ylabel('Values')
plt.show()

# 'CA Fan KW'
plt.figure(figsize=(8, 6))
plt.boxplot(material['CA Fan KW'])
plt.title('Box Plot for CA Fan KW')                   #Outliers
plt.xlabel('CA Fan KW')
plt.ylabel('Values')
plt.show()


# 'Mill Folaphone'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill Folaphone'])
plt.title('Box Plot for Mill Folaphone')               #Outliers
plt.xlabel('Mill Folaphone')
plt.ylabel('Values')
plt.show()

# 'Mill I/L Draft'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill I/L Draft'])
plt.title('Box Plot for Mill I/L Draft')                 #Outliers
plt.xlabel('Mill I/L Draft')
plt.ylabel('Values')
plt.show()

# 'Mill O/L Draft'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Mill O/L Draft'])
plt.title('Box Plot for Mill O/L Draft')                  #Outliers
plt.xlabel('Mill O/L Draft')
plt.ylabel('Values')
plt.show()

# 'Sep. Vent I/L Draft'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Sep. Vent I/L Draft'])
plt.title('Box Plot for Sep. Vent I/L Draft')            #Outliers
plt.xlabel('Sep. Vent I/L Draft')
plt.ylabel('Values')
plt.show()



plt.figure(figsize=(8, 6))
plt.boxplot(material['Sep. Vent O/L Draft'])
plt.title('Box Plot for Sep. Vent O/L Draft')           #Outliers
plt.xlabel('Sep. Vent O/L Draft')
plt.ylabel('Values')
plt.show()

# 'Sep.Vent bag filter fan kw'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Sep.Vent bag filter fan kw'])
plt.title('Box Plot for Sep.Vent bag filter fan kw')       #Outliers
plt.xlabel('Sep.Vent bag filter fan kw')
plt.ylabel('Values')
plt.show()

# 'Sep.Vent bag filter fan rpm'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Sep.Vent bag filter fan rpm'])
plt.title('Box Plot for Sep.Vent bag filter fan rpm')        #Outliers
plt.xlabel('Sep.Vent bag filter fan rpm')
plt.ylabel('Values')
plt.show()

# 'Residue\n(45µ)'
plt.figure(figsize=(8, 6))
plt.boxplot(material['Residue\n(45µ)'])
plt.title('Box Plot for Residue\n(45µ)')                      #Outliers
plt.xlabel('Residue\n(45µ)')
plt.ylabel('Values')
plt.show()





data = pd.DataFrame()

# Outliers  Treatment for MILL TPH

from feature_engine.outliers.winsorizer import Winsorizer
winsorizer = Winsorizer(capping_method ='iqr', # choose skewed for IQR rule boundaries or gaussian for mean and std
                          tail='both', # cap left, right or both tails 
                          fold=1.5, # 1.5 times of iqr
                          variables=['Mill TPH'])
# capping_methods = 'iqr' - 25th quantile & 75th quantile
df_t1 = winsorizer.fit_transform(material[['Mill TPH']])

# we can inspect the minimum caps and maximum caps 
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_


plt.figure(figsize=(8, 6))
plt.boxplot(df_t1)
plt.title('Box Plot for {}'.format('Mill TPH'))  #Check For Outliers
plt.xlabel('{}'.format('Mill TPH'))
plt.ylabel('Values')
plt.show()



data['Mill TPH'] = df_t1



# Outliers  Treatment for Clinker TPH

from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Clinker TPH'])  # Changed 'Mill TPH' to 'Clinker TPH'

# Apply Winsorization
df_t2 = winsorizer.fit_transform(material[['Clinker TPH']])  # Changed 'Mill TPH' to 'Clinker TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(df_t2)
plt.title('Box Plot for {}'.format('Clinker TPH'))  # Changed 'Mill TPH' to 'Clinker TPH'
plt.xlabel('{}'.format('Clinker TPH'))  # Changed 'Mill TPH' to 'Clinker TPH'
plt.ylabel('Values')
plt.show()




data['Clinker TPH'] = df_t2




# Outliers  Treatment for Gypsum TPH

from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Gypsum TPH'])  # Changed 'Clinker TPH' to 'Gypsum TPH'

# Apply Winsorization
df_t3 = winsorizer.fit_transform(material[['Gypsum TPH']])  # Changed 'Clinker TPH' to 'Gypsum TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(df_t3)
plt.title('Box Plot for {}'.format('Gypsum TPH'))  # Changed 'Clinker TPH' to 'Gypsum TPH'
plt.xlabel('{}'.format('Gypsum TPH'))  # Changed 'Clinker TPH' to 'Gypsum TPH'
plt.ylabel('Values')
plt.show()


data['Gypsum TPH'] = df_t2





from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['DFA TPH'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['DFA TPH']  = winsorizer.fit_transform(material[['DFA TPH']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['DFA TPH'] )
plt.title('Box Plot for {}'.format('DFA TPH'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('DFA TPH'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['WFA TPH'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['WFA TPH'] = winsorizer.fit_transform(material[['WFA TPH']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['WFA TPH'] )
plt.title('Box Plot for {}'.format('WFA TPH'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('WFA TPH'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill KW'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill KW']  = winsorizer.fit_transform(material[['Mill KW']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill KW'] )
plt.title('Box Plot for {}'.format('Mill KW'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill KW'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill I/L Temp'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill I/L Temp']  = winsorizer.fit_transform(material[['Mill I/L Temp']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill I/L Temp'])
plt.title('Box Plot for {}'.format('Mill I/L Temp'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill I/L Temp'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill O/L Temp'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill O/L Temp'] = winsorizer.fit_transform(material[['Mill O/L Temp']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill O/L Temp'])
plt.title('Box Plot for {}'.format('Mill O/L Temp'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill O/L Temp'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()







from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill O/L BE Amp'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill O/L BE Amp'] = winsorizer.fit_transform(material[['Mill O/L BE Amp']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill O/L BE Amp'])
plt.title('Box Plot for {}'.format('Mill O/L BE Amp'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill O/L BE Amp'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill Vent Fan RPM'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill Vent Fan RPM'] = winsorizer.fit_transform(material[['Mill Vent Fan RPM']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill Vent Fan RPM'])
plt.title('Box Plot for {}'.format('Mill Vent Fan RPM'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill Vent Fan RPM'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()









from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill Vent Fan KW'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill Vent Fan KW'] = winsorizer.fit_transform(material[['Mill Vent Fan KW']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill Vent Fan KW'])
plt.title('Box Plot for {}'.format('Mill Vent Fan KW'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill Vent Fan KW'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()







from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill Vent BF I/L Draft'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill Vent BF I/L Draft'] = winsorizer.fit_transform(material[['Mill Vent BF I/L Draft']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill Vent BF I/L Draft'])
plt.title('Box Plot for {}'.format('Mill Vent BF I/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill Vent BF I/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()







from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill Vent BF O/L Draft'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill Vent BF O/L Draft'] = winsorizer.fit_transform(material[['Mill Vent BF O/L Draft']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill Vent BF O/L Draft'])
plt.title('Box Plot for {}'.format('Mill Vent BF O/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill Vent BF O/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()







from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Reject'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Reject'] = winsorizer.fit_transform(material[['Reject']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Reject'])
plt.title('Box Plot for {}'.format('Reject'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Reject'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()







from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Sep RPM'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Sep RPM'] = winsorizer.fit_transform(material[['Sep RPM']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Sep RPM'])
plt.title('Box Plot for {}'.format('Sep RPM'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Sep RPM'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()









from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Sep KW'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Sep KW'] = winsorizer.fit_transform(material[['Sep KW']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Sep KW'])
plt.title('Box Plot for {}'.format('Sep KW'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Sep KW'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Sep Amp'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Sep Amp'] = winsorizer.fit_transform(material[['Sep Amp']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Sep Amp'])
plt.title('Box Plot for {}'.format('Sep Amp'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Sep Amp'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()










from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['CA Fan RPM'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['CA Fan RPM'] = winsorizer.fit_transform(material[['CA Fan RPM']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['CA Fan RPM'])
plt.title('Box Plot for {}'.format('CA Fan RPM'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('CA Fan RPM'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['CA Fan KW'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['CA Fan KW'] = winsorizer.fit_transform(material[['CA Fan KW']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['CA Fan KW'])
plt.title('Box Plot for {}'.format('CA Fan KW'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('CA Fan KW'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill Folaphone'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill Folaphone'] = winsorizer.fit_transform(material[['Mill Folaphone']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill Folaphone'])
plt.title('Box Plot for {}'.format('Mill Folaphone'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill Folaphone'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()








from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill I/L Draft'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill I/L Draft'] = winsorizer.fit_transform(material[['Mill I/L Draft']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill I/L Draft'])
plt.title('Box Plot for {}'.format('Mill I/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill I/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Mill O/L Draft'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Mill O/L Draft'] = winsorizer.fit_transform(material[['Mill O/L Draft']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Mill O/L Draft'])
plt.title('Box Plot for {}'.format('Mill O/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Mill O/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Sep. Vent I/L Draft'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Sep. Vent I/L Draft'] = winsorizer.fit_transform(material[['Sep. Vent I/L Draft']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Sep. Vent I/L Draft'])
plt.title('Box Plot for {}'.format('Sep. Vent I/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Sep. Vent I/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()






from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Sep. Vent O/L Draft'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Sep. Vent O/L Draft'] = winsorizer.fit_transform(material[['Sep. Vent O/L Draft']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Sep. Vent O/L Draft'])
plt.title('Box Plot for {}'.format('Sep. Vent O/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Sep. Vent O/L Draft'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()




 
   

#data.to_csv()


from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Sep.Vent bag filter fan kw'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Sep.Vent bag filter fan kw'] = winsorizer.fit_transform(material[['Sep.Vent bag filter fan kw']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Sep.Vent bag filter fan kw'])
plt.title('Box Plot for {}'.format('Sep.Vent bag filter fan kw'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Sep.Vent bag filter fan kw'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()









from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Sep.Vent bag filter fan rpm'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Sep.Vent bag filter fan rpm'] = winsorizer.fit_transform(material[['Sep.Vent bag filter fan rpm']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Sep.Vent bag filter fan rpm'])
plt.title('Box Plot for {}'.format('Sep.Vent bag filter fan rpm'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Sep.Vent bag filter fan rpm'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()







from feature_engine.outliers.winsorizer import Winsorizer

# Initialize Winsorizer
winsorizer = Winsorizer(capping_method='iqr',  # choose 'skewed' for IQR rule boundaries or 'gaussian' for mean and std
                        tail='both',  # cap left, right or both tails
                        fold=1.5,  # 1.5 times of iqr
                        variables=['Residue\n(45µ)'])  # Changed 'Clinker TPH' to 'DFA TPH'

# Apply Winsorization
data['Residue\n(45µ)'] = winsorizer.fit_transform(material[['Residue\n(45µ)']])  # Changed 'Clinker TPH' to 'DFA TPH'

# Inspect the minimum caps and maximum caps
winsorizer.left_tail_caps_, winsorizer.right_tail_caps_

# Plot Box Plot
plt.figure(figsize=(8, 6))
plt.boxplot(data['Residue\n(45µ)'])
plt.title('Box Plot for {}'.format('Residue\n(45µ)'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.xlabel('{}'.format('Residue\n(45µ)'))  # Changed 'Clinker TPH' to 'DFA TPH'
plt.ylabel('Values')
plt.show()

data
data['Date Time']=material['Date & Time']




file_path = "data.csv"
# Convert the DataFrame to a CSV file without dropping the first column
data.to_csv(file_path)


#To see Whether the data is normally distributed or not


stats.probplot(data['Mill TPH'], dist="norm", plot=plt)
plt.title('Mill TPH')
plt.show()

transformed_data, lambda_value = yeojohnson(data['Mill TPH'])
# Store transformed data back in your dataframe
data['Mill TPH'] = transformed_data

stats.probplot(data['Mill TPH'], dist="norm", plot=plt)
plt.title('Mill TPH')
plt.show() 




stats.probplot(data['Clinker TPH'], dist="norm", plot=plt)
plt.title('Clinker TPH')
plt.show()


stats.probplot(data['Gypsum TPH'], dist="norm", plot=plt)
plt.title('Gypsum TPH')
plt.show()



stats.probplot(data['DFA TPH'], dist="norm", plot=plt)
plt.title('DFA TPH ')
plt.show()                                                    #Not normally Distributed


transformed_data, lambda_value = yeojohnson(data['DFA TPH'])
# Store transformed data back in your dataframe
data['DFA TPH'] = transformed_data


stats.probplot(data['DFA TPH'], dist="norm", plot=plt)
plt.title('DFA TPH')
plt.show() 







stats.probplot(data['WFA TPH'], dist="norm", plot=plt)
plt.title('WFA TPH')                                      #Not normally distributed
plt.show()

transformed_data, lambda_value = yeojohnson(data['WFA TPH'])

# Store transformed data back in your dataframe
data['WFA TPH'] = transformed_data

stats.probplot(data['WFA TPH'], dist="norm", plot=plt)
plt.title('WFA TPH')
plt.show() 



stats.probplot(data['Mill KW'], dist="norm", plot=plt)
plt.title('Mill KW')
plt.show()
                   



stats.probplot(data['Mill I/L Temp'], dist="norm", plot=plt)
plt.title('Mill I/L Temp ')
plt.show()
                   


stats.probplot(data['Mill O/L Temp'], dist="norm", plot=plt)
plt.title('Mill O/L Temp ')
plt.show()
                                 


stats.probplot(data['Mill O/L BE Amp'], dist="norm", plot=plt)
plt.title('Mill O/L BE Amp  ')
plt.show()

          



stats.probplot(data['Mill Vent Fan RPM'], dist="norm", plot=plt)
plt.title('Mill Vent Fan RPM')                  #Not Normally Distributed
plt.show()

transformed_data, lambda_value = yeojohnson(data['Mill Vent Fan RPM'])

# Store transformed data back in your dataframe

data['Mill Vent Fan RPM'] = transformed_data

stats.probplot(data['Mill Vent Fan RPM'], dist="norm", plot=plt)
plt.title('Mill Vent Fan RPM')
plt.show() 



          
                 

stats.probplot(data['Mill Vent Fan KW'], dist="norm", plot=plt)
plt.title('Mill Vent Fan KW ')                  
plt.show()
          
                                 


stats.probplot(data['Mill Vent BF I/L Draft'], dist="norm", plot=plt)
plt.title('Mill Vent BF I/L Draft ')                 
plt.show()
         

          
            
              
       
stats.probplot(data['Mill Vent BF O/L Draft'], dist="norm", plot=plt)
plt.title('Mill Vent BF I/L Draft ')                  
plt.show()
                  
      
        
stats.probplot(data['Reject'], dist="norm", plot=plt)
plt.title('Reject')                  
plt.show()
                     
        
      
        
stats.probplot(data['Sep RPM'], dist="norm", plot=plt)
plt.title('Sep RPM')                                 
plt.show()      






stats.probplot(data['Sep KW'], dist="norm", plot=plt)
plt.title('Sep KW')                                  
plt.show() 
                       
                       
   
stats.probplot(data['Sep Amp'], dist="norm", plot=plt)
plt.title('Sep Amp')                                  
plt.show() 
                       


stats.probplot(data['CA Fan RPM'], dist="norm", plot=plt)
plt.title('CA Fan RPM')                                  
plt.show() 

                       

stats.probplot(data['CA Fan KW'], dist="norm", plot=plt)
plt.title('CA Fan KW')                                  
plt.show() 


  
stats.probplot(data['Mill Folaphone'], dist="norm", plot=plt)
plt.title('Mill Folaphone')                                
plt.show() 
                  
  
transformed_data, lambda_value = yeojohnson(data['Mill Folaphone']) 

# Store transformed data back in your dataframe
data['Mill Folaphone'] = transformed_data

stats.probplot(data['Mill Folaphone'], dist="norm", plot=plt)
plt.title('Mill Folaphone')
plt.show() 


                
                  
                
                  
stats.probplot(data['Mill I/L Draft'], dist="norm", plot=plt)
plt.title('Mill I/L Draft')                             
plt.show() 

transformed_data, lambda_value = yeojohnson(data['Mill I/L Draft'])

# Store transformed data back in your dataframe
data['Mill I/L Draft'] = transformed_data

stats.probplot(data['Mill I/L Draft'], dist="norm", plot=plt)
plt.title('Mill I/L Draft')
plt.show() 





stats.probplot(data['Mill O/L Draft'], dist="norm", plot=plt)
plt.title('Mill O/L Draft')                             
plt.show()                                



  


                                                   
                
                    
stats.probplot(data['Sep. Vent I/L Draft'], dist="norm", plot=plt)
plt.title('Sep. Vent I/L Draft')                             
plt.show()                                  #Not Normally Distributed


transformed_data, lambda_value = yeojohnson(data['Sep. Vent I/L Draft'])

# Store transformed data back in your dataframe
data['Sep. Vent I/L Draft'] = transformed_data

stats.probplot(data['Sep. Vent I/L Draft'], dist="norm", plot=plt)
plt.title('Sep. Vent I/L Draft')
plt.show() 




stats.probplot(data['Sep. Vent O/L Draft'], dist="norm", plot=plt)
plt.title('Sep. Vent O/L Draft')                             
plt.show()                                 

                



stats.probplot(data['Sep.Vent bag filter fan kw'], dist="norm", plot=plt)
plt.title('Sep.Vent bag filter fan kw')                             
plt.show()                                  #Not Normally Distributed

transformed_data, lambda_value = yeojohnson(data['Sep.Vent bag filter fan kw'])

# Store transformed data back in your dataframe
data['Sep.Vent bag filter fan kw'] = transformed_data

stats.probplot(data['Sep.Vent bag filter fan kw'], dist="norm", plot=plt)
plt.title('Sep.Vent bag filter fan kw')
plt.show() 


stats.probplot(data['Sep.Vent bag filter fan rpm'], dist="norm", plot=plt)
plt.title('Sep.Vent bag filter fan rpm')                             
plt.show()                                  #Not Normally Distributed

transformed_data, lambda_value = yeojohnson(data['Sep.Vent bag filter fan rpm'])

# Store transformed data back in your dataframe
data['Sep.Vent bag filter fan rpm'] = transformed_data

stats.probplot(data['Sep.Vent bag filter fan rpm'], dist="norm", plot=plt)
plt.title('Sep.Vent bag filter fan rpm')
plt.show()                               

            

stats.probplot(data['Residue\n(45µ)'], dist="norm", plot=plt)
plt.title('Residue\n(45µ)')                             
plt.show()                                 

        

        

#AUTO EDA


pip install dtale
import dtale
import pandas as pd


d = dtale.show(data)
d.open_browser()



file_path = "data.csv"
# Convert the DataFrame to a CSV file
data.to_csv(file_path, index=False) 





df = data.select_dtypes(exclude=['object'])

mean_values = df.mean()

# Calculate median for each column
median_values = df.median()

# Calculate mode for each column
mode_values = df.mode()

# Calculate variance for each column
variance_values = df.var()

# Calculate skewness for each column
skewness_values = df.skew()

# Calculate kurtosis for each column
kurtosis_values = df.kurt()

# Combine all results into one DataFrame
statistics_df = pd.DataFrame({
    'Mean': mean_values,
    'Median': median_values,
    'Mode': mode_values.iloc[0],  # Mode returns DataFrame, but we need Series
    'Variance': variance_values,
    'Skew': skewness_values,
    'Kurtosis': kurtosis_values
})

# Display the statistics
a=(statistics_df)
a.reset_index(drop=False,inplace=True)
a.to_csv('new1.csv',index=False)
