#!/usr/bin/env bash
#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBATCH --time=2:00:00
#SBATCH --qos=normal
#SBATCH --partition=amilan
#SBATCH --job-name=create-bash-kernel
#SBATCH --output=%x.%j.log # gives slurm.ID.log
set -e # dont proceed if there is an error
echo "[$0] $SLURM_JOB_NAME $@" # log the command line
export TMPDIR=$SLURM_SCRATCH
export TMP=$TMPDIR
date # timestamp
EID=${USER%%@*}

if [ -z "$SLURM_JOBID" ]
then
    echo "$0: create a conda environment and bash jupyter kernel at the same time."
    echo "USAGE: sbatch $0 conda_environment pkg1 pkg2 pkg3"
    echo "Example: sbatch $0 rnaseq-kernel fastp bwa hisat2 bedtools samtools subread deeptools"
    exit
fi

## replace with your environment name and packages to install
#ENV_NAME="rnaseq-kernel"
#TO_INSTALL="fastp bwa hisat2 bedtools samtools subread deeptools"
ENV_NAME=$1
shift
TO_INSTALL="$@"

module load mambaforge

if ! conda config --show channels | grep -qw bioconda
then
    conda config --add channels bioconda
fi

conda create -n $ENV_NAME --yes -v
conda install -n $ENV_NAME -c conda-forge jupyterlab bash_kernel ${TO_INSTALL} --yes -v

# finish installing the bash kernel
conda activate $ENV_NAME
python -m bash_kernel.install

# create configuration files/directories
CONFIGPATH=/home/$USER/.local/share/jupyter/kernels/${ENV_NAME}
mkdir -p $CONFIGPATH


# again, where is their project dir?
PROJ_DIR=/projects/.colostate.edu/${EID}

if ! [ -e ${PROJ_DIR} ]
then
    PROJ_DIR=/projects/$USER
fi


(
cat <<END_HEREDOC
{
"argv": [
"${PROJ_DIR}/software/anaconda/envs/${ENV_NAME}/bin/python",
"-m",
"bash_kernel",
"-f",
"{connection_file}"
],
"display_name": "${ENV_NAME}",
"language": "bash"
}

END_HEREDOC
) > $CONFIGPATH/kernel.json


echo "done."
echo "View configuration in $CONFIGPATH"
echo "You may now launch jupyterlab from ondemand and $ENV_NAME will appear as an option to notebooks and consoles."
echo "You can make a custom logo by transferring logo32x32.png and log64x64.png to $CONFIGPATH"
