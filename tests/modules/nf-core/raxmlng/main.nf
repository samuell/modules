#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { RAXMLNG as RAXMLNG_NO_BOOTSTRAP } from "$moduleDir/modules/nf-core/raxmlng/main.nf"
include { RAXMLNG as RAXMLNG_BOOTSTRAP    } from "$moduleDir/modules/nf-core/raxmlng/main.nf"

//
// Test without bootstrapping
//
workflow test_raxmlng_no_bootstrap {

    input = [ file(params.test_data['sarscov2']['genome']['informative_sites_fas'], checkIfExists: true) ]

    RAXMLNG_NO_BOOTSTRAP ( input )
}

//
// Test with bootstrapping
//
workflow test_raxmlng_bootstrap {

    input = [ file(params.test_data['sarscov2']['genome']['informative_sites_fas'], checkIfExists: true) ]

    RAXMLNG_BOOTSTRAP ( input )
}
