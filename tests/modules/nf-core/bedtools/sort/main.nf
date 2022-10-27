#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { BEDTOOLS_SORT } from "$moduleDir/modules/nf-core/bedtools/sort/main.nf"

workflow test_bedtools_sort {
    input = [ [ id:'test'],
              file(params.test_data['sarscov2']['genome']['test_bed'], checkIfExists: true)
            ]

    BEDTOOLS_SORT ( input, "testext" )
}
