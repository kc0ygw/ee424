clear
clc


syms p;
u = .1;

ixy = (1-u)*(p*log2(1/p)+(1-p)*log2(1/(1-p)));

ixz1 = (p-u*p/2)*log2(((1-u)*p+(u/2))/(p*(1-u/2)));
ixz2 = (u/2)*(1-p)*log2(((1-u)*p + (u/2))/((1-u/2)*p));
ixz3 = (p*u/2)*log2((p*(1-u)+(u/2))/((u/2)*(1-p)));
ixz4 = (1-u/2)*(1-p)*log2((p*(u-1)-(u/2)+1)/((1-u/2)*(1-p)));

ixz = ixz1 + ixz2 + ixz3 + ixz4;

Capacity = ixy-ixz;

figure(1)
fplot(Capacity, [0 1])
title('Capacity')

figure(2)
subplot(211)
fplot(ixy, [0 1])
title('I(X;Y)')
subplot(212)
fplot(ixz, [0 1])
title('I(X;Z)')