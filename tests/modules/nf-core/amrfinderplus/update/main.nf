#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { AMRFINDERPLUS_UPDATE } from "$moduleDir/modules/nf-core/amrfinderplus/update/main.nf"

workflow test_amrfinderplus_update {

    AMRFINDERPLUS_UPDATE ( )

}
