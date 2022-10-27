#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { SNPSITES } from "$moduleDir/modules/nf-core/snpsites/main.nf"

workflow test_snpsites {

    input = file(params.test_data['sarscov2']['genome']['all_sites_fas'], checkIfExists: true)

    SNPSITES ( input )
}
