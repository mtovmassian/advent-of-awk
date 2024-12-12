{
  vals_l[NR] = $1;
  vals_r_count[$2] += 1;
}
END { 
  similarity_score = 0;
  for (i = 1;i <= NR; i++) {
    val = vals_l[i];
    val_count = vals_r_count[val] ? vals_r_count[val] : 0;
    # print val" "val_count;
    similarity_score += val * val_count;
  }
  print similarity_score;
}