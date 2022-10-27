#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { MERYL_COUNT     } from "$moduleDir/modules/nf-core/meryl/count/main.nf"
include { MERYL_HISTOGRAM } from "$moduleDir/modules/nf-core/meryl/histogram/main.nf"

workflow test_meryl_histogram {

    input = [
        [ id:'test' ], // meta map
        file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true)
    ]

    MERYL_COUNT ( input )
    MERYL_HISTOGRAM ( MERYL_COUNT.out.meryl_db )
}
