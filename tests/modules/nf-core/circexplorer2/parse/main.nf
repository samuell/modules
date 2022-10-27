#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { CIRCEXPLORER2_PARSE } from "$moduleDir/modules/nf-core/circexplorer2/parse/main.nf"

workflow test_circexplorer2_parse {

    input = [
        [ id:'fust1_3' ],
        file("https://raw.githubusercontent.com/nf-core/test-datasets/circrna/circexplorer2/fust1_3.Chimeric.out.junction")
    ]

    CIRCEXPLORER2_PARSE ( input )

}
