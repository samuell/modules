
process GRIDSS_GENERATEPONBEDPE {
    tag "$meta.id"
    label 'process_single'

    conda "bioconda::gridss=2.13.2"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/gridss:2.13.2--h270b39a_0':
        'quay.io/biocontainers/gridss:2.13.2--h270b39a_0'  }"

    input:
    tuple val(meta), path(vcf)
    tuple val(meta), path(bed)
    tuple val(meta), path(bedpe)
    tuple val(id1), path(fasta)
    tuple val(id2), path(fasta_fai)
    tuple val(id3), path(bwa_index)

    output:
    tuple val(meta), path("*_pon_breakpoint.bedpe")   , emit: pbed
    tuple val(meta), path("*_pon_single_breakend.bed"), emit: pbedpe
    path "versions.yml"                               , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"
    def VERSION = '2.13.2' // WARN: Version information not provided by tool on CLI. Please update this string when bumping container versions.
    def input_vcf   = vcf ? "INPUT=${vcf}" : ""
    def input_bed   = bed ? "INPUT_BED=${bed}" : ""
    def input_bedpe = bedpe ? "INPUT_BEDPE=${bedpe}" : ""
    def bwa = bwa_index ? "cp -s ${bwa_index}/* ." : ""

    """
    ${bwa}

    /usr/local/share/gridss-2.13.2-0/GeneratePonBedpe \\
        $input_vcf \\
        $input_bed \\
        $input_bedpe \\
        O=${prefix}_pon_breakpoint.bedpe \\
        SBO=${prefix}_pon_single_breakend.bed \\
        R=${fasta} \\
        THREADS=${task.cpus} \\
        $args

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        gridss: ${VERSION}
    END_VERSIONS
    """

    stub:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"
    def VERSION = '2.13.2' // WARN: Version information not provided by tool on CLI. Please update this string when bumping container versions.
    """
    touch ${prefix}_pon_breakpoint.bedpe
    touch ${prefix}_pon_single_breakend.bed

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        gridss: ${VERSION}
    END_VERSIONS
    """

}
