function v = MIXED_REPRESENTATION()
  persistent vInitialized;
  if isempty(vInitialized)
    vInitialized = iDynTreeMEX(0, 2);
  end
  v = vInitialized;
end
