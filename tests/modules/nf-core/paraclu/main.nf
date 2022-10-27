#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { PARACLU } from "$moduleDir/modules/nf-core/paraclu/main.nf"

workflow test_paraclu {

    input = [[  id:'test' ], // meta map
                file(params.test_data['sarscov2']['genome']['test_bed'], checkIfExists: true)
                ]
    min_cluster = 30

    PARACLU ( input, min_cluster )
}
