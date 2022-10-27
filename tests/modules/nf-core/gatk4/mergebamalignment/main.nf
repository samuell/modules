#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { GATK4_MERGEBAMALIGNMENT } from "$moduleDir/modules/nf-core/gatk4/mergebamalignment/main.nf"

workflow test_gatk4_mergebamalignment {
    input    = [ [ id:'test' ], // meta map
                 file(params.test_data['sarscov2']['illumina']['test_single_end_bam'], checkIfExists: true),
                 file(params.test_data['sarscov2']['illumina']['test_unaligned_bam'], checkIfExists: true)
               ]
    fasta    = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    dict     = file(params.test_data['sarscov2']['genome']['genome_dict'], checkIfExists: true)

    GATK4_MERGEBAMALIGNMENT ( input, fasta, dict )
}

workflow test_gatk4_mergebamalignment_stubs {
     input    = [ [ id:'test' ], // meta map
                 file(params.test_data['sarscov2']['illumina']['test_single_end_bam'], checkIfExists: true),
                 file(params.test_data['sarscov2']['illumina']['test_unaligned_bam'], checkIfExists: true)
               ]
    fasta    = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    dict     = file(params.test_data['sarscov2']['genome']['genome_dict'], checkIfExists: true)

    GATK4_MERGEBAMALIGNMENT ( input, fasta, dict )
}
