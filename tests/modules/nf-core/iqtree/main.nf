#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { IQTREE } from "$moduleDir/modules/nf-core/iqtree/main.nf"

workflow test_iqtree {

    input = [ file(params.test_data['sarscov2']['genome']['informative_sites_fas'], checkIfExists: true) ]

    IQTREE ( input, '' )
}
