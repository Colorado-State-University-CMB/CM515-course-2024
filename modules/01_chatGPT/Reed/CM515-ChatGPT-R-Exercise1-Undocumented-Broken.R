
library(tidyr)
library(dplyr)
library(pheatmap)
library(vegan)

metadata.df <- as.data.frame(read.csv("Metadata_Exercise1.csv", header = TRUE, row.names = 1))
pres_abs.df <-as.data.frame(read.csv("Gene_data_Exercise1.csv", row.names = 1))

metadata.df$Age_of_Broilers_days <- as.factor(metadata.df$Age_of_Broilers_days)
metadata.df$House_number <- as.factor(metadata.df$House_number)

metadata_subset.df <- data.frame(
  Age_of_Broilers_days = as.factor(metadata.df$Age_of_Broilers_days),
  House_number = as.factor(metadata.df$House_number)
)

rownames(metadata_subset.df) <- rownames(metadata.df)

print(colnames(metadata_subset.df))

pdf(file = "Heatmap.pdf", height = 7.8, width = 7)
pheatmap(
  pres_abs.df[,1:164],
  main = "Ecoli Isolates Heatmap",
  annotation_row = metadata_subset.df,
  cluster_rows = TRUE,
  show_rownames = TRUE,
  cluster_cols = TRUE,
  border_color = NA,
  kmeans_k = NA,
  clustering_method = "average",
  fontsize = 5,
  scale = "none",
  color = c("blue", "red")
)
dev.off()

gene_data <- pres_abs.df[, 1:164]

non_constant_cols <- apply(gene_data, 2, sd) != 0
gene_data <- gene_data[, non_constant_cols]

scaled_gene_data <- scale(gene_data)

pca_result <- prcomp(scaled_gene_data, center = TRUE, scale. = TRUE)

plot(pca_result, type = "l", col = "blue", main = "PCA Analysis")

biplot(pca_result, col = c("blue", "red"), cex = 0.7)

screeplot(pca_result)

summary(pca_result)

pdf(file = "PCA_Biplot.pdf", height = 8, width = 8)
biplot(pca_result, scale = 0, col = c("blue", "red"), cex = 0.7,
       main = "PCA Biplot: Top Two Principal Components")
dev.off()

pdf(file = "PCA.pdf", height = 6, width = 6)
plot(pca_result$x[, 1:2], type = "p", col = "blue", pch = 16, main = "Top Two Principal Components")
dev.off()

metadata_subset.df$Age_of_Broilers_days <- as.numeric(metadata_subset.df$Age_of_Broilers_days)
metadata_subset.df$House_number <- as.numeric(metadata_subset.df$House_number)

correlation_results <- cor(gene_data, metadata_subset.df, method = "pearson")  # You can use "spearman" for Spearman correlation

pdf(file = "Correlation.pdf", height = 10, width = 10)
# Plot heatmap of correlation results using pheatmap
pheatmap(correlation_results, 
         scale = "none",  # You can customize the scaling if needed
         clustering_distance_rows = "euclidean",  # Adjust clustering parameters as needed
         clustering_distance_cols = "euclidean",
         color = colorRampPalette(c("blue", "white", "red"))(100),  # Specify color palette
         main = "Correlation Heatmap")
dev.off()
