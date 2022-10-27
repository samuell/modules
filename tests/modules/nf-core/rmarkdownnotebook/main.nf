#!/usr/bin/env nextflow

nextflow.enable.dsl = 2
moduleDir = launchDir

include { RMARKDOWNNOTEBOOK } from "$moduleDir/modules/nf-core/rmarkdownnotebook/main.nf"
include { RMARKDOWNNOTEBOOK as RMARKDOWNNOTEBOOK_PARAMETRIZE } from "$moduleDir/modules/nf-core/rmarkdownnotebook/main.nf"

workflow test_rmarkdown {

    input = [ [ id:'test_rmd' ], // meta map
              file(params.test_data['generic']['notebooks']['rmarkdown'], checkIfExists: true) ]

    RMARKDOWNNOTEBOOK ( input, [:], [])

}

workflow test_rmarkdown_parametrize {

    input = [ [ id:'test_rmd' ], // meta map
              file(params.test_data['generic']['notebooks']['rmarkdown'], checkIfExists: true) ]

    RMARKDOWNNOTEBOOK_PARAMETRIZE(
        input,
        [input_filename: "hello.txt", n_iter: 12],
        file(params.test_data['generic']['txt']['hello'], checkIfExists: true)
    )

}

