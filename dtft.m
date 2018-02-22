function y = dtft(x, kx, omega)
N = length(x);
M = length(kx);
if N ~= M
    error('Error: index and vector length must be equal.');
end
y=0;
y = sum(x.*exp(-1i*omega*kx));

% Explain how this alternative implementation works. Vectorization