nn = create_NN(2, 2, 1);
t = create_training(nn, 0.00000000001, 1, 1000);
pat = xor_pattern(nn.ni);

[nn, J] = train(nn, t, pat);

for item = 1:size(pat,1)
		ao = feed_forward(nn, pat(item, 1:end-1));
		ao
end

e
iteration
figure();
plot(J);
