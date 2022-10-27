#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { ISOSEQ3_CLUSTER } from "$moduleDir/modules/nf-core/isoseq3/cluster/main.nf"

workflow test_isoseq3_cluster {

    input = [
            [ id:'test' ], // meta map
            file(params.test_data['homo_sapiens']['pacbio']['refine'], checkIfExists: true),
        ]

    ISOSEQ3_CLUSTER ( input )
}
