#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { NEXTCLADE_DATASETGET } from "$moduleDir/modules/nf-core/nextclade/datasetget/main.nf"

workflow test_nextclade_datasetget {

    dataset = 'sars-cov-2'
    reference = 'MN908947'
    tag = '2022-01-18T12:00:00Z'

    NEXTCLADE_DATASETGET ( dataset, reference, tag )

}
