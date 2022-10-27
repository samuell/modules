#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { BISCUIT_INDEX                         } from "$moduleDir/modules/nf-core/biscuit/index/main.nf"
include { BISCUIT_BLASTER as BISCUIT_BLASTER_SE } from "$moduleDir/modules/nf-core/biscuit/biscuitblaster/main.nf"
include { BISCUIT_BLASTER as BISCUIT_BLASTER_PE } from "$moduleDir/modules/nf-core/biscuit/biscuitblaster/main.nf"

// Single-end test
workflow test_biscuit_blaster_single {

    input = [ [ id:'test' ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_methylated_1_fastq_gz'], checkIfExists: true) ]
            ]
    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)

    BISCUIT_INDEX ( fasta )
    BISCUIT_BLASTER_SE (input, BISCUIT_INDEX.out.index )
}

// paired-end test
workflow test_biscuit_blaster_paired {

    input = [ [ id:'test' ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_methylated_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_methylated_2_fastq_gz'], checkIfExists: true) ]
            ]
    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)

    BISCUIT_INDEX ( fasta )
    BISCUIT_BLASTER_PE (input, BISCUIT_INDEX.out.index )
}
