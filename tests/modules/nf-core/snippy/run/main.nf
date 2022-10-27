#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { SNIPPY_RUN } from "$moduleDir/modules/nf-core/snippy/run/main.nf"

workflow test_snippy_run {

    input = [ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ]
            ]
    reference = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)

    SNIPPY_RUN ( input, reference )
}
