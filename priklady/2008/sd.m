function R = sd(X,t)
  R = X(t+2)-2*X(t) + X(t-2)
end