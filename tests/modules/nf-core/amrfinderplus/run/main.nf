#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { AMRFINDERPLUS_UPDATE } from "$moduleDir/modules/nf-core/amrfinderplus/update/main.nf"
include { AMRFINDERPLUS_RUN } from "$moduleDir/modules/nf-core/amrfinderplus/run/main.nf"

workflow test_amrfinderplus_run {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['haemophilus_influenzae']['genome']['genome_fna_gz'], checkIfExists: true)
    ]

    AMRFINDERPLUS_UPDATE ( )
    AMRFINDERPLUS_RUN ( input, AMRFINDERPLUS_UPDATE.out.db )
}
