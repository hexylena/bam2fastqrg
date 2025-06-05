version 1.0

# Copyright (c) 2025 Sequencing Analysis Support Core - Leiden University Medical Center
# Licensed: EUPL-1.2 
# https://interoperable-europe.ec.europa.eu/collection/eupl/eupl-text-eupl-12


import "tasks/samtools.wdl" as samtools
import "tasks/biopet.wdl" as biopet

struct SampleDataset {
    String id
    File file
}

workflow Bam2FastqRG {
    input {
        Array[SampleDataset] samples
        String outputPrefix = "."
    }

    scatter (sample in samples) {
        String sampleDir = "~{outputPrefix}/~{sample.id}"

        call samtools.Split as samtoolsTask {
            input:
                inputBam = sample.file,
                outputPath = sampleDir,
        }

        scatter (bam in samtoolsTask.splitBam) {
            call samtools.Quickcheck as quickCheckTask {
                input:
                    inputBam = bam,
            }

            call samtools.Fastq as fastqTask {
                input:
                    inputBam = quickCheckTask.outputBam,
                    outputRead1 = sampleDir + "/fastq/" + basename(bam, ".bam") + '_R1.fastq.gz',
                    outputRead2 = sampleDir + "/fastq/" + basename(bam, ".bam") + '_R2.fastq.gz',
                    outputRead0 = sampleDir + "/fastq/" + basename(bam, ".bam") + '_R0.fastq.gz',
                    outputReadS = sampleDir + "/fastq/" + basename(bam, ".bam") + '_RS.fastq.gz',
            }

            call biopet.ValidateFastq as validateFastqTask {
                input:
                    inputRead1 = fastqTask.read1,
                    inputRead2 = fastqTask.read2,
            }
        }
    }

    output {
        Array[File] bamFiles = flatten(samtoolsTask.splitBam)
        Array[File] bamIndex = flatten(samtoolsTask.splitBamIndex)
        Array[File] fq_r1 = flatten(fastqTask.read1)
        Array[File?] fq_r2 = flatten(fastqTask.read2)
    }

    parameter_meta {
        # input
        samples: {description: "The samples with an id path.", category: "required"}
        outputPrefix: {description: "Where to place the data.", category: "advanced"}

        # output
        bamFiles: {description: "The read-group split BAM files."}
        bamIndex: {description: "Indexes for the bam files."}
    }
}
