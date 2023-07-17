#!/bin/bash                                                                                         
#SBATCH --job-name=messenger_gpt                                                                    
#SBATCH --output=output/%x-%j.out                                                                   
#SBATCH -N 1 #nodes                                                                                 
#SBATCH -n 1 #tasks                                                                                 
#SBATCH --cpus-per-task=8                                                                           
#SBATCH --mem=16G                                                                                   
#SBATCH --time=0-05:00:00                                                                           
#SBATCH --gres=gpu:2                                                                                
                                                                                                       
source ~/.bashrc                                                                                       
conda activate messenger                                                                               
                                                                                                       
home_dir=/n/fs/nlp-kn5378/code/messenger-emma/offline_training                                         
                                                                                                       
cd $home_dir                                                                                           
                                                                                                       
                                                                                                       
for id_embed_dim in 64 128 256; do                                                                     
  for codebook_size 64 128 256; do                                                                     
    for z_channels 64 128 256; do                                                                      
      extra=id_dim_${id_embed_dim}_codebook_size_${codebook_size}_z_channels_${z_channels}             
      python3 -u train_tokenizer.py \                                                                  
                --dataset_path custom_dataset/dataset_transformer_10k_train_500_eval.pickle \          
                --exp_name tokenizer_${extra} \                                                        
                --use_wandb 1 \                                                                        
                --id_embed_dim ${id_embed_dim} \                                                       
                --codebook_size ${codebook_size} \                                                     
                --codebook_embed_dim ${codebook_embed_dim} \                                           
                --z_channels ${z_channels} &                                                           
    done;                                                                                              
  done;                                                                                                
done;                                                                                                  
wait;                                                                                                  
                                                                                                       
exit 0                                                                                                                                 
