# -*- coding: utf-8 -*-
"""
Created on Sat May  4 07:45:49 2024

@author: HP
"""

import pandas as pd
import numpy as np
from scipy.stats import skew
from scipy.stats import kurtosis

material=pd.read_csv("Dataset.csv")

data_type=material.dtypes

print(material.columns)

material['Mill I/L Draft'] = material['Mill I/L Draft'].astype(float)




#Checks for duplicates
duplicate = material.duplicated()     
sum(duplicate) 



#Checking for NullValues
material.isnull().sum()





#Finding Mean Values

Mill_TPH_mean=material['Mill TPH'].mean()
Clinker_TPH_mean=material['Clinker TPH'].mean()
Gypsum_mean=material['Gypsum TPH'].mean()
DFA_TPH_mean=material['DFA TPH'].mean()
WFA_TPH_mean=material['WFA TPH'].mean()
Mill_KW_mean=material['Mill KW'].mean()
Mill_I_L_Temp_KW_mean=material['Mill I/L Temp'].mean()
Mill_O_L_Temp_mean=material['Mill O/L Temp'].mean()
Mill_O_L_BE_Amp_mean=material['Mill O/L BE Amp'].mean()
Mill_Vent_Fan_RPM_mean=material['Mill Vent Fan RPM'].mean()
Mill_Vent_Fan_KW_mean=material['Mill Vent Fan KW'].mean()
Mill_Vent_BF_I_L_Draft_mean=material['Mill Vent BF I/L Draft'].mean()
Mill_Vent_BF_O_L_Draft_mean=material['Mill Vent BF O/L Draft'].mean()
Reject_mean=material['Reject'].mean()
Sep_RPM_mean=material['Sep RPM'].mean()
Sep_KW_mean=material['Sep KW'].mean()
Sep_Amp_mean=material['Sep Amp'].mean()
CA_Fan_RPM_mean=material['CA Fan RPM'].mean()
CA_Fan_KW_mean=material['CA Fan KW'].mean()
Mill_Folaphone_mean=material['Mill Folaphone'].mean()
Mill_I_L_Draft_mean=material['Mill I/L Draft'].mean()
Mill_O_L_Draft_mean=material['Mill O/L Draft'].mean()
Sep_Vent_I_L_Draft_mean=material['Sep. Vent I/L Draft'].mean()
Sep_Vent_O_L_Draft_mean=material['Sep. Vent O/L Draft'].mean()
Sep_Vent_bag_filter_fan_kw_mean=material['Sep.Vent bag filter fan kw'].mean()
Sep_Vent_bag_filter_fan_rpm_mean=material['Sep.Vent bag filter fan rpm'].mean()
Residue_mean=material['Residue\n(45µ)'].mean()





#Median

Mill_TPH_median = material['Mill TPH'].median()
Clinker_TPH_median = material['Clinker TPH'].median()
Gypsum_median = material['Gypsum TPH'].median()
DFA_TPH_median = material['DFA TPH'].median()
WFA_TPH_median = material['WFA TPH'].median()
Mill_KW_median = material['Mill KW'].median()
Mill_I_L_Temp_KW_median = material['Mill I/L Temp'].median()
Mill_O_L_Temp_median = material['Mill O/L Temp'].median()
Mill_O_L_BE_Amp_median = material['Mill O/L BE Amp'].median()
Mill_Vent_Fan_RPM_median = material['Mill Vent Fan RPM'].median()
Mill_Vent_Fan_KW_median = material['Mill Vent Fan KW'].median()
Mill_Vent_BF_I_L_Draft_median = material['Mill Vent BF I/L Draft'].median()
Mill_Vent_BF_O_L_Draft_median = material['Mill Vent BF O/L Draft'].median()
Reject_median = material['Reject'].median()
Sep_RPM_median = material['Sep RPM'].median()
Sep_KW_median = material['Sep KW'].median()
Sep_Amp_median = material['Sep Amp'].median()
CA_Fan_RPM_median = material['CA Fan RPM'].median()
CA_Fan_KW_median = material['CA Fan KW'].median()
Mill_Folaphone_median = material['Mill Folaphone'].median()
Mill_I_L_Draft_median = material['Mill I/L Draft'].median()
Mill_O_L_Draft_median = material['Mill O/L Draft'].median()
Sep_Vent_I_L_Draft_median = material['Sep. Vent I/L Draft'].median()
Sep_Vent_O_L_Draft_median = material['Sep. Vent O/L Draft'].median()
Sep_Vent_bag_filter_fan_kw_median = material['Sep.Vent bag filter fan kw'].median()
Sep_Vent_bag_filter_fan_rpm_median = material['Sep.Vent bag filter fan rpm'].median()
Residue_median = material['Residue\n(45µ)'].median()




