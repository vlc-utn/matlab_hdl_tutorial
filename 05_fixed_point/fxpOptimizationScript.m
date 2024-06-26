model = 'HDLFixedPoint';

sud = 'HDLFixedPoint';

options = fxpOptimizationOptions();

options.AdvancedOptions.UseDerivedRangeAnalysis = true; % Run range analysis as part of range collection.

addTolerance(options, 'HDLFixedPoint/product', 1, 'AbsTol', 1e-06);

result = fxpopt(model, sud, options);

solution = explore(result);

