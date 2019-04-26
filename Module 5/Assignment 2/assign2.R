 model = lm(PRP ~ MYCT+MMIN+MMAX+CACH+CHMIN+CHMAX,data=training)
> summary(model)
Residuals:
    Min      1Q  Median      3Q     Max 
-208.57  -23.79    6.40   27.43  364.20 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -56.212106   7.906916  -7.109 2.00e-11 ***
MYCT          0.050878   0.017231   2.953  0.00353 ** 
MMIN          0.014960   0.001799   8.316 1.36e-14 ***
MMAX          0.005159   0.000647   7.974 1.14e-13 ***
CACH          0.838788   0.153578   5.462 1.38e-07 ***
CHMIN        -0.541193   0.846229  -0.640  0.52320    
CHMAX         1.646235   0.223711   7.359 4.64e-12 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 58.95 on 201 degrees of freedom
Multiple R-squared:   0.87,     Adjusted R-squared:  0.8661 
F-statistic: 224.1 on 6 and 201 DF,  p-value: < 2.2e-16

cor(training$X,training$MYCT)
[1] -0.1070108

> cor(training$X,training$MMIN)
[1] -0.02839829

> cor(training$X,training$MMAX)
[1] 0.06260811

> cor(training$X,training$CACH)
[1] 0.1134489

> cor(training$X,training$CHMIN)
[1] 0.08857411

> cor(training$X,training$CHMAX)
[1] 0.03212341

> cor(training$X,training$PRP)
[1] 0.0287507

> cor(training$X,training$ERP)
[1] 0.04311519

cor(training$MMIN,training$MYCT)
[1] -0.3370714

> cor(training$MMIN,training$CACH)
[1] 0.6027875

> cor(training$MMIN,training$CHMIN)
[1] 0.5266649

> cor(training$MMIN,training$CHMAX)
[1] 0.2938772

> cor(training$MMIN,training$PRP)
[1] 0.7983105

> cor(training$MMIN,training$ERP)
[1] 0.8231129

>cor(training$MMAX,training$PRP)
[1] 0.8655762

>cor(training$CACH,training$PRP)
[1] 0.7046424

> cor(training$CHMIN,training$PRP)
[1] 0.6088411

> cor(training$CHMAX,training$PRP)
[1] 0.6213091


MMAX has highest correlation value with PRP
PRP has highest correlation value with MMAX

 




