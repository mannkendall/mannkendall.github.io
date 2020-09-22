
Spirit of mannkendall
=====================

A high level description of what the code does.

Data constraints to apply the Mann-Kendall test:

The Mann-Kendall (MK) test associated with the Sen’s slope is the most widely applied non-parametric trend analysis method in atmospheric and hydrologic research (Gilbert, 1987; Sirois, 1998). While it has no requirement on data distribution, it must be applied on serially independent and identically distributed variables. The second condition of homogeneity of distribution is not met if a seasonality is present, but it can be solved by using the seasonal Mann-Kendall test developed by Hirsch et al. (1982). The first condition of independence is not met if the data are autocorrelated. Algorithms were then developed to reduce the impact of the autocorrelation artifacts on the statistical significance of the MK test and on the Sen's slope. Two kinds of algorithms are usually used: (i) the prewhitening of the data to remove the autocorrelation and (ii) inflation of the variance of the trend test statistic to take into account the number of independent measurements instead of the number of data points (the autocorrelation reduces the number of degrees of freedom in tests). This Mann-Kendall package propose several prewhitening methods.

The problem of autocorrelation in the Mann-Kendall test:

The MK-test determines the validity of the null hypothesis H0 of the absence of a trend against the alternative hypothesis H1 of the existence of a monotonic continuous trend. While no assumptions are needed about the data distribution (i.e., the definition of a non-parametric test), the MK-test does require that the data are serially independent, namely the absence of autocorrelation in the time series. Statistical tests are prone to two types of error. The first is an incorrect rejection of the null hypothesis H0 that is called “type 1 error”. This error is related to a too high statistical significance leading to false positive cases. The second is an incorrect acceptance of the null hypothesis H0 that is called “type 2 error”. This error can be understood as the power of the test being too low leading to false negative cases. It was shown that positive autocorrelation in time series largely increases the number of type 1 errors, whereas prewhitening procedures increased the number of type 2 errors. Larger lag-1 autocorrelation (ak1) leads to higher percentage of type 1 errors and to larger bias in the Sen’s slope. 

Description of the prewhitening methods:

Five different prewhitening methods can be chosen:
1) PW: simple prewhitening method (Kulkarni and von Stroch, 1995). PW simply removes the lag-1 autocorrelation from the original data. This PW method results in a low amount of type 1 errors, but the existence of real trends, either positive or negative, can lead to an  over-/underestimation of  ak1data, which will reduces the power of the test. 
2) TFPW_Y: trend free prewhitening method (Yue et al., 2002). TFPW_Y remove the autocorrelation on detrended data. TFPW_Y consists of:i) estimating the Sen’s slope βdata on the original data; ii) removing the trend to obtain a detrended time series; iii) removing the lag-1 autocorrelation to  generate a detrended prewhitened time series; and  iv) adding the trend back in to generate the processed time series to evaluate. TFPW-Y restores the power of the test, albeit at the expense of an increase of type 1 errors. 
3) TFPW_WS: trend free prewhitening method (Wang and Swail, 2001). TFPW_WS is an iterative TFPW method to mitigate the adverse effect of trend on the accuracy of the lag-1 autocorrelation estimate. TFPW_WS consist of: : i) removing the lag-1 autocorrelation from the original time series and correcting the prewhitened data for the modified mean; ii) estimating the Sen’s slope on the prewhitened data; iii) removing the trend estimated on the PW data from the original data to obtain a prewhitened detrended time series; and iv) applying iteratively i-iii until the lag-a and slope differences become smaller than a proposed tiny threshold. TFPW_WS restores the low number of type 1 errors without decreasing the power of the test.
4) VCTFPW: variance corrected trend free prewhitening method (Wang et al., 2015). VCTFPW aims order to correct TFPW-Y for both the elevated variance of slope estimators and for the decreased slope caused by the prewhitening. VCTFPW consists of the variance of the original data is restored on the TFPW data. VCTFPW leads to more accurate slope estimators, preserves to some extent the power of the test but only mitigates the type 1 errors.
5) 3PW:  three prewhitening methods (Collaud Coen et al., 2020). 3PW uses PW and TFPW_Y to determine the statistical significance of the Mann-Kendall test and VCTFPW to estimate the Sen's slope. 3PW combines the advantages of the prewhitening method, i.e. the low type 1 error for PW, the high-test power for TFPW-Y and the unbiased slope estimate for VCTFPW. 3PW is defined as the default (???) prewhitening method

