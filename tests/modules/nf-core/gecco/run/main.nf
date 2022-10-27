#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { GECCO_RUN } from "$moduleDir/modules/nf-core/gecco/run/main.nf"

workflow test_gecco_run {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['candidatus_portiera_aleyrodidarum']['genome']['genome_fasta'], checkIfExists: true),
        []
    ]
    model_dir = []

    GECCO_RUN ( input, model_dir )
}