#Mode

Mill_TPH_mode = material['Mill TPH'].mode()
Clinker_TPH_mode = material['Clinker TPH'].mode()
Gypsum_mode = material['Gypsum TPH'].mode()
DFA_TPH_mode = material['DFA TPH'].mode()
WFA_TPH_mode = material['WFA TPH'].mode()
Mill_KW_mode = material['Mill KW'].mode()
Mill_I_L_Temp_KW_mode = material['Mill I/L Temp'].mode()
Mill_O_L_Temp_mode = material['Mill O/L Temp'].mode()
Mill_O_L_BE_Amp_mode = material['Mill O/L BE Amp'].mode()
Mill_Vent_Fan_RPM_mode = material['Mill Vent Fan RPM'].mode()
Mill_Vent_Fan_KW_mode = material['Mill Vent Fan KW'].mode()
Mill_Vent_BF_I_L_Draft_mode = material['Mill Vent BF I/L Draft'].mode()
Mill_Vent_BF_O_L_Draft_mode = material['Mill Vent BF O/L Draft'].mode()
Reject_mode = material['Reject'].mode()
Sep_RPM_mode = material['Sep RPM'].mode()
Sep_KW_mode = material['Sep KW'].mode()
Sep_Amp_mode = material['Sep Amp'].mode()
CA_Fan_RPM_mode = material['CA Fan RPM'].mode()
CA_Fan_KW_mode = material['CA Fan KW'].mode()
Mill_Folaphone_mode = material['Mill Folaphone'].mode()
Mill_I_L_Draft_mode = material['Mill I/L Draft'].mode()
Mill_O_L_Draft_mode = material['Mill O/L Draft'].mode()
Sep_Vent_I_L_Draft_mode = material['Sep. Vent I/L Draft'].mode()
Sep_Vent_O_L_Draft_mode = material['Sep. Vent O/L Draft'].mode()
Sep_Vent_bag_filter_fan_kw_mode = material['Sep.Vent bag filter fan kw'].mode()
Sep_Vent_bag_filter_fan_rpm_mode = material['Sep.Vent bag filter fan rpm'].mode()
Residue_mode = material['Residue\n(45µ)'].mode()





#Variance

Mill_TPH_var = material['Mill TPH'].var()
Clinker_TPH_var = material['Clinker TPH'].var()
Gypsum_var = material['Gypsum TPH'].var()
DFA_TPH_var = material['DFA TPH'].var()
WFA_TPH_var = material['WFA TPH'].var()
Mill_KW_var = material['Mill KW'].var()
Mill_I_L_Temp_KW_var = material['Mill I/L Temp'].var()
Mill_O_L_Temp_var = material['Mill O/L Temp'].var()
Mill_O_L_BE_Amp_var = material['Mill O/L BE Amp'].var()
Mill_Vent_Fan_RPM_var = material['Mill Vent Fan RPM'].var()
Mill_Vent_Fan_KW_var = material['Mill Vent Fan KW'].var()
Mill_Vent_BF_I_L_Draft_var = material['Mill Vent BF I/L Draft'].var()
Mill_Vent_BF_O_L_Draft_var = material['Mill Vent BF O/L Draft'].var()
Reject_var = material['Reject'].var()
Sep_RPM_var = material['Sep RPM'].var()
Sep_KW_var = material['Sep KW'].var()
Sep_Amp_var = material['Sep Amp'].var()
CA_Fan_RPM_var = material['CA Fan RPM'].var()
CA_Fan_KW_var = material['CA Fan KW'].var()
Mill_Folaphone_var = material['Mill Folaphone'].var()
Mill_I_L_Draft_var = material['Mill I/L Draft'].var()
Mill_O_L_Draft_var = material['Mill O/L Draft'].var()
Sep_Vent_I_L_Draft_var = material['Sep. Vent I/L Draft'].var()
Sep_Vent_O_L_Draft_var = material['Sep. Vent O/L Draft'].var()
Sep_Vent_bag_filter_fan_kw_var = material['Sep.Vent bag filter fan kw'].var()
Sep_Vent_bag_filter_fan_rpm_var = material['Sep.Vent bag filter fan rpm'].var()
Residue_var = material['Residue\n(45µ)'].var()





#Standard Deviation

