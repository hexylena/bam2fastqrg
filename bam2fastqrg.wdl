version 1.0

# Copyright (c) 2024 Sequencing Analysis Support Core - Leiden University Medical Center

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in 
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import "tasks/samtools.wdl" as samtools

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
                timeMinutes = 1,
        }
    }

    output {
        Array[File] bamFiles = flatten(samtoolsTask.split)
    }

    parameter_meta {
        # input 
        samples: {description: "The samples with an id path.", category: "required"}
        outputPrefix: {description: "Where to place the data.", category: "advanced"}

        # output
        bamFiles: {description: "The read-group split BAM files."}
    }
}

