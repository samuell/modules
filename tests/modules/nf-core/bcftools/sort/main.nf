#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { BCFTOOLS_SORT } from "$moduleDir/modules/nf-core/bcftools/sort/main.nf"

workflow test_bcftools_sort {

    input = [
        [ id:'test' ], // meta map
        file(params.test_data['sarscov2']['illumina']['test_vcf'], checkIfExists: true)
    ]

    BCFTOOLS_SORT ( input )
}