Mill_TPH_std = material['Mill TPH'].std()
Clinker_TPH_std = material['Clinker TPH'].std()
Gypsum_std = material['Gypsum TPH'].std()
DFA_TPH_std = material['DFA TPH'].std()
WFA_TPH_std = material['WFA TPH'].std()
Mill_KW_std = material['Mill KW'].std()
Mill_I_L_Temp_KW_std = material['Mill I/L Temp'].std()
Mill_O_L_Temp_std = material['Mill O/L Temp'].std()
Mill_O_L_BE_Amp_std = material['Mill O/L BE Amp'].std()
Mill_Vent_Fan_RPM_std = material['Mill Vent Fan RPM'].std()
Mill_Vent_Fan_KW_std = material['Mill Vent Fan KW'].std()
Mill_Vent_BF_I_L_Draft_std = material['Mill Vent BF I/L Draft'].std()
Mill_Vent_BF_O_L_Draft_std = material['Mill Vent BF O/L Draft'].std()
Reject_std = material['Reject'].std()
Sep_RPM_std = material['Sep RPM'].std()
Sep_KW_std = material['Sep KW'].std()
Sep_Amp_std = material['Sep Amp'].std()
CA_Fan_RPM_std = material['CA Fan RPM'].std()
CA_Fan_KW_std = material['CA Fan KW'].std()
Mill_Folaphone_std = material['Mill Folaphone'].std()
Mill_I_L_Draft_std = material['Mill I/L Draft'].std()
Mill_O_L_Draft_std = material['Mill O/L Draft'].std()
Sep_Vent_I_L_Draft_std = material['Sep. Vent I/L Draft'].std()
Sep_Vent_O_L_Draft_std = material['Sep. Vent O/L Draft'].std()
Sep_Vent_bag_filter_fan_kw_std = material['Sep.Vent bag filter fan kw'].std()
Sep_Vent_bag_filter_fan_rpm_std = material['Sep.Vent bag filter fan rpm'].std()
Residue_std = material['Residue\n(45µ)'].std()







#Range

Mill_TPH_range = material['Mill TPH'].max() - material['Mill TPH'].min()
Clinker_TPH_range = material['Clinker TPH'].max() - material['Clinker TPH'].min()
Gypsum_TPH_range = material['Gypsum TPH'].max() - material['Gypsum TPH'].min()
DFA_TPH_range = material['DFA TPH'].max() - material['DFA TPH'].min()
WFA_TPH_range = material['WFA TPH'].max() - material['WFA TPH'].min()
Mill_KW_range = material['Mill KW'].max() - material['Mill KW'].min()
Mill_IL_Temp_range = material['Mill I/L Temp'].max() - material['Mill I/L Temp'].min()
Mill_OL_Temp_range = material['Mill O/L Temp'].max() - material['Mill O/L Temp'].min()
Mill_OL_BE_Amp_range = material['Mill O/L BE Amp'].max() - material['Mill O/L BE Amp'].min()
Mill_Vent_Fan_RPM_range = material['Mill Vent Fan RPM'].max() - material['Mill Vent Fan RPM'].min()
Mill_Vent_Fan_KW_range = material['Mill Vent Fan KW'].max() - material['Mill Vent Fan KW'].min()
Mill_Vent_BF_IL_Draft_range = material['Mill Vent BF I/L Draft'].max() - material['Mill Vent BF I/L Draft'].min()
Mill_Vent_BF_OL_Draft_range = material['Mill Vent BF O/L Draft'].max() - material['Mill Vent BF O/L Draft'].min()
Reject_range = material['Reject'].max() - material['Reject'].min()
Sep_RPM_range = material['Sep RPM'].max() - material['Sep RPM'].min()
Sep_KW_range = material['Sep KW'].max() - material['Sep KW'].min()
Sep_Amp_range = material['Sep Amp'].max() - material['Sep Amp'].min()
CA_Fan_RPM_range = material['CA Fan RPM'].max() - material['CA Fan RPM'].min()
CA_Fan_KW_range = material['CA Fan KW'].max() - material['CA Fan KW'].min()
Mill_Folaphone_range = material['Mill Folaphone'].max() - material['Mill Folaphone'].min()
Mill_IL_Draft_range = material['Mill I/L Draft'].max() - material['Mill I/L Draft'].min()
Mill_OL_Draft_range = material['Mill O/L Draft'].max() - material['Mill O/L Draft'].min()
Sep_Vent_IL_Draft_range = material['Sep. Vent I/L Draft'].max() - material['Sep. Vent I/L Draft'].min()
Sep_Vent_OL_Draft_range = material['Sep. Vent O/L Draft'].max() - material['Sep. Vent O/L Draft'].min()
Sep_Vent_bag_filter_fan_kw_range = material['Sep.Vent bag filter fan kw'].max() - material['Sep.Vent bag filter fan kw'].min()
Sep_Vent_bag_filter_fan_rpm_range = material['Sep.Vent bag filter fan rpm'].max() - material
Residue_45_range = material['Residue\n(45µ)'].max() - material['Residue\n(45µ)'].min()






