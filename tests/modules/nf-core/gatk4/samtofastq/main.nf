#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { GATK4_SAMTOFASTQ } from "$moduleDir/modules/nf-core/gatk4/samtofastq/main.nf"

workflow test_gatk4_samtofastq_single_end {
    input = [ [ id:'test', single_end: true ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_single_end_bam'], checkIfExists: true) ]
            ]

    GATK4_SAMTOFASTQ ( input )
}

workflow test_gatk4_samtofastq_paired_end {
    input = [ [ id:'test', single_end: false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_paired_end_bam'], checkIfExists: true) ]
            ]

    GATK4_SAMTOFASTQ ( input )
}

workflow test_gatk4_samtofastq_paired_end_stubs {
    input = [ [ id:'test', single_end: true ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_single_end_bam'], checkIfExists: true) ]
            ]

    GATK4_SAMTOFASTQ ( input )
}