A more detailled explanation of these 5 prewhitening methods including equations can be found in Collaud Coen et al. (2020).

Application of the seasonal Mann-Kendall test:

The MK-test for trends is a non-parametric method based on rank. 
- The calculated S statistic is normally distributed for a number of observation N>10 and the significance of the trends is tested by comparing the standardized test statistic Z=S/[var(S)]0.5 with the standard normal variate at the desired significance level. For N≤10, an exact S distribution is applied (see e.g., Gilbert, 1987). The default confidence level for the Mann-Kendall test (alpha_MK) is 95%.
- Hirsch et al. (1982) extend the Mann-Kendall test to take temporal aggregation in the data into account as well as multiple observations for each temporal aggregation. A global or annual trend can be considered only if the trends  are homogeneous at the desired confidence level (Gilbert, 1987). Consequently, the annual trend is reported only if the trends for each temporal aggregation are homogeneous. The default confidence level (alpha_Xhomo) is 90%.
- Confidence limits (CL) are defined as the 100(1-p) percentiles of the standard normal distribution of all the pairwise slopes computed during the Sen’s slope estimator, where p is the chosen confidence limit. The default confidence level of the confidence limits (alpha_CL) is 90%.
- The prewhitening methods are applied only if the first lag autocorrelation coefficient (ak1) is statistically significant (ss) following a normal distribution at the two-sided test at the desired confidence interval. The default confidence level (alpha_ak) is 95%. 
- The lag-1 autocorrelation is computed from the whole time series whatever the temporal aggregation.


References:

M. Collaud Coen, E. Andrews, G. Romanens, G. Martucci and L. Vuilleumier, Effects of the prewhitening method, the time granularity and the time segmentation on the Mann-Kendall trend detection and the associated Sen’s slope, Atm. Meas. Techn. Discuss., https://doi.org/10.5194/amt-2020-178 , submitted, 2020.

Gilbert, R. O.: Statistical Methods for Environmental Pollution Monitoring, Van Nostrand Reinhold Company, New York, 1987.

Hirsch, R. M., Slack, J. R., and Smith, R. A. : Techniques of trend analysis for monthly water quality data, Water Resour. Res., 18,107–121, 1982.

Kulkarni, A., and von Storch, H.: Monte Carlo Experiments on the Effect of Serial Correlation on the Mann- Kendall Test of Trend Monte Carlo experiments on the effect, Meteorologische Zeitschrift, 82–85, 1995.

Sirois, A.: A brief and biased overview of time-series analysis of how to find that evasive trend, WMO/EMEP Workshop on Advanced Statistical Methods and Their Application to Air Quality Data Sets, Annex E., Global Atmosphere Watch No. 133, TD- No. 956, World Meteorological Organization, Geneva, Switzerland, 1998.

Wang, W., Chen, Y., Becker, S., and Liu, B.: Linear trend detection in serially dependent hydrometeorological data based on a variance correction Spearman rho method, Water, 7(12), 7045–7065. https://doi.org/10.3390/w7126673, 2015.

Wang, X. L. and Swail, V. R: Changes of extreme wave heights in Northern Hemisphere oceans and related atmospheric circulation regimes, J. Climate, 14, 2204–2221, https://doi.org/10.1175/1520-0442(2001)014, 2001.

Yue, S., Pilon, P., Phinney, B., and Cavadias, G.: The influence of autocorrelation on the ability to detect trend in hydrological series, Hydrol. Process., 16(9), 1807–1829. https://doi.org/10.1002/hyp.1095, 2002.

