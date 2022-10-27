#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { PRESEQ_CCURVE } from "$moduleDir/modules/nf-core/preseq/ccurve/main.nf"

workflow test_preseq_ccurve_single_end {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['illumina']['test_paired_end_bam'], checkIfExists: true)
    ]

    PRESEQ_CCURVE ( input )
}

workflow test_preseq_ccurve_paired_end {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['illumina']['test_paired_end_bam'], checkIfExists: true)
    ]

    PRESEQ_CCURVE ( input )
}
