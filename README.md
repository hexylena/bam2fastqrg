# Bam2FastqRG


## Inputs

### Required inputs
<p name="Bam2FastqRG.samples">
        <b>Bam2FastqRG.samples</b><br />
        <i>Array[SampleDataset] &mdash; Default: None</i><br />
        The samples with an id path.
</p>

### Other common inputs
<p name="Bam2FastqRG.samtoolsTask.filenameFormat">
        <b>Bam2FastqRG.samtoolsTask.filenameFormat</b><br />
        <i>String &mdash; Default: "%!.%."</i><br />
        Format of the filename, the following tokens can be used: %% a literal % sign, %* basename,  %# @RG index, %! @RG ID, %. filename extension for output format
</p>
<p name="Bam2FastqRG.samtoolsTask.unaccountedPath">
        <b>Bam2FastqRG.samtoolsTask.unaccountedPath</b><br />
        <i>String? &mdash; Default: None</i><br />
        The location to write reads to which are not detected as being part of an existing read group.
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="Bam2FastqRG.fastqTask.appendReadNumber">
        <b>Bam2FastqRG.fastqTask.appendReadNumber</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        Append /1 and /2 to the read name, or don't. Corresponds to `-n/N`.
</p>
<p name="Bam2FastqRG.fastqTask.compressionLevel">
        <b>Bam2FastqRG.fastqTask.compressionLevel</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Set compression level when writing gz or bgzf fastq files.
</p>
<p name="Bam2FastqRG.fastqTask.dockerImage">
        <b>Bam2FastqRG.fastqTask.dockerImage</b><br />
        <i>String &mdash; Default: "quay.io/biocontainers/samtools:1.16.1--h6899075_1"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
<p name="Bam2FastqRG.fastqTask.excludeFilter">
        <b>Bam2FastqRG.fastqTask.excludeFilter</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Exclude reads with ONE OR MORE of these flags. Corresponds to `-F`.
</p>
<p name="Bam2FastqRG.fastqTask.excludeSpecificFilter">
        <b>Bam2FastqRG.fastqTask.excludeSpecificFilter</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Exclude reads with ALL of these flags. Corresponds to `-G`.
</p>
<p name="Bam2FastqRG.fastqTask.includeFilter">
        <b>Bam2FastqRG.fastqTask.includeFilter</b><br />
        <i>Int? &mdash; Default: None</i><br />
        Include reads with ALL of these flags. Corresponds to `-f`.
</p>
<p name="Bam2FastqRG.fastqTask.memory">
        <b>Bam2FastqRG.fastqTask.memory</b><br />
        <i>String &mdash; Default: "1GiB"</i><br />
        The amount of memory this job will use.
</p>
<p name="Bam2FastqRG.fastqTask.outputQuality">
        <b>Bam2FastqRG.fastqTask.outputQuality</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        Equivalent to samtools fastq's `-O` flag.
</p>
<p name="Bam2FastqRG.fastqTask.outputRead0">
        <b>Bam2FastqRG.fastqTask.outputRead0</b><br />
        <i>String? &mdash; Default: None</i><br />
        The location the unpaired reads should be written to (in case of paired-end sequenicng).
</p>
<p name="Bam2FastqRG.fastqTask.threads">
        <b>Bam2FastqRG.fastqTask.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        The number of threads to use.
</p>
<p name="Bam2FastqRG.fastqTask.timeMinutes">
        <b>Bam2FastqRG.fastqTask.timeMinutes</b><br />
        <i>Int &mdash; Default: 1 + ceil((size(inputBam) * 2))</i><br />
        The maximum amount of time the job will run in minutes.
</p>
<p name="Bam2FastqRG.outputPrefix">
        <b>Bam2FastqRG.outputPrefix</b><br />
        <i>String &mdash; Default: "."</i><br />
        Where to place the data.
</p>
<p name="Bam2FastqRG.samtoolsTask.compressionLevel">
        <b>Bam2FastqRG.samtoolsTask.compressionLevel</b><br />
        <i>Int &mdash; Default: 1</i><br />
        Set compression level when writing gz or bgzf fastq files.
</p>
</details>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="Bam2FastqRG.samtoolsTask.dockerImage">
        <b>Bam2FastqRG.samtoolsTask.dockerImage</b><br />
        <i>String &mdash; Default: "quay.io/biocontainers/samtools:1.16.1--h6899075_1"</i><br />
        ???
</p>
<p name="Bam2FastqRG.samtoolsTask.memory">
        <b>Bam2FastqRG.samtoolsTask.memory</b><br />
        <i>String &mdash; Default: "1GiB"</i><br />
        ???
</p>
<p name="Bam2FastqRG.samtoolsTask.threads">
        <b>Bam2FastqRG.samtoolsTask.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
</details>

## Outputs
<p name="Bam2FastqRG.bamFiles">
        <b>Bam2FastqRG.bamFiles</b><br />
        <i>Array[File]</i><br />
        The read-group split BAM files.
</p>
<p name="Bam2FastqRG.bamIndex">
        <b>Bam2FastqRG.bamIndex</b><br />
        <i>Array[File]</i><br />
        Indexes for the bam files.
</p>
<p name="Bam2FastqRG.fq_r1">
        <b>Bam2FastqRG.fq_r1</b><br />
        <i>Array[File]</i><br />
        ???
</p>
<p name="Bam2FastqRG.fq_r2">
        <b>Bam2FastqRG.fq_r2</b><br />
        <i>Array[File?]</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.1)