#Skewness

milltph_skewed = skew(material['Mill TPH'])
clinker_tph_skewed = skew(material['Clinker TPH'])
gypsum_tph_skewed = skew(material['Gypsum TPH'])
dfa_tph_skewed = skew(material['DFA TPH'])
wfa_tph_skewed = skew(material['WFA TPH'])
mill_kw_skewed = skew(material['Mill KW'])
mill_il_temp_skewed = skew(material['Mill I/L Temp'])
mill_ol_temp_skewed = skew(material['Mill O/L Temp'])
mill_ol_be_amp_skewed = skew(material['Mill O/L BE Amp'])
mill_vent_fan_rpm_skewed = skew(material['Mill Vent Fan RPM'])
mill_vent_fan_kw_skewed = skew(material['Mill Vent Fan KW'])
mill_vent_bf_il_draft_skewed = skew(material['Mill Vent BF I/L Draft'])
mill_vent_bf_ol_draft_skewed = skew(material['Mill Vent BF O/L Draft'])
reject_skewed = skew(material['Reject'])
sep_rpm_skewed = skew(material['Sep RPM'])
sep_kw_skewed = skew(material['Sep KW'])
sep_amp_skewed = skew(material['Sep Amp'])
ca_fan_rpm_skewed = skew(material['CA Fan RPM'])
ca_fan_kw_skewed = skew(material['CA Fan KW'])
mill_folaphone_skewed = skew(material['Mill Folaphone'])
mill_il_draft_skewed = skew(material['Mill I/L Draft'])
mill_ol_draft_skewed = skew(material['Mill O/L Draft'])
sep_vent_il_draft_skewed = skew(material['Sep. Vent I/L Draft'])
sep_vent_ol_draft_skewed = skew(material['Sep. Vent O/L Draft'])
sep_vent_bag_filter_fan_kw_skewed = skew(material['Sep.Vent bag filter fan kw'])
sep_vent_bag_filter_fan_rpm_skewed = skew(material['Sep.Vent bag filter fan rpm'])
residue_skewed = skew(material['Residue\n(45µ)'])



#Kurtosis

Mill_TPH_kurtosis = material['Mill TPH'].kurtosis()
clinker_tph_kurtosis = material['Clinker TPH'].kurtosis()
gypsum_tph_kurtosis = material['Gypsum TPH'].kurtosis()
dfa_tph_kurtosis = material['DFA TPH'].kurtosis()
wfa_tph_kurtosis = material['WFA TPH'].kurtosis()
mill_kw_kurtosis = material['Mill KW'].kurtosis()
mill_il_temp_kurtosis = material['Mill I/L Temp'].kurtosis()
mill_ol_temp_kurtosis = material['Mill O/L Temp'].kurtosis()
mill_ol_be_amp_kurtosis = material['Mill O/L BE Amp'].kurtosis()
mill_vent_fan_rpm_kurtosis = material['Mill Vent Fan RPM'].kurtosis()
mill_vent_fan_kw_kurtosis = material['Mill Vent Fan KW'].kurtosis()
mill_vent_bf_il_draft_kurtosis = material['Mill Vent BF I/L Draft'].kurtosis()
mill_vent_bf_ol_draft_kurtosis = material['Mill Vent BF O/L Draft'].kurtosis()
reject_kurtosis = material['Reject'].kurtosis()
sep_rpm_kurtosis = material['Sep RPM'].kurtosis()
sep_kw_kurtosis = material['Sep KW'].kurtosis()
sep_amp_kurtosis = material['Sep Amp'].kurtosis()
ca_fan_rpm_kurtosis = material['CA Fan RPM'].kurtosis()
ca_fan_kw_kurtosis = material['CA Fan KW'].kurtosis()
mill_folaphone_kurtosis = material['Mill Folaphone'].kurtosis()
mill_il_draft_kurtosis = material['Mill I/L Draft'].kurtosis()
mill_ol_draft_kurtosis = material['Mill O/L Draft'].kurtosis()
sep_vent_il_draft_kurtosis = material['Sep. Vent I/L Draft'].kurtosis()
sep_vent_ol_draft_kurtosis = material['Sep. Vent O/L Draft'].kurtosis()
sep_vent_bag_filter_fan_kw_kurtosis = material['Sep.Vent bag filter fan kw'].kurtosis()
sep_vent_bag_filter_fan_rpm_kurtosis = material['Sep.Vent bag filter fan rpm'].kurtosis()
residue_kurtosis = material['Residue\n(45µ)'].kurtosis()





#AUTO EDA

pip install dtale
import dtale
import pandas as pd


d = dtale.show(material)
d.open_browser()







df = material.select_dtypes(exclude=['object'])

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
