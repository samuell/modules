#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { MSISENSOR2_SCAN } from "$moduleDir/modules/nf-core/msisensor2/scan/main.nf"

workflow test_msisensor2_scan {

    input = [
        file(params.test_data['homo_sapiens']['genome']['genome_fasta'], checkIfExists: true),
        file(params.test_data['homo_sapiens']['genome']['genome2_fasta'], checkIfExists: true)
    ]

    MSISENSOR2_SCAN ( input, "outputfile" )
}
