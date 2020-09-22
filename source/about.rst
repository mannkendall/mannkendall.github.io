
Spirit of mannkendall
=====================

A high level description of what the code does.

Data constraints to apply the Mann-Kendall test:

The Mann-Kendall (MK) test associated with the Sen’s slope is the most widely applied non-parametric trend analysis method in atmospheric and hydrologic research (Gilbert, 1987; Sirois, 1998). While it has no requirement on data distribution, it must be applied on serially independent and identically distributed variables. The second condition of homogeneity of distribution is not met if a seasonality is present, but it can be solved by using the seasonal Mann-Kendall test developed by Hirsch et al. (1982). The first condition of independence is not met if the data are autocorrelated. Algorithms were then developed to reduce the impact of the autocorrelation artifacts on the statistical significance of the MK test and on the Sen's slope. Two kinds of algorithms are usually used: (i) the prewhitening of the data to remove the autocorrelation and (ii) inflation of the variance of the trend test statistic to take into account the number of independent measurements instead of the number of data points (the autocorrelation reduces the number of degrees of freedom in tests). This Mann-Kendall package propose several prewhitening methods.

The problem of autocorrelation in the Mann-Kendall test:

The MK-test determines the validity of the null hypothesis H0 of the absence of a trend against the alternative hypothesis H1 of the existence of a monotonic continuous trend. While no assumptions are needed about the data distribution (i.e., the definition of a non-parametric test), the MK-test does require that the data are serially independent, namely the absence of autocorrelation in the time series. Statistical tests are prone to two types of error. The first is an incorrect rejection of the null hypothesis H0 that is called “type 1 error”. This error is related to a too high statistical significance leading to false positive cases. The second is an incorrect acceptance of the null hypothesis H0 that is called “type 2 error”. This error can be understood as the power of the test being too low leading to false negative cases.
The adverse effect of the positive autocorrelation in time series on the number of type 1 errors was suggested by Tiao et al. (1990) and Hamed and Rao (1998) and later simulated (Kulkarni & von Storch, 1995, Zwang and Zwiers, 2004, Blain, 2013, Wang et al., 2015, Hardison et al., 2019). All these studies clearly showed that positive autocorrelation in time series largely increases the number of type 1 errors, whereas prewhitening procedures increased the number of type 2 errors. Larger lag-1 autocorrelation (ak1) leads to higher percentage of type 1 errors and to larger bias in the Sen’s slope. 

Description of the prewhitening methods:

Five different prewhitening methods can be chosen:
1) PW: simple prewhitening method (Kulkarni and 

Application of the seasonal Mann-Kendall test:

The MK-test for trends is a non-parametric method based on rank. 
- The calculated S statistic is normally distributed for a number of observation N>10 and the significance of the trends is tested by comparing the standardized test statistic Z=S/[var(S)]0.5 with the standard normal variate at the desired significance level. For N≤10, an exact S distribution is applied (see e.g., Gilbert, 1987). The default confidence level for the Mann-Kendall test (alpha_MK) is 95%.
- Hirsch et al. (1982) extend the Mann-Kendall test to take seasonality in the data into account as well as multiple observations for each season. A global or annual trend can be considered only if the seasonal trends are homogeneous at the desired confidence level (Gilbert, 1987). Consequently, the annual trend is reported only if the seasonal trends are homogeneous, the default confidence level (alpha_Xhomo) is 90%.
- Confidence limits (CL) are defined as the 100(1-p) percentiles of the standard normal distribution of all the pairwise slopes computed during the Sen’s slope estimator, where p is the chosen confidence limit. The default confidence level of the confidence limits (alpha_CL) is 90%.
- The prewhitening methods are applied only if the first lag autocorrelation coefficient (ak1) is statistically significant (ss) following a normal distribution at the two-sided test at the desired confidence interval. The default confidence level (alpha_ak) is 95% . 


References:
Gilbert, R. O.: Statistical Methods for Environmental Pollution Monitoring, Van Nostrand Reinhold Company, New York, 1987.
Hirsch, R. M., Slack, J. R., and Smith, R. A. : Techniques of trend analysis for monthly water quality data, Water Resour. Res., 18,107–121, 1982.
Kulkarni, A., and von Storch, H.: Monte Carlo Experiments on the Effect of Serial Correlation on the Mann- Kendall Test of Trend Monte Carlo experiments on the effect, Meteorologische Zeitschrift, 82–85, 1995.
Sirois, A.: A brief and biased overview of time-series analysis of how to find that evasive trend, WMO/EMEP Workshop on Advanced Statistical Methods and Their Application to Air Quality Data Sets, Annex E., Global Atmosphere Watch No. 133, TD- No. 956, World Meteorological Organization, Geneva, Switzerland, 1998.
Wang, W., Chen, Y., Becker, S., and Liu, B.: Linear trend detection in serially dependent hydrometeorological data based on a variance correction Spearman rho method, Water, 7(12), 7045–7065. https://doi.org/10.3390/w7126673, 2015.
Wang, X. L. and Swail, V. R: Changes of extreme wave heights in Northern Hemisphere oceans and related atmospheric circulation regimes, J. Climate, 14, 2204–2221, https://doi.org/10.1175/1520-0442(2001)014, 2001.
Yue, S., Pilon, P., Phinney, B., and Cavadias, G.: The influence of autocorrelation on the ability to detect trend in hydrological series, Hydrol. Process., 16(9), 1807–1829. https://doi.org/10.1002/hyp.1095, 2002.
